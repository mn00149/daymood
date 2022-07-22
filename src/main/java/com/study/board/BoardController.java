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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.board.BoardController;
import com.study.reply.ReplyDTO;
import com.study.reply.ReplyService;
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
    List<Map> list = dao.getAll();
    //log.info("list:"+list);
    return list;
  }
  
  
  // weather_main list start
  @GetMapping("/board/list")
  public String list(HttpServletRequest request) {
    
    //검색 관련 --------------------------
    String col = Utility.checkNull(request.getParameter("col"));
    String word = Utility.checkNull(request.getParameter("word"));

    if(col.equals("total")) word = "";

    //페이징 관련 ------------------------
    int nowPage = 1;
    if(request.getParameter("nowPage") != null) {
      nowPage = Integer.parseInt(request.getParameter("nowPage"));
    }

    int recordPerPage = 10;

    int sno = ((nowPage-1) * recordPerPage);
    int eno = recordPerPage;
    
    
    // 1. model 사용
    Map map = new HashMap();
    map.put("col", col);
    map.put("word", word);
    map.put("sno", sno);
    map.put("eno", eno);
    
    List<BoardDTO> list = dao.list(map);
    int total = dao.total(map);
    String paging = Utility.paging(total, nowPage, recordPerPage, col, word);
    
    List<String> date_list = new ArrayList<>();
    
    for(int i=0; i<list.size(); i++) {
      date_list.add(list.get(i).getCreate_date());
    }
    
    Map map2 = new HashMap();
    
    map2.put("date_list", date_list);
    List<String> msg2 = Utility.calculateTime(map2);

    System.out.println("list : " + list);
    System.out.println("msg2 : " + msg2);
    
    // 2. request 저장(view에서 사용할 내용을 저장)
    request.setAttribute("msg2",  msg2);
    request.setAttribute("list", list);
    request.setAttribute("paging", paging);
    request.setAttribute("col", col);
    request.setAttribute("word", word);
    request.setAttribute("nowPage", nowPage);
    request.setAttribute("rservice", rservice);
    
    return "/board/list";
  } // weather_main list end
  
  
  // weather_category list start
  @GetMapping("/board/list/{weather}")
  public String list2(HttpServletRequest request, @PathVariable("weather") String weather) {
    
    //검색 관련 --------------------------
    String col = Utility.checkNull(request.getParameter("col"));
    String word = Utility.checkNull(request.getParameter("word"));

    if(col.equals("total")) word = "";

    //페이징 관련 ------------------------
    int nowPage = 1;
    if(request.getParameter("nowPage") != null) {
      nowPage = Integer.parseInt(request.getParameter("nowPage"));
    }

    int recordPerPage = 15;

    int sno = ((nowPage-1) * recordPerPage);
    int eno = recordPerPage;
    
    // 1. model 사용
    Map map = new HashMap();
    map.put("col", col);
    map.put("word", word);
    map.put("sno", sno);
    map.put("eno", eno);
    
    if(weather.equals("sunny")) {
      List<BoardDTO> list = dao.list_sunny(map);
      request.setAttribute("list", list);
    } else if(weather.equals("fog")) {
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
    
    if(weather.equals("sunny")) return "/weather/sunny";
    else if(weather.equals("fog")) return "/weather/fog";
    else return "/weather/rain";
  } // weather_category list end
  

  // read start
  @GetMapping("/board/read/{board_no}")
  public String read(@PathVariable int board_no, Model model, HttpServletRequest request) {
    dao.upViewcnt(board_no); // 조회수 증가
    model.addAttribute("dto", dao.read(board_no));
    
    /* 댓글 관련 시작 */
    int nPage = 1;
    if (request.getParameter("nPage") != null) {
      nPage = Integer.parseInt(request.getParameter("nPage"));
    }
    int recordPerPage = 3;
 
    int sno = (nPage - 1) * recordPerPage;
    int eno = recordPerPage;
 
    Map map = new HashMap();
    map.put("sno", sno);
    map.put("eno", eno);
    map.put("nPage", nPage);
 
    model.addAllAttributes(map);
 
    /* 댓글 처리 끝 */
    
    return "/read";
  } // read end
}
