package com.study.mainboard;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.board.BoardDTO;

@Service("com.study.mainboard.MainBoardServiceImpl")
public class MainBoardServiceImpl implements MainBoardService {
  
  @Autowired
  private MainBoardMapper mapper;

  @Override
  public List<BoardDTO> hot_list(Map map) {
    return mapper.hot_list(map);
  }

  @Override
  public List<BoardDTO> new_list(Map map) {
    return mapper.new_list(map);
  }

  @Override
  public List<BoardDTO> book_list(Map map) {
    // TODO Auto-generated method stub
    return mapper.book_list(map);
  }

  @Override
  public List<BoardDTO> movie_list(Map map) {
    // TODO Auto-generated method stub
    return mapper.movie_list(map);
  }



  
  
  
}
