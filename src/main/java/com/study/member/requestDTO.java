package com.study.member;

import java.util.List;

import com.study.member.MemberDTO.*;

import lombok.Data;

@Data
public class requestDTO {
	private int request_no;
	private int f_id;
	private int t_id;
	private byte status;
	private List<my_friends> Flist;
	private List<member> list;
}
