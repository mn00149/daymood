package com.study.daymood;
 
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServlet;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import com.ckfinder.connector.ConnectorServlet;
 
@Configuration
@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
public class ServletRegister {
  //CKEditor 서블릿 등록
  @Bean
  public ServletRegistrationBean<HttpServlet> getConnectorServlet() {
    ServletRegistrationBean<HttpServlet> registrationBean = new ServletRegistrationBean<HttpServlet>(
        new ConnectorServlet());
    registrationBean.addUrlMappings("/ckfinder/core/connector/java/connector.java"); // 접근 주소
    Map<String, String> params = new HashMap<String, String>();
    params.put("XMLConfig", "/WEB-INF/ckfinder-config.xml");
    params.put("debug", "false");
    registrationBean.setInitParameters(params);
    registrationBean.setLoadOnStartup(1);
    return registrationBean;
  }
}