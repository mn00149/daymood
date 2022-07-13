package com.study.member;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {
	private static final Logger log = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	@Qualifier("com.study.member.MemberServiceImpl")
	private MemberService service;

	@GetMapping("/mypage/member")
	public String mypage(Model model) {
		String username = "홍길동";
		MemberDTO dto = service.read(username);

		//log.info("dto:" + dto);

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
	
	
}
