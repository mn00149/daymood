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
  public int total(Map map) {
    return mapper.total(map);
  }

  @Override
  public List<BoardDTO> new_list(Map map) {
    return mapper.new_list(map);
  }



  
  
  
}
