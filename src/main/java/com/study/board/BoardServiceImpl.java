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
  public List<BoardDTO> weather_list(Map map) {
    return mapper.weather_list(map);
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
  public List<BoardDTO> list_cloudy(Map map) {
    return mapper.list_cloudy(map);
  }

  @Override
  public List<BoardDTO> list_rainy(Map map) {
    return mapper.list_rainy(map);
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
  public List<BoardDTO> recommend_list(Map map) {
    return mapper.recommend_list(map);
  }

  @Override
  public List<BoardDTO> list2(Map map) {
    return mapper.list2(map);
  }

  @Override
  public int create(Map map) {
    // TODO Auto-generated method stub
    return mapper.create(map);
  }

  @Override
  public List<BoardDTO> list_movie(Map map) {
    return mapper.list_movie(map);
  }

  @Override
  public List<BoardDTO> list_book(Map map) {
    return mapper.list_book(map);
  }

  @Override
  public List<BoardDTO> list_music(Map map) {
    return mapper.list_music(map);
  }

  /*
   * @Override public List<Map> getAll() { // TODO Auto-generated method stub
   * return mapper.getAll(); }
   */

}
