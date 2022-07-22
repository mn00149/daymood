package com.study.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.utility.Utility;

@Controller
public class BoardController {

  @Autowired
  @Qualifier("com.study.board.BoardServiceImpl")
  private BoardService dao;

  // weather_all list start
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

    return "/board/weather_list";
  } // weather_all list end

  // weather_category list start
  @GetMapping("/board/list/{weather}")
  public String list2(HttpServletRequest request, @PathVariable("weather") String weather) {

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

    if (weather.equals("sunny")) {
      List<BoardDTO> list = dao.list_sunny(map);
      request.setAttribute("list", list);
    } else if (weather.equals("fog")) {
      List<BoardDTO> list = dao.list_fog(map);
      request.setAttribute("list", list);
    } else {
      List<BoardDTO> list = dao.list_rain(map);
      request.setAttribute("list", list);
    }

    int total = dao.total(map);
    String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

    // 2. request 저장(view에서 사용할 내용을 저장)
    request.setAttribute("paging", paging);
    request.setAttribute("col", col);
    request.setAttribute("word", word);
    request.setAttribute("nowPage", nowPage);

    if (weather.equals("sunny"))
      return "/weather/sunny";
    else if (weather.equals("fog"))
      return "/weather/fog";
    else
      return "/weather/rain";
  } // weather_category list end

  // read start
  @GetMapping("/board/read/{board_no}")
  public String read(@PathVariable int board_no, Model model, HttpServletRequest request) {
    dao.upViewcnt(board_no); // 조회수 증가
    model.addAttribute("dto", dao.read(board_no));

    return "/read";
  } // read end

  //recommend_all list start
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

    return "/board/recommend/recommend_list";
  } // recommend_all list end

  
  //recommend_read start
  @GetMapping("/board/recommend/{board_no}")
  public String recommend_read(@PathVariable int board_no, Model model, HttpServletRequest request) {
    //dao.upViewcnt(board_no); // 조회수 증가
    //model.addAttribute("dto", dao.read(board_no));

    return "/board/recommend/read";
  } // recommend_read end

  
  @GetMapping("/board/create")
  public String create() {
    return "/create";
  }
  
  
}
