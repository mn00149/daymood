package com.study.board;

import java.util.List;
import java.util.Map;


public interface BoardMapper {
  
  //board_common
  int weather_all_total(Map map);
  
  int info_all_total(Map map);

  int recommend_all_total(Map map);
  
  int weather_total(Map map);
  
  int info_total(Map map);
  
  int recommend_total(Map map);
  
  BoardDTO read(int board_no);

  void upViewcnt(int board_no);
  
  int create(Map map);
  
  int update(BoardDTO dto);
  
  int delete(int board_no);
  
  //weather_board
  List<BoardDTO> weather_list(Map map);
  
  List<BoardDTO> list_sunny(Map map);
  
  List<BoardDTO> list_cloudy(Map map);
  
  List<BoardDTO> list_rainy(Map map);
  
  //info_board
  List<BoardDTO> info_list(Map map);
  
  List<BoardDTO> list_america(Map map);
  
  List<BoardDTO> list_china(Map map);
  
  List<BoardDTO> list_canada(Map map);

  List<BoardDTO> list_australia(Map map);
  
  List<BoardDTO> list_japan(Map map);

  List<BoardDTO> list_europe(Map map);
  
  List<BoardDTO> list_etc(Map map);

  //recommend_board
  int recommend_create(Map map);
  
  List<BoardDTO> recommend_list(Map map);
  
  List<BoardDTO> list_movie(Map map);

  List<BoardDTO> list_book(Map map);
  
  List<BoardDTO> list_music(Map map);
  
  //------ board end
  

  
  List<Map> getAll();

  List<BoardDTO> list2(Map map);



  int likeCheck(Map map);

  void insertLike(Map map);

  void updateLike_cnt(Map map);

  void updateLikeCheck(Map map);

  void updateLikeCheckCancel(Map map);

  void updateLike_cnt2(Map map);

  void deleteLike(Map map);

}