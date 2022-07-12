package com.study.daymood;
 
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


 
@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {
  /*
   *  View 페이지에서 이미지 보이도록 함
  - Spring Boot가 OS의 특정 폴더에 접근 가능하도록 설정
   - list, read view 페이지 에서 볼수 없음: 보안 문제로 인하여 이미지에 접근 할 수 없음
   */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Windows: path = "C:/aistudy/deploy/shopping/contents/storage";
        // ▶ file:///C:/aistudy/deploy/shopping/contents/storage
        // Ubuntu: path = "/home/ubuntu/deploy/shopping/contents/storage";
        // ▶ file:////home/ubuntu/deploy/shopping/contents/storage
        // JSP 인식되는 경로: http://localhost:8000/contents/storage";
        //registry.addResourceHandler("/contents/storage/**")
        //.addResourceLocations("file:///" + UploadCon.getUploadDir());
        
        //registry.addResourceHandler("/member/storage/**")
        //         .addResourceLocations("file:///" + UploadMem.getUploadDir());
    }
 
}