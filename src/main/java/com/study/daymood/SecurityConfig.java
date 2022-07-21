package com.study.daymood;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.study.user.LoginFailHandler;
import com.study.user.oauth.PrincipalOauth2UserService;

@Configuration
@EnableWebSecurity//스프링 시큐리티 필터가 스프링 필터체인에 등록
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {
  
  @Autowired
  private PrincipalOauth2UserService principalOauth2UserService;

	//빈등록-> 해당 메서드의 리턴되는 오브젝트를 ioc에 들록 해준다
	@Bean
	public BCryptPasswordEncoder encodePwd() {
		return new BCryptPasswordEncoder();
	}
	
  @Bean
  public LoginFailHandler loginFailHandler(){
      return new LoginFailHandler();
  }
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();//csrf 비활성화
		http.authorizeRequests()
			.anyRequest().permitAll()//위의 설정 이외엔 다허용, 권한이 없는 페이지에 접근시 403이 뜬다
			.and()//밑의 설정을 통해 권한없는 페이지 접근시 로그인 페이지로 이동
			.formLogin()
			.loginPage("/loginForm")
			.loginProcessingUrl("/login")//login주소가 호출이 되면 시큐리티가 낚아채서 로그인을 진행 => 즉 따로 로그인처리하는 controller를 만들 필요 없다
			.defaultSuccessUrl("/")
			.failureHandler(loginFailHandler())//로그인 실패 시 처리하는 핸들러 등록.;
			.and()
      .oauth2Login()
      .loginPage("/loginForm") 
      .userInfoEndpoint()
      .userService(principalOauth2UserService);//구글로그인 후 뒤의 후처리가 필요 tip(코드X, 엑세스토큰+사용자 정보 받음)
  
	}

	
}
