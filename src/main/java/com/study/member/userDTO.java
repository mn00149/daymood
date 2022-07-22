package com.study.member;

import java.util.List;

import lombok.Data;

@Data
public class userDTO {
private int user_no 	;				
private String username ;					
private String email 	;					
private String password ;					
private String nation 	;					
private String createDate; 					
private String role 		;	
private List<friendDTO> flist;
private List<requestDTO> rlist;

}
