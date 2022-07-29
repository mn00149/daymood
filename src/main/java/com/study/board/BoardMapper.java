package com.study.board;

import java.util.List;
import java.util.Map;


public interface BoardMapper {
  
  //weather_board
  List<BoardDTO> weather_list(Map map);
  
  List<BoardDTO> list_sunny(Map map);
  
  List<BoardDTO> list_fog(Map map);
  
  List<BoardDTO> list_rain(Map map);

  //recommend_board
  List<BoardDTO> recommend_list(Map map);
  
  //common
  int total(Map map);
  
  BoardDTO read(int board_no);

  void upViewcnt(int board_no);

  List<BoardDTO> list2(Map map);
  
  List<Map> getAll();

}
