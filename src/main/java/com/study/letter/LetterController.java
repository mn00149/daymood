package com.study.letter;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.user.auth.PrincipalDetails;

@Controller
public class LetterController {
  
  @Autowired
  private LetterDAO LetterDao;
  
  //메세지 목록
  @RequestMapping("/letter_list")
  public String letter_list(HttpServletRequest request, @AuthenticationPrincipal PrincipalDetails userDetails, Model model) {
        String username = userDetails.getUsername();

        
        LetterDTO to = new LetterDTO();
        to.setUsername(username);
        
        //메세지 리스트
        ArrayList<LetterDTO> list = LetterDao.letterlist(to);

        request.setAttribute("list", list);
        
        return "letter/letter_list";
  }
  //메세지 목록
  @RequestMapping("/letter_ajax_list")
  public String letter_ajax_list(HttpServletRequest request, @AuthenticationPrincipal PrincipalDetails userDetails, Model model) {
    String username = userDetails.getUsername();
    LetterDTO to = new LetterDTO();
    to.setUsername(username);
    
    model.addAttribute("user", userDetails);
    //메세지 리스트
    ArrayList<LetterDTO> list = LetterDao.letterlist(to);
    request.setAttribute("list", list);
    return "letter/letter_ajax_list";
  }
  
  @RequestMapping("/letter_content_list")
  public String letter_content_list(HttpServletRequest request, @AuthenticationPrincipal PrincipalDetails userDetails, Model model) {
    int room = Integer.parseInt(request.getParameter("room"));
    
    LetterDTO to = new LetterDTO();
    to.setRoom(room);
    to.setUsername(userDetails.getUsername());
    model.addAttribute("username", userDetails.getUsername());
    //메세지 내용을 가져온다.
    ArrayList<LetterDTO> clist = LetterDao.roomContentList(to);
    request.setAttribute("clist", clist);
    return "letter/letter_content_list";
  }
  
  @GetMapping("/sendLetter")
  public String sendLetter(@RequestParam("recv_name")String recv_name, Model model){
    model.addAttribute("recv_name", recv_name);
    return "/letter/sendLetter";
  }
  
  @PostMapping("/sendLetter")
  public String postLetter(HttpServletRequest request, @AuthenticationPrincipal PrincipalDetails userDetails){
    String send_name = userDetails.getUsername();
    System.out.println("sendname"+send_name);
    System.out.println("name::::::::::::::"+request.getParameter("letterContent"));
    System.out.println("name::::::::::::::"+request.getParameter("recv_name"));

    return "/letter/sendLetter";
  }
  //메세지 리스트에서 메세지 보내기
  @ResponseBody
  @RequestMapping("/letter_send_inlist")
  public int letter_send_inlist(@RequestParam int room, @RequestParam String other_name, @RequestParam String content, @AuthenticationPrincipal PrincipalDetails userDetails) {
    LetterDTO to = new LetterDTO();
    to.setRoom(room);
    to.setSend_name(userDetails.getUsername());
    to.setRecv_name(other_name);
    to.setContent(content);

    
    int flag = LetterDao.letterSendInlist(to);
    
    return flag;
  }
  
}
