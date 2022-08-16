package com.study.board;

import java.net.URLEncoder;

public class NaverCrawlerMain {
  
	public static void main(String[] args) {
	
	  // NaverCrawler를 호출
	String id = "HmFQZMRJn2mtrXjmCOgR";
    String secret = "oi3E1Y6Zti";
        
        try {
	        NaverCrawler crawler = new NaverCrawler();
	        String url = URLEncoder.encode("아이언", "UTF-8"); 
	        String response = crawler.search(id, secret, url); // 검색 결과를 String 형태로 받아 response 변수에 넣어줌
	        System.out.println(response);	        
        } catch (Exception e) {
        	e.printStackTrace();
        }
	}
}