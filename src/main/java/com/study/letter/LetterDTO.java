package com.study.letter;

import lombok.Data;

@Data
public class LetterDTO {
  private int letter_no;   
  private int room;      
  private String content;     // 내용
  private String recv_name;   // 받는사람
  private String send_name;   // 보낸사람
  private String send_time;   // 보낸시간
  private int read_chk;       // 읽음확인 읽으면 0 안읽으면 1
  
  //현재 사용자의 메세지 상대 name을 담는다.
  private String other_name;
  //현재 사용자의 메세지 상대 profile을 담는다.
  private String user_image;
  //현재 사용자 name
  private String username;
  //안읽은 메세지 갯수
  private int unread;
}
