package com.study.board;

import java.util.List;
import java.util.Map;

public interface BoardService {
  
  List<BoardDTO> list(Map map);

  int total(Map map);
  
  List<BoardDTO> list_sunny(Map map);
  
  List<BoardDTO> list_fog(Map map);
  
  List<BoardDTO> list_rain(Map map);
  
  BoardDTO read(int board_no);

  void upViewcnt(int board_no);

  List<Map> getAll();
  
}
