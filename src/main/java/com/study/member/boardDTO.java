package com.study.member;

import java.util.List;

import com.study.member.MemberDTO.member;

import lombok.Data;

@Data
public class boardDTO {
	private int board_no;
	private int user_no;
	private String nation;
	private String author;
	private String title;
	private String content;
	private int view_cnt;
	private int like_cnt;
	private String create_date;
	private String weather_category;
	private String recommend_category;
	private String info_category;
	private List<member> list;
	private List<scrapDTO> slist;
	
	private int scrapno;
}
