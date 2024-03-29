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
  public int weather_all_total(Map map) {
    return mapper.weather_all_total(map);
  }
  
  @Override
  public int info_all_total(Map map) {
    return mapper.info_all_total(map);
  }
  
  @Override
  public int recommend_all_total(Map map) {
    return mapper.recommend_all_total(map);
  }
  
  @Override
  public int weather_total(Map map) {
  return mapper.weather_total(map);
  }
  
  @Override
  public int info_total(Map map) {
    return mapper.info_total(map);
  }
  
  @Override
  public int recommend_total(Map map) {
  return mapper.recommend_total(map);
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

  @Override
  public List<Map> getAll() { // TODO Auto-generated method stub
    return mapper.getAll();
  }
  
  @Override
  public int update(BoardDTO dto) {
  return mapper.update(dto);
  }

  @Override
  public int delete(int board_no) {
  return mapper.delete(board_no);
  }


  @Override
  public List<BoardDTO> list2(Map map) {
    // TODO Auto-generated method stub
    return mapper.list2(map);
  }

  //좋아요 기능 구현
  
  @Override
  public int likeCheck(Map map) {
    return mapper.likeCheck(map);
  }

  @Override
  public void insertLike(Map map) {
    mapper.insertLike(map);
  }

  @Override
  public void updateLike_cnt(Map map) {
    mapper.updateLike_cnt(map);
  }

  @Override
  public void updateLikeCheck(Map map) {
    mapper.updateLikeCheck(map);
  }

  @Override
  public void updateLikeCheckCancel(Map map) {
    mapper.updateLikeCheckCancel(map);
  }

  @Override
  public void updateLike_cnt2(Map map) {
    mapper.updateLike_cnt2(map);
  }

  @Override
  public void deleteLike(Map map) {
    mapper.deleteLike(map);
  }

  @Override
  public List<BoardDTO> info_list(Map map) {
    return mapper.info_list(map);
  }

  @Override
  public List<BoardDTO> list_america(Map map) {
    return mapper.list_america(map);
  }

  @Override
  public List<BoardDTO> list_china(Map map) {
    return mapper.list_china(map);
  }

  @Override
  public List<BoardDTO> list_canada(Map map) {
    return mapper.list_canada(map);
  }

  @Override
  public List<BoardDTO> list_australia(Map map) {
    return mapper.list_australia(map);
  }

  @Override
  public List<BoardDTO> list_japan(Map map) {
    return mapper.list_japan(map);
  }

  @Override
  public List<BoardDTO> list_europe(Map map) {
    return mapper.list_europe(map);
  }

  @Override
  public List<BoardDTO> list_etc(Map map) {
    return mapper.list_etc(map);
  }

  @Override
  public int recommend_create(Map map) {
    return mapper.recommend_create(map);
  }



}
  
