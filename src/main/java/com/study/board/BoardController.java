package com.study.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.reply.ReplyDTO;
import com.study.reply.ReplyService;
import com.study.user.auth.PrincipalDetails;
import com.study.utility.Utility;

@Controller
public class BoardController {
  private static final Logger log = LoggerFactory.getLogger(BoardController.class);

  @Autowired
  @Qualifier("com.study.board.BoardServiceImpl")
  private BoardService dao;

  @Autowired
  @Qualifier("com.study.reply.ReplyServiceImpl")
  public ReplyService rservice;

  @GetMapping(value = "/board/getAll", produces = "application/json;charset=UTF-8")
      
  @ResponseBody 
  public List<Map> getAll(HttpServletRequest request) { 
    List<Map> list = dao.getAll(); // log.info("list:"+list); return list; }
    return list;
  }
    // --------- board 공통
  @GetMapping("/board/create")
  public String create() {
    return "/board/common/create";
  }

  @PostMapping("/board/create")
  public String create(BoardDTO dto, Authentication authentication, @RequestParam String select_category) {

    PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
    Map map = new HashMap();

    select_category = select_category.replace(",", ""); // select_category 값 뒤에 ,가 붙어 제거함.

    map.put("user_no", principalDetails.getUser().getUser_no());
    map.put("nation", principalDetails.getUser().getNation());
    map.put("username", principalDetails.getUser().getUsername());
    map.put("title", dto.getTitle());
    map.put("content", dto.getContent());

    // 어떤 카테고리에 글을 등록할 지 판별.
    if (select_category.equals("맑음") || select_category.equals("흐림") || select_category.equals("비")) {
      map.put("weather_category", select_category);
    } else if (select_category.equals("미국") || select_category.equals("중국") || select_category.equals("일본")
        || select_category.equals("캐나다") || select_category.equals("호주") || select_category.equals("유럽")
        || select_category.equals("기타")) {
      map.put("info_category", select_category);
    } else if (select_category.equals("영화") || select_category.equals("도서") || select_category.equals("음악")) {
      map.put("recommend_category", select_category);
    } else {
      return "error";
    }

    int cnt = dao.create(map);

    if (cnt != 1)
      return "error";
    return "redirect:weather_list";
  }

  // read start
  @GetMapping("/board/read/{board_no}")
  public String read(@PathVariable int board_no, Model model, HttpServletRequest request,
      @AuthenticationPrincipal PrincipalDetails userDetails) {
    dao.upViewcnt(board_no); // 조회수 증가
    model.addAttribute("dto", dao.read(board_no));

    /* 댓글 관련 시작 */
    int nPage = 1;
    if (request.getParameter("nPage") != null) {
      nPage = Integer.parseInt(request.getParameter("nPage"));
    }
    int recordPerPage = 10;

    int sno = (nPage - 1) * recordPerPage;
    int eno = recordPerPage;

    Map map = new HashMap();
    map.put("sno", sno);
    map.put("eno", eno);
    map.put("nPage", nPage);

    // 댓글 값 받아오기
    if (userDetails != null) {
      int user_no = userDetails.getUser_no();
      String username = userDetails.getUsername();

      map.put("user_no", userDetails.getUser_no());
      map.put("username", userDetails.getUsername());
    }

    model.addAllAttributes(map);

    /* 댓글 처리 끝 */
    return "/board/common/read";
  }
  
  @GetMapping("/board/update/{board_no}")
  public String update(@PathVariable int board_no, Model model) {

  model.addAttribute("dto",dao.read(board_no));

  return "/board/common/update";
  }


  @PostMapping("/board/update")
  public String update(BoardDTO dto) {
  Map map = new HashMap();
  map.put("board_no", dto.getBoard_no());

  int cnt = 0;
  cnt = dao.update(dto); // 게시글 업데이트 후 cnt ++

  if (cnt==1) { // 게시물 업데이트 성공
  // return "redirect:/board/read/" + dto.getBoard_no(); // 해당 게시글로 이동
  return "redirect:/board/weather_list";
  }
  else {
  return "error";
  }
  }


  @PostMapping("/board/delete")
  public String delete(int board_no) {

  Map map = new HashMap();
  map.put("board_no", board_no);

  System.out.println("board_no : " + board_no);
  System.out.println("map : " + map);
  System.out.println("map : " + map);
  System.out.println("map : " + map);
  System.out.println("map : " + map);

  int cnt = 0;
  cnt = dao.delete(board_no);

  if (cnt==1) {
  return "redirect:/board/weather_list";
  } else {
  return "error";
  }

  }
  // --------- board 공통

  // weather_all start
  @GetMapping("/board/weather_list")
  public String weather_list(HttpServletRequest request) {

    // 검색 관련 --------------------------
    String col = Utility.checkNull(request.getParameter("col"));
    String word = Utility.checkNull(request.getParameter("word"));

    // 페이징 관련 ------------------------
    int nowPage = 1;
    if (request.getParameter("nowPage") != null) {
      nowPage = Integer.parseInt(request.getParameter("nowPage"));
    }

    int recordPerPage = 15;

    int sno = ((nowPage - 1) * recordPerPage);
    int eno = recordPerPage;

    // 1. model 사용
    Map map = new HashMap();
    map.put("col", col);
    map.put("word", word);
    map.put("sno", sno);
    map.put("eno", eno);

    List<BoardDTO> list = dao.weather_list(map);
    int total = dao.total(map);
    String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

    List<String> date_list = new ArrayList<>();

    for (int i = 0; i < list.size(); i++) {
      date_list.add(list.get(i).getCreate_date());
    }

    Map map2 = new HashMap();

    map2.put("date_list", date_list);
    List<String> msg2 = Utility.calculateTime(map2);

    // 2. request 저장(view에서 사용할 내용을 저장)
    request.setAttribute("msg2", msg2);
    request.setAttribute("list", list);
    request.setAttribute("paging", paging);
    request.setAttribute("col", col);
    request.setAttribute("word", word);
    request.setAttribute("nowPage", nowPage);
    request.setAttribute("rservice", rservice);

    return "/board/weather/weather_list";
  } // weather_all end

  // weather_category start
  @GetMapping("/board/weather/{weather}")
  public String weather_category_list(HttpServletRequest request, @PathVariable("weather") String weather) {

    // 검색 관련 --------------------------
    String col = Utility.checkNull(request.getParameter("col"));
    String word = Utility.checkNull(request.getParameter("word"));

    if (col.equals("total"))
      word = "";

    // 페이징 관련 ------------------------
    int nowPage = 1;
    if (request.getParameter("nowPage") != null) {
      nowPage = Integer.parseInt(request.getParameter("nowPage"));
    }

    int recordPerPage = 15;

    int sno = ((nowPage - 1) * recordPerPage);
    int eno = recordPerPage;

    // 1. model 사용
    Map map = new HashMap();
    map.put("col", col);
    map.put("word", word);
    map.put("sno", sno);
    map.put("eno", eno);
    
  //weather_total - 세부 게시판 페이징 관련(세부 게시판마다 글 개수가 달라서)
    String db = ""; // 지역변수 밖으로 빼주기 위해서 변수 선언

    if(weather.equals("sunny")) {
    db = "맑음";
    map.put("weather", db);
    } else if(weather.equals("cloudy")) {
    db = "흐림";
    map.put("weather", db);
    } else {
    db = "비";
    map.put("weather", db);
    }

    List<String> date_list = new ArrayList<>();

    if (weather.equals("sunny")) {
      List<BoardDTO> list = dao.list_sunny(map);
      request.setAttribute("list", list);

      for (int i = 0; i < list.size(); i++) {
        date_list.add(list.get(i).getCreate_date());
      }

    } else if (weather.equals("cloudy")) {
      List<BoardDTO> list = dao.list_cloudy(map);
      request.setAttribute("list", list);

      for (int i = 0; i < list.size(); i++) {
        date_list.add(list.get(i).getCreate_date());
      }

    } else {
      List<BoardDTO> list = dao.list_rainy(map);
      request.setAttribute("list", list);

      for (int i = 0; i < list.size(); i++) {
        date_list.add(list.get(i).getCreate_date());
      }
    }

    int total = dao.weather_total(map);

    String paging = Utility.weather_paging(total,
    nowPage, recordPerPage, col, word, weather);


    Map map2 = new HashMap();

    map2.put("date_list", date_list);
    List<String> msg2 = Utility.calculateTime(map2);

    // 2. request 저장(view에서 사용할 내용을 저장)
    request.setAttribute("msg2", msg2);
    request.setAttribute("paging", paging);
    request.setAttribute("col", col);
    request.setAttribute("word", word);
    request.setAttribute("nowPage", nowPage);
    request.setAttribute("rservice", rservice);

    if (weather.equals("sunny"))
      return "/board/weather/sunny";
    else if (weather.equals("cloudy"))
      return "/board/weather/cloudy";
    else
      return "/board/weather/rainy";
  } // weather_category end

  // recommend_all start
  @GetMapping("/board/recommend_list")
  public String recommend_list(HttpServletRequest request) {

    // 검색 관련 --------------------------
    String col = Utility.checkNull(request.getParameter("col"));
    String word = Utility.checkNull(request.getParameter("word"));

    // 페이징 관련 ------------------------
    int nowPage = 1;
    if (request.getParameter("nowPage") != null) {
      nowPage = Integer.parseInt(request.getParameter("nowPage"));
    }

    int recordPerPage = 9;

    int sno = ((nowPage - 1) * recordPerPage);
    int eno = recordPerPage;

    // 1. model 사용
    Map map = new HashMap();
    map.put("col", col);
    map.put("word", word);
    map.put("sno", sno);
    map.put("eno", eno);

    List<BoardDTO> list = dao.recommend_list(map);
    int total = dao.total(map);
    String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

    List<String> date_list = new ArrayList<>();

    for (int i = 0; i < list.size(); i++) {
      date_list.add(list.get(i).getCreate_date());
    }

    Map map2 = new HashMap();

    map2.put("date_list", date_list);
    List<String> msg2 = Utility.calculateTime(map2);

    System.out.println("list : " + list);
    System.out.println("msg2 : " + msg2);

    // 2. request 저장(view에서 사용할 내용을 저장)
    request.setAttribute("msg2", msg2);
    request.setAttribute("list", list);
    request.setAttribute("paging", paging);
    request.setAttribute("col", col);
    request.setAttribute("word", word);
    request.setAttribute("nowPage", nowPage);
    request.setAttribute("rservice", rservice);

    return "/board/recommend/recommend_list";
  } // recommend_all end

  // recommend_category start
  @GetMapping("/board/recommend/{recommend}")
  public String recommend_category_list(HttpServletRequest request, @PathVariable("recommend") String recommend) {

    // 검색 관련 --------------------------
    String col = Utility.checkNull(request.getParameter("col"));
    String word = Utility.checkNull(request.getParameter("word"));

    if (col.equals("total"))
      word = "";

    // 페이징 관련 ------------------------
    int nowPage = 1;
    if (request.getParameter("nowPage") != null) {
      nowPage = Integer.parseInt(request.getParameter("nowPage"));
    }

    int recordPerPage = 9;

    int sno = ((nowPage - 1) * recordPerPage);
    int eno = recordPerPage;

    // 1. model 사용
    Map map = new HashMap();
    map.put("col", col);
    map.put("word", word);
    map.put("sno", sno);
    map.put("eno", eno);

    if (recommend.equals("movie")) {
      List<BoardDTO> list = dao.list_movie(map);
      request.setAttribute("list", list);
    } else if (recommend.equals("book")) {
      List<BoardDTO> list = dao.list_book(map);
      request.setAttribute("list", list);
    } else {
      List<BoardDTO> list = dao.list_music(map);
      request.setAttribute("list", list);
    }

    int total = dao.total(map);
    String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

    // 2. request 저장(view에서 사용할 내용을 저장)
    request.setAttribute("paging", paging);
    request.setAttribute("col", col);
    request.setAttribute("word", word);
    request.setAttribute("nowPage", nowPage);

    if (recommend.equals("movie"))
      return "/board/recommend/movie";
    else if (recommend.equals("book"))
      return "/board/recommend/book";
    else
      return "/board/recommend/music";
  } // weather_category end

}