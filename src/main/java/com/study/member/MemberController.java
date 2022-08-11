package com.study.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.board.BoardDTO;
import com.study.mainboard.MainBoardService;
import com.study.reply.ReplyDTO;
import com.study.user.UserDTO;
import com.study.user.auth.PrincipalDetails;
import com.study.utility.Utility;

@Controller
public class MemberController {
	private static final Logger log = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	@Qualifier("com.study.member.MemberServiceImpl")
	private MemberService service;

  @Autowired
  @Qualifier("com.study.mainboard.MainBoardServiceImpl")
  private MainBoardService dao;
  
	@PutMapping("/updateMember")
	public ResponseEntity<String> modify(@RequestBody UserDTO vo) {

		log.info("modify: " + vo);

		return service.update(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

	@GetMapping("/updateMember")
	public String updateMember(HttpServletRequest request, @AuthenticationPrincipal PrincipalDetails principalDetails) {
		
		
		return "/mypage/member";
	}

	@GetMapping("/board/req/{user_no}")
	@ResponseBody
	public ResponseEntity<String> requestFriend(HttpServletRequest request,
			@AuthenticationPrincipal PrincipalDetails principalDetails, @PathVariable("user_no") int t_id) {

		Map map = new HashMap();
		map.put("f_id", principalDetails.getUser_no());
		map.put("t_id", t_id);

		// 친구 목록 검사, 친구 요청 목록 검사 (이미 있는지 없는지)
		try {
			Integer flag = service.checkReqfriend(map);
			Integer flag2 = service.checkfriend(map);
			// log.info("flag:"+flag);
			// log.info("flag2:"+flag2);
			if (flag >= 1 || flag2 >= 1) {
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		// 자기 자신한테 요청하는지 검사
		if (map.get("f_id") == map.get("t_id")) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		// 친구 요청
		int reqFriend = service.reqFriend(map);

		// 친구 요청을 한 뒤 양쪽에 양쪽 모두가 서로 요청을 한 상태라면 자동으로 친구 등록 후 요청목록에서 삭제
		try {
			Integer both = service.checkboth(map);
			if (both == 2) {
				service.add(map);
				service.reqBothDelete(map);
				// System.out.println(both);
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return reqFriend == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping("/mypage/member")
	public String mypage(Model model, @AuthenticationPrincipal PrincipalDetails principalDetails) {
		String username = principalDetails.getUsername();
		UserDTO dto = service.read(username);

		// log.info("dto:" + principalDetails);
		model.addAttribute("dto", dto);
		return "/mypage/member";
	}

	@GetMapping("/")
	public String intro() {
		return "/intro";
	}

	@GetMapping("/main")
  public String list(HttpServletRequest request) {

    Map map = new HashMap();
    List<BoardDTO> list = dao.hot_list(map);

    
    Map map2 = new HashMap();
    List<BoardDTO> list2 = dao.new_list(map2);

  
    // 2. request 저장(view에서 사용할 내용을 저장)
    request.setAttribute("list", list);
    request.setAttribute("list2", list2);
		return "/main";
	}

	@GetMapping("/posted")
	public String posted() {
		return "/posted";
	}

	@RequestMapping("/posted/{user_no}")
	public String posted(HttpServletRequest request, @PathVariable int user_no) {
		// 검색관련------------------------
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		String url = request.getContextPath();

		if (col.equals("total")) {
			word = "";
		}

		// 페이지관련-----------------------
		int nowPage = 1;// 현재 보고있는 페이지
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 5;// 한페이지당 보여줄 레코드갯수

		int sno = (nowPage - 1) * recordPerPage;
		int eno = recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("user_no", user_no);

		int ptotal = service.ptotal(map);

		List<BoardDTO> plist = service.plist(map);

		String paging = Utility.spaging(ptotal, nowPage, recordPerPage, col, word, url);
		// log.info("pList : " + plist);
		// request에 Model사용 결과 담는다
		request.setAttribute("plist", plist);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);

		return "/posted";
	}

//	@GetMapping("/mypage/my_comment")
//	public String my_comment() {
//		
//		return "/mypage/my_comment";
//	}

	// 스크랩 시작
	@GetMapping("/mypage/my_scrap")
	public String my_scrap(HttpServletRequest request, @AuthenticationPrincipal PrincipalDetails principalDetails) {
		// 검색관련------------------------
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		String url = request.getContextPath();

		if (col.equals("total")) {
			word = "";
		}

		// 페이지관련-----------------------
		int nowPage = 1;// 현재 보고있는 페이지
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 5;// 한페이지당 보여줄 레코드갯수

		int sno = (nowPage - 1) * recordPerPage;
		int eno = recordPerPage;
		String username = principalDetails.getUsername();
		UserDTO dto = service.read(username);

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("user_no", principalDetails.getUser_no());

		int stotal = service.stotal(map);

		List<scrapDTO> scraplist = service.scraplist(map);

		String paging = Utility.spaging(stotal, nowPage, recordPerPage, col, word, url);
		// log.info("scraplist : " + scraplist);
		// request에 Model사용 결과 담는다
		request.setAttribute("scraplist", scraplist);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);

		return "/mypage/my_scrap";
		// 동기
	}

	@GetMapping("/mypage/my_scrap/{user_no}")
	@ResponseBody
	public ResponseEntity<List<scrapDTO>> scrapList(@PathVariable("user_no") int user_no
	/*
	 * @PathVariable("sno") int sno,
	 * 
	 * @PathVariable("eno") int eno
	 */) {

		Map map = new HashMap();
		map.put("user_no", user_no);
//		map.put("sno", sno);
//		map.put("eno", eno);

		// 비동기
		return new ResponseEntity<List<scrapDTO>>(service.scraplist(map), HttpStatus.OK);
	}

	@DeleteMapping("/mypage/my_scrap/{scrapno}")
	@ResponseBody
	public ResponseEntity<String> scraprm(@PathVariable("scrapno") int scrapno) {

		return service.ScrapDelete(scrapno) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 스크랩 끝

	@GetMapping("/mypage/my_letter")
	public String my_letter() {

		return "/mypage/my_letter";
	}

	@GetMapping("/mypage/my_friends")
	public String my_friends(HttpServletRequest request, @AuthenticationPrincipal PrincipalDetails principalDetails) {
		// 검색관련------------------------
//	    String col = Utility.checkNull(request.getParameter("col"));
//	    String word = Utility.checkNull(request.getParameter("word"));
//
//	    if (col.equals("total")) {
//	      word = "";
//	    }
//
//	    // 페이지관련-----------------------
//	    int nowPage = 1;// 현재 보고있는 페이지
//	    if (request.getParameter("nowPage") != null) {
//	      nowPage = Integer.parseInt(request.getParameter("nowPage"));
//	    }
//	    int recordPerPage = 3;// 한페이지당 보여줄 레코드갯수
//
//	    int sno = (nowPage - 1) * recordPerPage;
//	    int eno = recordPerPage;

		Map map = new HashMap();
//	    map.put("col", col);
//	    map.put("word", word);
//	    map.put("sno", sno);
//	    map.put("eno", eno);
		map.put("user_no", principalDetails.getUser_no());

//	    int total = service.total(map);

		List<UserDTO> list = service.list(map);

//	    String paging = Utility.paging(total, nowPage, recordPerPage, col, word);
		// log.info("List : " + list);
		// request에 Model사용 결과 담는다
		request.setAttribute("list", list);
//	    request.setAttribute("nowPage", nowPage);
//	    request.setAttribute("col", col);
//	    request.setAttribute("word", word);
//	    request.setAttribute("paging", paging);

		return "/mypage/my_friends";
	}

	@GetMapping("/mypage/my_friends2")
	@ResponseBody
	public ResponseEntity<List<UserDTO>> getList(@AuthenticationPrincipal PrincipalDetails principalDetails) {

		Map map = new HashMap();
		map.put("user_no", principalDetails.getUser_no());

		return new ResponseEntity<List<UserDTO>>(service.list(map), HttpStatus.OK);
	}

	@DeleteMapping("/mypage/my_friends/{f_no}")
	@ResponseBody
	public ResponseEntity<String> remove(@PathVariable("f_no") int f_no) {

		return service.delete(f_no) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

	@GetMapping("/mypage/request_friends")
	public String request_friends(HttpServletRequest request,
			@AuthenticationPrincipal PrincipalDetails principalDetails) {
		Map map = new HashMap();

		map.put("t_id", principalDetails.getUser_no());

		List<UserDTO> list = service.rlist(map);

		request.setAttribute("list", list);
		return "/mypage/request_friends";
	}

	@GetMapping("/mypage/request_friends2")
	@ResponseBody
	public ResponseEntity<List<UserDTO>> getrequest(@AuthenticationPrincipal PrincipalDetails principalDetails) {
		Map map = new HashMap();
		map.put("t_id", principalDetails.getUser_no());

		return new ResponseEntity<List<UserDTO>>(service.rlist(map), HttpStatus.OK);
	}

//	@PostMapping("/mypage/request_friends/{user_no}")
//	 public ResponseEntity<String> add(@PathVariable("user_no") int user_no){
//		
//		return service.add(user_no) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
//			: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}

	@PostMapping("/mypage/request_friends/{f_id}/{t_id}")
	@ResponseBody
	public ResponseEntity<String> add(@PathVariable("f_id") int f_id, @PathVariable("t_id") int t_id) {
		Map map = new HashMap();
		map.put("f_id", f_id);
		map.put("t_id", t_id);
		// log.info("int:"+service.add(map));
		try {
			Integer flag = service.checkfriend(map);
			log.info("flag:" + flag);
			if (flag >= 1) {
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return service.add(map) == 2 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 친구인 경우, 친구 요청 테이블에 Insert 하지 않음

	@DeleteMapping("/mypage/request_friends/{request_no}")
	@ResponseBody
	public ResponseEntity<String> remove2(@PathVariable("request_no") int request_no) {

		return service.rdelete(request_no) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@RequestMapping("/mypage/my_posted")
	public String my_posted(HttpServletRequest request, @AuthenticationPrincipal PrincipalDetails principalDetails) {
		// 검색관련------------------------
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		String url = request.getContextPath();

		if (col.equals("total")) {
			word = "";
		}

		// 페이지관련-----------------------
		int nowPage = 1;// 현재 보고있는 페이지
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 5;// 한페이지당 보여줄 레코드갯수

		int sno = (nowPage - 1) * recordPerPage;
		int eno = recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("user_no", principalDetails.getUser_no());

		int ptotal = service.ptotal(map);

		List<BoardDTO> plist = service.plist(map);

		String paging = Utility.spaging(ptotal, nowPage, recordPerPage, col, word, url);
		// log.info("pList : " + plist);
		// request에 Model사용 결과 담는다
		request.setAttribute("plist", plist);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);

		return "/mypage/my_posted";
	}

	@RequestMapping("/mypage/my_comment")
	public String my_comment(HttpServletRequest request, @AuthenticationPrincipal PrincipalDetails principalDetails) {
		// 검색관련------------------------
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		String url = request.getContextPath();

		if (col.equals("total")) {
			word = "";
		}

		// 페이지관련-----------------------
		int nowPage = 1;// 현재 보고있는 페이지
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 5;// 한페이지당 보여줄 레코드갯수

		int sno = (nowPage - 1) * recordPerPage;
		int eno = recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("user_no", principalDetails.getUser_no());

		int ctotal = service.ctotal(map);

		List<ReplyDTO> replylist = service.replylist(map);

		String paging = Utility.spaging(ctotal, nowPage, recordPerPage, col, word, url);
		// log.info("replyList : " + replylist);
		// request에 Model사용 결과 담는다
		request.setAttribute("replylist", replylist);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);

		return "/mypage/my_comment";
	}

}
