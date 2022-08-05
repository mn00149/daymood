package com.study.board;

import java.util.List;
import java.util.Map;

public interface BoardService {
  
  //board_common
  int total(Map map); // 검색어 입력 시 페이징 시 필요
  
  int weather_total(Map map); // 검색어 입력 시 페이징 시 필요
  
  BoardDTO read(int board_no); // 게시물 읽기

  void upViewcnt(int board_no); // 조회수 ++ 
  
  int create(Map map); // 게시물 생성
  
  int update(BoardDTO dto); // 게시물 업데이트
  
  int delete(int board_no); // 게시물 삭제

  //weather_board
  List<BoardDTO> weather_list(Map map);
  
  List<BoardDTO> list_sunny(Map map);
  
  List<BoardDTO> list_cloudy(Map map);
  
  List<BoardDTO> list_rainy(Map map);

  //recommend_board
  List<BoardDTO> recommend_list(Map map);
  
  List<BoardDTO> list_movie(Map map);

  List<BoardDTO> list_book(Map map);
  
  List<BoardDTO> list_music(Map map);
  
  // ------ board end  

  List<BoardDTO> list2(Map map);

  List<Map> getAll();

  
}
