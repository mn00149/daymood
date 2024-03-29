package com.study.user;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import java.security.Principal;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.user.auth.PrincipalDetails;

@Controller
public class UserController {
  @Autowired
  @Qualifier("com.study.user.UserServiceImpl")
  private UserService service;

  @Autowired
  @Qualifier("com.study.user.SendEmailServiceImpl")
  private SendEmailService eservice;

  @Autowired
  private BCryptPasswordEncoder bCryptPasswordEncoder;

  // Oauth 로그인을 해도 일반로그인을 해도 => PrincipalDetails
  //
  @GetMapping("/user")
  public String user(@AuthenticationPrincipal PrincipalDetails principalDetails) {
    System.out.println("principalDetails:" + principalDetails.getUser());

    return "user";
  }

  // 스프링 시큐리티가 낚아챔-SecurityConfig작성 후 낚아체는 현상 없어짐!!
  @GetMapping("/loginForm")
  public String loginForm(@RequestParam(value = "error", required = false) String error,
      @RequestParam(value = "exception", required = false) String exception, Model model) {
    model.addAttribute("error", error);
    model.addAttribute("exception", exception);
    /* logger.info("loginForm view resolve"); */
    return "/user/loginForm";
  }

  @PostMapping("/join")
  public String join(UserDTO user) {
    System.out.println(user);

    user.setRole("ROLE_USER");
    user.setUser_image("/images/avatar.png");

    String rawPassword = user.getPassword();
    String encPassword = bCryptPasswordEncoder.encode(rawPassword);
    user.setPassword(encPassword);
    int result = service.create(user);
    // userRepository.save(user);//회원 가입잘됨 but 시큐리티 못씀 => 비번이 암호화 되지 않았기 때문
    return "/user/loginForm";
  }

  @GetMapping("/joinForm")
  public String joinForm() {

    return "/user/joinForm";
  }

  @GetMapping("/test/oauth/login")
  public @ResponseBody String testOauthLogin(Authentication authentication, @AuthenticationPrincipal OAuth2User oauth) {// DI
    System.out.println("테스트Oauth로그인===================================");
    OAuth2User oauth2User = (OAuth2User) authentication.getPrincipal();
    System.out.println("authentication" + oauth2User.getAttributes());
    System.out.println("oauth2User" + oauth.getAttributes());

    return "Oauth세션";
  }

  @GetMapping("/findPassword")
  public String findPwd() {
    return "user/findPassword";
  }
  
  @GetMapping(value = "/usernamecheck", produces = "application/json;charset=utf-8")
  @ResponseBody
  public Map<String, String> usernameCheck(@RequestParam("username") String username) {

    int cnt = service.duplicatedUsername(username);

    Map<String, String> map = new HashMap<String, String>();
    if (cnt > 0) {
      map.put("str", username + "는 중복되어서 사용할 수 없습니다.");
      map.put("result", "no");
    } else {
      map.put("str", username + "는 중복아님, 사용가능합니다.");
      map.put("result", "ok");
    }
    return map;
  }
  
  @GetMapping(value = "/emailcheck", produces = "application/json;charset=utf-8")
  @ResponseBody
  public Map<String, String> emailCheck(@RequestParam("email") String email) {

    int cnt = service.duplicatedEmail(email);

    Map<String, String> map = new HashMap<String, String>();
    if (cnt > 0) {
      map.put("str", email + "는 중복되어서 사용할 수 없습니다.");
      map.put("result", "no");
    } else {
      map.put("str", email + "는 중복아님, 사용가능합니다.");
      map.put("result", "ok");
    }
    return map;
  }

  // Email과 name의 일치여부를 check하는 컨트롤러
  @GetMapping("/check/findPw")
  public @ResponseBody Map<String, Boolean> pw_find(String email, String username) {
    Map<String, Boolean> json = new HashMap<>();
    boolean pwFindCheck = service.userEmailCheck(email, username);

    System.out.println(pwFindCheck);
    json.put("check", pwFindCheck);
    return json;
  }

  // 등록된 이메일로 임시비밀번호를 발송하고 발송된 임시비밀번호로 사용자의 pw를 변경하는 컨트롤러

  @PostMapping("/check/findPw/sendEmail")
  public @ResponseBody void sendEmail(@RequestBody UserDTO user) {
    String username = user.getUsername();
    String email = user.getEmail();
    System.out.println("============================");
    System.out.println(username);
    System.out.println(email);
    MailDTO dto = eservice.createMailAndChangePassword(email, username);
    eservice.mailSend(dto);

  }
  //회원 탈퇴 컨트롤러
  @GetMapping("/user/deleteUser")
  public String deleteUserForm(@AuthenticationPrincipal PrincipalDetails userDetails, Model model) {
    model.addAttribute("username", userDetails.getUsername());
    
    return "user/deleteUser";
  }
  
  @PostMapping("/user/deleteUser")
  public @ResponseBody Map<String, String> deleteUser(@AuthenticationPrincipal PrincipalDetails userDetails, HttpServletRequest request) {
    String username = userDetails.getUsername();
    String password = request.getParameter("password");
    String encPassword = bCryptPasswordEncoder.encode(password);
    
    boolean passwordIsChecked = service.checkPassword(username, password);
   
    Map<String, String> map = new HashMap<String, String>();
    if(passwordIsChecked) {
      service.deleteUser(username);
      map.put("str", "회원 탈퇴에 성공 하셨습니다 그동안 이용해 주셔서 감사합니다");
      map.put("result", "ok");
    }else {
      map.put("str", "입력 해주신 password가 다릅니다");
      map.put("result", "no");
    }
    return map;
  }
  
  //password 변경 컨트롤러
  @GetMapping("/user/updatePassword")
  public String updatePasswordForm(@AuthenticationPrincipal PrincipalDetails userDetails, Model model) {
    model.addAttribute("username", userDetails.getUsername());
    
    return "user/updatePassword";
  }
  
  @PostMapping("/user/updatePassword")
  public @ResponseBody Map<String, String> updatePassword(@AuthenticationPrincipal PrincipalDetails userDetails, HttpServletRequest request) {
    String oldPassword = request.getParameter("oldPassword");
    String newPassword = request.getParameter("updatePassword");
    boolean passwordExixt = bCryptPasswordEncoder.matches(oldPassword, userDetails.getPassword());
    String username = userDetails.getUsername();
    UserDTO user = service.findByUsername(username);
    Map<String, String> map = new HashMap<String, String>();
    if(passwordExixt) {
      String encPassword = bCryptPasswordEncoder.encode(newPassword);
      user.setPassword(encPassword);
      service.updatePassword(user);
      
      map.put("str", "비밀번호 변경 성공 ");
      map.put("result", "ok");
    }else {
      map.put("str", "존제하지 않는 password 입니다");
      map.put("result", "no");
    }
    return map;
  }

  @GetMapping("/test/login")
  public @ResponseBody String testLogin(Authentication authentication, @AuthenticationPrincipal PrincipalDetails userDetails) {// DI
    System.out.println("테스트로그인===================================");
    PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
    System.out.println("authentication" + principalDetails.getUser());
    System.out.println("userDetails:" + userDetails.getUser());
    return "세션";
  }

  @Secured("ROLE_ADMIN")

  @GetMapping("/info")
  public @ResponseBody String info() {
    return "개인정보";
  }

  @PreAuthorize("hasRole('ROLE_MANAGER') or hasRole('ROLE_ADMIN')")
  @GetMapping("/data")
  public @ResponseBody String data() {
    return "data";
  }

}
