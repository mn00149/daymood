package com.study.board;

import java.util.List;

import com.study.reply.ReplyDTO;
import com.study.user.UserDTO;

import lombok.Data;

@Data
public class BoardDTO {
  private int board_no;
  private int user_no;
  private String nation;
  private String username;        
  private String title;          
  private String content;            
  private int view_cnt;                      
  private int like_cnt;                
  private String create_date;                       
  private String weather_category;                  
  private String recommend_category;                
  private String info_category;
  private List<ReplyDTO> ReplyDTO;
  
  
  private UserDTO udto;
}
