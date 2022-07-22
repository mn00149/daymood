package com.study.board;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.study.board.BoardServiceImpl")
public class BoardServiceImpl implements BoardService {
  
  @Autowired
  private BoardMapper mapper;

  @Override
  public List<BoardDTO> list(Map map) {
    return mapper.list(map);
  }

  @Override
  public int total(Map map) {
    return mapper.total(map);
  }

  @Override
  public List<BoardDTO> list_sunny(Map map) {
    return mapper.list_sunny(map);
  }

  @Override
  public List<BoardDTO> list_fog(Map map) {
    return mapper.list_fog(map);
  }

  @Override
  public List<BoardDTO> list_rain(Map map) {
    return mapper.list_rain(map);
  }

  @Override
  public BoardDTO read(int board_no) {
    return mapper.read(board_no);
  }

  @Override
  public void upViewcnt(int board_no) {
    mapper.upViewcnt(board_no);
  }

  @Override

  public List<BoardDTO> list2(Map map) {
    return mapper.list2(map);
  }



  
  


  public List<Map> getAll() {
    // TODO Auto-generated method stub
    return mapper.getAll();
  }


}
