package com.study.member;

import java.util.List;

import lombok.Data;

@Data
public class replyDTO {
private int reply_no 			;
private int user_no 			;
private int board_no 			;
private String content 			;
private String create_date 		;
private List<boardDTO> blist;
}                       
