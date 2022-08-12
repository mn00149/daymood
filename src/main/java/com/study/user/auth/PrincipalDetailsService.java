package com.study.user.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.study.user.UserDTO;
import com.study.user.UserService;

//시큐리티 설정에서 loginProcessingUrl("/login")
// /login 요청이 오면 자동으로 UserDetailsService 타입으로 Ioc 되어 있는 loadUserByUsername 함수가 실행
@Service
public class PrincipalDetailsService implements UserDetailsService {
  
  @Autowired
  @Qualifier("com.study.user.UserServiceImpl")
  private UserService service;
  //시큐리티 session(내부 <= Authentication(내부 <= UserDetails))
  @Override
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    System.out.println("username:"+username);
    UserDTO userEntity = service.findByUsername(username);
    if(userEntity != null) {
      return new PrincipalDetails(userEntity);
    }
    return null;
  }

}
