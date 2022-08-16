package com.study.mainboard;

import java.util.List;
import java.util.Map;

import com.study.board.BoardDTO;

public interface MainBoardService {
  
  List<BoardDTO> hot_list(Map map);

  int total(Map map);
  
  List<BoardDTO> new_list(Map map);
}
