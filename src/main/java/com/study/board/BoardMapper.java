package com.study.board;

import java.util.List;
import java.util.Map;


public interface BoardMapper {
  
  List<BoardDTO> list(Map map);

  List<BoardDTO> list_sunny(Map map);

  List<BoardDTO> list_fog(Map map);
  
  List<BoardDTO> list_rain(Map map);
  
  int total(Map map);

  BoardDTO read(int board_no);

  void upViewcnt(int board_no);
  
  List<BoardDTO> list2(Map map);
  List<Map> getAll();

}
