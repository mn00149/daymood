package com.study.user.oauth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.study.user.UserDTO;
import com.study.user.UserService;
import com.study.user.auth.PrincipalDetails;

@Service
public class PrincipalOauth2UserService extends DefaultOAuth2UserService {
  @Autowired
  private BCryptPasswordEncoder bCryptPasswordEncoder;
  
  @Autowired
  @Qualifier("com.study.user.UserServiceImpl")
  private UserService service;
  //구글로부터 받은 userRequest 데이터에 대한 후처리되는 함수
  @Override
  public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
    OAuth2User oauth2User = super.loadUser(userRequest);
    //구글로그인 버튼 클릭 -> 구글로그인 창 -> code를 리턴(Oauth-client라이브러리) -> AccessToken요청
    //userRequest정보->loadUser함수 호출->구글로부터 회원프로필을 받음
    System.out.println("userRequest:"+userRequest);
    System.out.println("getAttribute:"+super.loadUser(userRequest).getAttributes());
    //회원가입을 강제로 진행할 예정
    String provider = userRequest.getClientRegistration().getRegistrationId();//google RegistrationId로 어떤 oauth로 로그인했는지 확인 가능
    String username = oauth2User.getAttribute("email");
    String password = bCryptPasswordEncoder.encode("오인웅짱");
    String email = oauth2User.getAttribute("email");
    String user_image = oauth2User.getAttribute("picture");
    String role = "ROLE_USER";
    String nation = "기타";
    
    UserDTO userEntity = service.findByUsername(username);
    
    if(userEntity == null) {
      System.out.println("구글로그인이 최초입니다");
      userEntity = UserDTO.builder()
          .username(username)
          .password(password)
          .email(email)
          .role(role)
          .provider(provider)
          .nation(nation)
          .user_image(user_image)
          .build();
      service.create(userEntity);
    }else {
      System.out.println("구글로그인이 이미 되어있습니다");
      
    }
    
  
    return new PrincipalDetails(userEntity, oauth2User.getAttributes());
  }

  
}
