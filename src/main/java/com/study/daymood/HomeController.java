package com.study.daymood;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.study.board.BoardDTO;
import com.study.mainboard.MainBoardService;
import com.study.utility.Utility;

@Controller
public class HomeController {
  
  @Autowired
  @Qualifier("com.study.mainboard.MainBoardServiceImpl")
  private MainBoardService dao;
  
  
  @GetMapping("/home")
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
    
    List<BoardDTO> list = dao.hot_list(map);
    int total = dao.total(map);
    String paging = Utility.paging(total, nowPage, recordPerPage, col, word);
    
    List<String> date_list = new ArrayList<>();
    
    for(int i=0; i<list.size(); i++) {
      date_list.add(list.get(i).getCreate_date());
    }
    
    Map map2 = new HashMap();
    map2.put("date_list", date_list);
    
    List<String> msg2 = Utility.calculateTime(map2);

    
    
    
    Map map3 = new HashMap();
    map.put("col", col);
    map.put("word", word);
    map.put("sno", sno);
    map.put("eno", eno);
    
    List<BoardDTO> list2 = dao.new_list(map3);
    int total2 = dao.total(map3);
    String paging2 = Utility.paging(total, nowPage, recordPerPage, col, word);
    
    
    
    // 2. request 저장(view에서 사용할 내용을 저장)
    request.setAttribute("msg2",  msg2);
    request.setAttribute("list", list);
    request.setAttribute("list2", list2);

    
    return"/home";
  }
}
