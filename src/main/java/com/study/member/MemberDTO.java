package com.study.member;

import java.util.List;

import lombok.Data;
@Data
public class MemberDTO {
	@Data
	public static class member {
		private int user_no; 			
		private String username;
		private String email 	;
		private String password;
		private String nation 	;
		private String createDate; 			
		private String role;
		private List<my_friends> Flist;
		private List<requestDTO> list;
		private String friendname;
		private int friend_no;
	}
	
	@Data
	public static class my_friends {
		private int friend_no;
		private String username;
		private String friendname;
	}
					
}
