package com.study.member;

import java.util.List;

import com.study.user.UserDTO;

import lombok.Data;

@Data
public class requestDTO {
	private int request_no;
	private int f_id;
	private int t_id;
	private byte status;
	private List<friendDTO> Flist;
	private List<UserDTO> list;
}
