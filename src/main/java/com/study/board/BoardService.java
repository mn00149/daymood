package com.study.board;

import java.util.List;
import java.util.Map;

public interface BoardService {
  
  //board_common
  int total(Map map);
  
  BoardDTO read(int board_no);

  void upViewcnt(int board_no);
  
  int create(Map map);
  
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
  
  // ------ board end  

  List<BoardDTO> list2(Map map);

  List<Map> getAll();

  
}
