package com.study.member;

import java.util.List;

import lombok.Data;

@Data
public class scrapDTO {
	private int scrapno;
	private int user_no;
	private int board_no;
	private List<boardDTO> blist;
}
