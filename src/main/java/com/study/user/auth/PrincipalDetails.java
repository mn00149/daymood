package com.study.user.auth;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import com.study.user.UserDTO;

import lombok.Data;



//시큐리티가 /login 주소 요청이오면 낚아체서 로그인을 진행
//로그인 진행이 완료되면 시큐리티 session을 만듬(Security ContextHolder)
//오브젝트 타입 => Authentication 타입 객체
//User 오브젝트 타입 => UserDetails 타입객체

//Security Session => Authentication => UserDetails(PrincipalDetails)
@Data
public class PrincipalDetails implements UserDetails, OAuth2User{
  
  private UserDTO user;//콤포지션
  private Map<String, Object> attributes;
  //일반 로그인
  public PrincipalDetails(UserDTO user) {
    this.user = user;
  }
  
  //Oauth 로그인
  public PrincipalDetails(UserDTO user, Map<String, Object> attributes) {
    
    this.user = user;
    this.attributes = attributes;
    
  }
  //해당유저의 권한을 리턴
  @Override
  public Collection<? extends GrantedAuthority> getAuthorities() {
    Collection<GrantedAuthority> collect = new ArrayList<>();
    collect.add(new GrantedAuthority() {
      
      @Override
      public String getAuthority() {
        // TODO Auto-generated method stub
        return user.getRole();
      }
    });
    return collect;
  }

  @Override
  public String getPassword() {
    // TODO Auto-generated method stub
    return user.getPassword();
  }

  @Override
  public String getUsername() {
    // TODO Auto-generated method stub
    return user.getUsername();
  }
  
  
  public int getUserno() {
	  // TODO Auto-generated method stub
	  return user.getUser_no();
  }

  @Override
  public boolean isAccountNonExpired() {
    // TODO Auto-generated method stub
    return true;
  }

  @Override
  public boolean isAccountNonLocked() {
    // TODO Auto-generated method stub
    return true;
  }

  @Override
  public boolean isCredentialsNonExpired() {
    // TODO Auto-generated method stub
    return true;
  }

  @Override
  public boolean isEnabled() {
    // 우리사이트에서 회원이 1년동안 로그인이 안되었다면 휴면계정으로 쓸때
    //현제시간 - 로그인시간 > 1년 => false반환 
    return true;
  }
  @Override
  public Map<String, Object> getAttributes() {
    // TODO Auto-generated method stub
    return attributes;
  }
  @Override
  public String getName() {
    // TODO Auto-generated method stub
    return null;
  }
 
}
