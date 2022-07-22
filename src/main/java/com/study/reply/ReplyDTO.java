package com.study.reply;

import lombok.Data;

@Data
public class ReplyDTO {

  private int reply_no;
  private int user_no;
  private int board_no;
  private String username;
  private String content;
  private String create_date;
}