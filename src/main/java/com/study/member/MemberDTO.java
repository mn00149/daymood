package com.study.member;

import lombok.Data;

@Data
public class MemberDTO {
	private int user_no; 			
	private String username;
	private String email 	;
	private String password;
	private String nation 	;
	private String createDate; 			
	private String role; 					
	
}
