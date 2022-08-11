package com.study.board;

import java.util.List;
import java.util.Map;


public interface BoardMapper {
  
  //board_common
  int total(Map map);
  
  int weather_total(Map map);
  
  BoardDTO read(int board_no);

  void upViewcnt(int board_no);
  
  int create(Map map);
  
  int update(BoardDTO dto);
  
  int delete(int board_no);
  
  //weather_board
  List<BoardDTO> weather_list(Map map);
  
  List<BoardDTO> list_sunny(Map map);
  
  List<BoardDTO> list_cloudy(Map map);
  
  List<BoardDTO> list_rainy(Map map);

  //recommend_board
  List<BoardDTO> recommend_list(Map map);
  
  List<BoardDTO> list_movie(Map map);

  List<BoardDTO> list_book(Map map);
  
  List<BoardDTO> list_music(Map map);
  
  //------ board end
  

  
  List<Map> getAll();

  List<BoardDTO> list2(Map map);



  


}
