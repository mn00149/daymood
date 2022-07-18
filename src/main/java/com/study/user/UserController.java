package com.study.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {
  @Autowired
  @Qualifier("com.study.user.UserServiceImpl")
  private UserService service;

  @Autowired
  private BCryptPasswordEncoder bCryptPasswordEncoder;

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
    String rawPassword = user.getPassword();
    String encPassword = bCryptPasswordEncoder.encode(rawPassword);
    user.setPassword(encPassword);
    int result = service.create(user);
    // userRepository.save(user);//회원 가입잘됨 but 시큐리티 못씀 => 비번이 암호화 되지 안았기 때문
    return "/user/loginForm";
  }

  @GetMapping("/joinForm")
  public String joinForm() {

    return "/user/joinForm";
  }

}
