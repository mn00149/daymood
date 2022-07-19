package com.study.member;

import java.util.List;

import lombok.Data;

@Data
public class friendDTO {
	private int f_no;
	private int user_no;
    private int friends_no;
    private List<userDTO> list;
}
