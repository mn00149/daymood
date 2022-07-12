package com.study.daymood;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages= {"com.study.*"})
public class DaymoodApplication {

	public static void main(String[] args) {
		SpringApplication.run(DaymoodApplication.class, args);
	}

}
