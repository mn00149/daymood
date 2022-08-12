package com.study.reply;

import com.study.board.BoardDTO;

import lombok.Data;

@Data
public class ReplyDTO {

  private int reply_no;
  private int user_no;
  private int board_no;
  private String username;
  private String content;
  private String create_date;
  private BoardDTO BoardDTO;
  private int indent;
  private int ansnum;
}