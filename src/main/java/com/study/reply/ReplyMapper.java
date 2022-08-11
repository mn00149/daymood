package com.study.reply;
 
import java.util.List;
import java.util.Map;
 
public interface ReplyMapper {
 
   int create(ReplyDTO ReplyDTO);
 
   List<ReplyDTO> list(Map map);
 
   ReplyDTO read(int reply_no);
  
   int update(ReplyDTO ReplyDTO); 
   
   int delete(int reply_no);
 
   int total(int user_no); //?  

   int rcount(int user_no); //?

   int re_create(ReplyDTO ReplyDTO);
   
}