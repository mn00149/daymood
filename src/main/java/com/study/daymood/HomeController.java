package com.study.daymood;

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

@Controller
public class HomeController {
  
  @Autowired
  @Qualifier("com.study.mainboard.MainBoardServiceImpl")
  private MainBoardService dao;
  
  
  @GetMapping("/home")
  public String list(HttpServletRequest request) {

    Map map = new HashMap();
    List<BoardDTO> list = dao.hot_list(map);
    int total = dao.total(map);
    
    Map map3 = new HashMap();
    List<BoardDTO> list2 = dao.new_list(map3);
    int total2 = dao.total(map3);
  
    // 2. request 저장(view에서 사용할 내용을 저장)
    request.setAttribute("list", list);
    request.setAttribute("list2", list2);

    
    return"/home";
  }
}
