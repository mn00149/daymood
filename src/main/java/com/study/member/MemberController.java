package com.study.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.member.MemberDTO.*;
import com.study.utility.Utility;

@Controller
public class MemberController {
	private static final Logger log = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	@Qualifier("com.study.member.MemberServiceImpl")
	private MemberService service;

	@GetMapping("/mypage/member")
	public String mypage(Model model) {
		String username = "홍길동";
		member dto = service.read(username);

		log.info("dto:" + dto);

		model.addAttribute("dto", dto);
		return "/mypage/member";
	}
	
	@GetMapping("/mypage/my_posted")
	public String my_post() {
		
		return "/mypage/my_posted";
	}
	
	@GetMapping("/mypage/my_comment")
	public String my_comment() {
		
		return "/mypage/my_comment";
	}
	
	@GetMapping("/mypage/my_scrap")
	public String my_scrap() {
		
		return "/mypage/my_scrap";
	}
	
	@GetMapping("/mypage/my_letter")
	public String my_letter() {
		
		return "/mypage/my_letter";
	}
	
	@RequestMapping("/mypage/my_friends")
	public String my_friends(HttpServletRequest request) {
	    // 검색관련------------------------
	    String col = Utility.checkNull(request.getParameter("col"));
	    String word = Utility.checkNull(request.getParameter("word"));

	    if (col.equals("total")) {
	      word = "";
	    }

	    // 페이지관련-----------------------
	    int nowPage = 1;// 현재 보고있는 페이지
	    if (request.getParameter("nowPage") != null) {
	      nowPage = Integer.parseInt(request.getParameter("nowPage"));
	    }
	    int recordPerPage = 3;// 한페이지당 보여줄 레코드갯수

	    int sno = (nowPage - 1) * recordPerPage;
	    int eno = recordPerPage;

	    Map map = new HashMap();
	    map.put("col", col);
	    map.put("word", word);
	    map.put("sno", sno);
	    map.put("eno", eno);
	    map.put("username", "홍길동");

	    int total = service.total(map);

	    List<MemberDTO> list = service.list(map);

	    String paging = Utility.paging(total, nowPage, recordPerPage, col, word);
	    log.info("List : " + list);
	    // request에 Model사용 결과 담는다
	    request.setAttribute("list", list);
	    request.setAttribute("nowPage", nowPage);
	    request.setAttribute("col", col);
	    request.setAttribute("word", word);
	    request.setAttribute("paging", paging);
	    
		return "/mypage/my_friends";
	}
	
	@GetMapping("/mypage/my_friends/{username}")
	  public ResponseEntity<List<MemberDTO>> getList(@PathVariable("username") String username) {

	    Map map = new HashMap();
	    map.put("username", username);
	    
	    return new ResponseEntity<List<MemberDTO>>(service.list(map), HttpStatus.OK);
	  }
	
	@DeleteMapping("/mypage/my_friends/{friend_no}")
	  public ResponseEntity<String> remove(@PathVariable("friend_no") int friend_no) {
		
	 
	    return service.delete(friend_no) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
	        : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	 
	  }
	
	@GetMapping("/mypage/request_friends")
	public String request_friends() {
		
		return "/mypage/request_friends";
	}
	
	
}
