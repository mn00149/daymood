package com.study.mainboard;

import java.util.List;
import java.util.Map;

import com.study.board.BoardDTO;

public interface MainBoardService {
  
  List<BoardDTO> hot_list(Map map);
  
  List<BoardDTO> new_list(Map map);

  List<BoardDTO> book_list(Map map);

  List<BoardDTO> movie_list(Map map);
}
