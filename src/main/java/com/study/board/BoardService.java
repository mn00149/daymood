package com.study.board;

import java.util.List;
import java.util.Map;

public interface BoardService {
  
  //board_common
  
  //Mood, Info, Recommend all 게시판에서
  //검색어 입력 후 페이징 시 필요
  int weather_all_total(Map map);
  
  int info_all_total(Map map);
  
  int recommend_all_total(Map map);
  
  //각 카테고리 게시판에서 검색어 입력 후 페이징 시 필요
  int weather_total(Map map);

  int info_total(Map map);
  
  int recommend_total(Map map);
  
  //--------------------------------
  
  BoardDTO read(int board_no); // 게시물 읽기

  void upViewcnt(int board_no); // 조회수 ++ 
  
  int create(Map map); // 게시물 생성
  
  int update(BoardDTO dto); // 게시물 업데이트
  
  int delete(int board_no); // 게시물 삭제
  
  //board_common end

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
  int recommend_create(Map map); // 게시물 생성
  
  List<BoardDTO> recommend_list(Map map);
  
  List<BoardDTO> list_movie(Map map);

  List<BoardDTO> list_book(Map map);
  
  List<BoardDTO> list_music(Map map);
  
  // ------ board end  

  List<BoardDTO> list2(Map map);

  List<Map> getAll();
  
  // 좋아요 기능 구현

  int likeCheck(Map map);

  void insertLike(Map map);

  void updateLike_cnt(Map map);

  void updateLikeCheck(Map map);

  void updateLikeCheckCancel(Map map);

  void updateLike_cnt2(Map map);

  void deleteLike(Map map);

}