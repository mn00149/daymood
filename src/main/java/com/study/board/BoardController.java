package com.study.board;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
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
	public String create(HttpServletRequest request, BoardDTO dto, Authentication authentication,
			@RequestParam String select_category) {

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
		if (map.get("weather_category") != null) {
			String cate = (String) map.get("weather_category");
			switch (cate) {
			case "맑음":
				return "redirect:weather/sunny";

			case "흐림":
				return "redirect:weather/cloudy";

			case "비":
				return "redirect:weather/rainy";

			default:
				return "redirect:weather_list";
			}

		} else if (map.get("info_category") != null) {
			String cate = (String) map.get("info_category");
			switch (cate) {
			case "미국":
				return "redirect:info/america";

			case "호주":
				return "redirect:info/australia";

			case "캐나다":
				return "redirect:info/canada";

			case "중국":
				return "redirect:info/china";

			case "유럽":
				return "redirect:info/europe";

			case "일본":
				return "redirect:info/japan";

			case "기타":
				return "redirect:info/etc";

			default:
				return "redirect:info_list";
			}
		} else {
			
				return "redirect:./recommend/music";

			}
		}
	

	// read start
	@GetMapping("/board/read/{board_no}")
	public String read(@PathVariable int board_no, Model model, HttpServletRequest request,
			@AuthenticationPrincipal PrincipalDetails userDetails) {
		dao.upViewcnt(board_no); // 조회수 증가
		model.addAttribute("dto", dao.read(board_no));
		// 검색 관련 --------------------------
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		// 페이징 관련 ------------------------
		int nowPage = 1;
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("nowPage", nowPage);

		/* 댓글 관련 시작 */
		int nPage = 1;
		if (request.getParameter("nPage") != null) {
			nPage = Integer.parseInt(request.getParameter("nPage"));
		}
		int recordPerPage = 1;

		int sno = (nPage - 1) * recordPerPage;
		int eno = nPage * recordPerPage;

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

		model.addAttribute("dto", dao.read(board_no));

		return "/board/common/update";
	}

	@PostMapping("/board/update")
	public String update(BoardDTO dto) {
		Map map = new HashMap();
		map.put("board_no", dto.getBoard_no());

		int cnt = 0;
		cnt = dao.update(dto); // 게시글 업데이트 후 cnt ++

		if (cnt == 1) { // 게시물 업데이트 성공
			// return "redirect:/board/read/" + dto.getBoard_no(); // 해당 게시글로 이동
			return "redirect:/board/weather_list";
		} else {
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

		if (cnt == 1) {
			return "redirect:/board/weather_list";
		} else {
			return "error";
		}

	} // --------- board 공통

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
		int total = dao.weather_all_total(map);
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

		// weather_total - 세부 게시판 페이징 관련(세부 게시판마다 글 개수가 달라서)
		String db = ""; // 지역변수 밖으로 빼주기 위해서 변수 선언

		if (weather.equals("sunny")) {
			db = "맑음";
			map.put("weather", db);
		} else if (weather.equals("cloudy")) {
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

		String paging = Utility.weather_paging(total, nowPage, recordPerPage, col, word, weather);

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

	// info_all start
	@GetMapping("/board/info_list")
	public String info_list(HttpServletRequest request) {

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

		List<BoardDTO> list = dao.info_list(map);
		int total = dao.info_all_total(map);
		String paging = Utility.paging2(total, nowPage, recordPerPage, col, word);

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

		return "/board/info/info_list";
	} // info_all end

	// info_category start
	@GetMapping("/board/info/{info}")
	public String info_category_list(HttpServletRequest request, @PathVariable("info") String info) {

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

		String db = ""; // 지역변수 밖으로 빼주기 위해서 변수 선언

		if (info.equals("america")) {
			db = "미국";
			map.put("info", db);
		} else if (info.equals("china")) {
			db = "중국";
			map.put("info", db);
		} else if (info.equals("canada")) {
			db = "캐나다";
			map.put("info", db);
		} else if (info.equals("australia")) {
			db = "호주";
			map.put("info", db);
		} else if (info.equals("japan")) {
			db = "일본";
			map.put("info", db);
		} else if (info.equals("europe")) {
			db = "유럽";
			map.put("info", db);
		} else {
			db = "기타";
			map.put("info", db);
		}

		List<String> date_list = new ArrayList<>();

		if (info.equals("america")) {
			List<BoardDTO> list = dao.list_america(map);
			request.setAttribute("list", list);

			for (int i = 0; i < list.size(); i++) {
				date_list.add(list.get(i).getCreate_date());
			}

		} else if (info.equals("china")) {
			List<BoardDTO> list = dao.list_china(map);
			request.setAttribute("list", list);

			for (int i = 0; i < list.size(); i++) {
				date_list.add(list.get(i).getCreate_date());
			}

		} else if (info.equals("canada")) {
			List<BoardDTO> list = dao.list_canada(map);
			request.setAttribute("list", list);

			for (int i = 0; i < list.size(); i++) {
				date_list.add(list.get(i).getCreate_date());
			}

		} else if (info.equals("australia")) {
			List<BoardDTO> list = dao.list_australia(map);
			request.setAttribute("list", list);

			for (int i = 0; i < list.size(); i++) {
				date_list.add(list.get(i).getCreate_date());
			}

		} else if (info.equals("europe")) {
			List<BoardDTO> list = dao.list_europe(map);
			request.setAttribute("list", list);

			for (int i = 0; i < list.size(); i++) {
				date_list.add(list.get(i).getCreate_date());
			}

		} else if (info.equals("japan")) {
			List<BoardDTO> list = dao.list_japan(map);
			request.setAttribute("list", list);

			for (int i = 0; i < list.size(); i++) {
				date_list.add(list.get(i).getCreate_date());
			}

		} else {
			List<BoardDTO> list = dao.list_etc(map);
			request.setAttribute("list", list);

			for (int i = 0; i < list.size(); i++) {
				date_list.add(list.get(i).getCreate_date());
			}
		}

		int total = dao.info_total(map);

		String paging = Utility.info_paging(total, nowPage, recordPerPage, col, word, info);

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

		if (info.equals("america"))
			return "/board/info/america";
		else if (info.equals("china"))
			return "/board/info/china";
		else if (info.equals("canada"))
			return "/board/info/canada";
		else if (info.equals("australia"))
			return "/board/info/australia";
		else if (info.equals("europe"))
			return "/board/info/europe";
		else if (info.equals("japan"))
			return "/board/info/japan";
		else
			return "/board/info/etc";
	} // info_category end

	// recommend_category start
	@GetMapping("/board/recommend/{recommend}")
	public String recommend_category_list(HttpServletRequest request, @PathVariable("recommend") String recommend)
			throws ParseException, UnsupportedEncodingException {

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

		int recordPerPage = 0;
		if (recommend.equals("movie") || recommend.equals("book")) {
			recordPerPage = 5;
		} else {
			recordPerPage = 15;
		}

		int sno = ((nowPage - 1) * recordPerPage);
		int eno = recordPerPage;

		// 1. model 사용
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		String db = ""; // 지역변수 밖으로 빼주기 위해서 변수 선언

		if (recommend.equals("movie")) {
			db = "영화";
			map.put("recommend", db);
		} else if (recommend.equals("book")) {
			db = "도서";
			map.put("recommend", db);
		} else {
			db = "음악";
			map.put("recommend", db);
		}

		List<String> date_list = new ArrayList<>();

		if (recommend.equals("movie")) {
			List<BoardDTO> list = dao.list_movie(map);
			request.setAttribute("list", list);

			for (int i = 0; i < list.size(); i++) {
				date_list.add(list.get(i).getCreate_date());
			}

		} else if (recommend.equals("book")) {
			List<BoardDTO> list = dao.list_book(map);
			request.setAttribute("list", list);

			for (int i = 0; i < list.size(); i++) {
				date_list.add(list.get(i).getCreate_date());
			}
		} else {
			List<BoardDTO> list = dao.list_music(map);
			request.setAttribute("list", list);

			for (int i = 0; i < list.size(); i++) {
				date_list.add(list.get(i).getCreate_date());
			}
		}

		int total = dao.recommend_total(map);
		String paging = Utility.recommend_paging(total, nowPage, recordPerPage, col, word, recommend);

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

		if (recommend.equals("movie"))
			return "/board/recommend/movie";
		else if (recommend.equals("book"))
			return "/board/recommend/book";
		else
			return "/board/recommend/music";
	} // weather_category end

	@GetMapping("/board/recommend/recommend_create")
	public String recommend_create() {
		return "/board/recommend/recommend_create";
	}

	@GetMapping("/board/recommend/recommend_create2")
	public String recommend_create2() {
		return "/board/recommend/recommend_create2";
	}

	@PostMapping("/board/recommend/recommend_create")
	public String recommend_create(BoardDTO dto, Authentication authentication, @RequestParam String select_category) {

		PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
		Map map = new HashMap();

		select_category = select_category.replace(",", ""); // select_category 값 뒤에 ,가 붙어 제거함.

		map.put("user_no", principalDetails.getUser().getUser_no());
		map.put("nation", principalDetails.getUser().getNation());
		map.put("username", principalDetails.getUser().getUsername());
		map.put("title", dto.getTitle());
		map.put("content", dto.getContent());
		map.put("recommend_name", dto.getRecommend_name());
		map.put("recommend_src", dto.getRecommend_src());
		map.put("recommend_img", dto.getRecommend_img());

		System.out.println(map);
		System.out.println("img : " + dto.getRecommend_img() + " / src : " + dto.getRecommend_src());
		System.out.println("name : " + dto.getRecommend_name());

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

		int cnt = dao.recommend_create(map);

		if (cnt != 1) {
			return "error";
		}
		if (map.get("recommend_category") != null) {
			String cate = (String) map.get("recommend_category");
			switch (cate) {
			case "영화":
				return "redirect:/board/recommend/movie";

			case "도서":
				return "redirect:/board/recommend/book";

			case "음악":
				return "redirect:/board/recommend/music";

			default:
				return "redirect:/board/recommend/movie";
			}
		}
		return "redirect:/board/recommend/movie";
	}

	// 좋아요 기능 구현
	@ResponseBody
	@PostMapping("/board/read")
	public int updateLike(HttpServletRequest request) throws Exception {

		int board_no = Integer.parseInt(request.getParameter("board_no"));
		int user_no = Integer.parseInt(request.getParameter("user_no"));
		String username = request.getParameter("username");

		Map map = new HashMap();
		map.put("board_no", board_no);
		map.put("user_no", user_no);
		map.put("username", username);

		int likeCheck = dao.likeCheck(map);

		if (likeCheck == 0) { // 로그인한 회원이 해당 게시글에 좋아요를 처음 누름
			dao.insertLike(map); // 좋아요를 누르면 LikeTable에 insert
			dao.updateLike_cnt(map); // 게시글 like_cnt ++
			dao.updateLikeCheck(map); // likecheck 1로 변경
		} else if (likeCheck == 1) { // 이미 좋아요를 누른 상태
			dao.updateLikeCheckCancel(map); // likecheck 0으로 변경(좋아요 취소)
			dao.updateLike_cnt2(map); // 게시글 like_cnt --
			dao.deleteLike(map); // like 테이블 삭제
		}

		return likeCheck;
	}

	@ResponseBody
	@PostMapping("/naverapi")
	public List<Map> Movie(HttpServletRequest request) throws ParseException, UnsupportedEncodingException {

		String naver_data = request.getParameter("naver_data");

		String id = "HmFQZMRJn2mtrXjmCOgR";
		String secret = "oi3E1Y6Zti";

		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("id", id);
		requestHeaders.put("secret", secret);

		NaverCrawler crawler = new NaverCrawler();
		String url;

		url = URLEncoder.encode(naver_data, "UTF-8");
		String response = crawler.search(id, secret, url); // 검색 결과를 String 형태로 받아 response 변수에 넣어줌
		String json = response;

		JSONParser parser = new JSONParser();
		JSONObject obj = (JSONObject) parser.parse(json);
		JSONArray item = (JSONArray) obj.get("items");

		List<Map> list = new ArrayList();

		for (int i = 0; i < (item.size()); i++) {
			JSONObject tmp = (JSONObject) item.get(i);
			String title = (String) tmp.get("title");
			String image = (String) tmp.get("image");
			String link = (String) tmp.get("link");

			HashMap<String, String> map = new HashMap<String, String>();

			map.put("title", title);
			map.put("image", image);
			map.put("link", link);

			if (map != null) {
				list.add(map);
			}
		} // for

		return list;
	}

	@ResponseBody
	@PostMapping("/naverapi/book")
	public List<Map> Book(HttpServletRequest request) throws ParseException, UnsupportedEncodingException {

		String naver_data = request.getParameter("naver_data");

		String id = "HmFQZMRJn2mtrXjmCOgR";
		String secret = "oi3E1Y6Zti";

		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("id", id);
		requestHeaders.put("secret", secret);

		NaverCrawler2 crawler2 = new NaverCrawler2();
		String url;

		url = URLEncoder.encode(naver_data, "UTF-8");
		String response = crawler2.search(id, secret, url); // 검색 결과를 String 형태로 받아 response 변수에 넣어줌
		String json = response;

		JSONParser parser = new JSONParser();
		JSONObject obj = (JSONObject) parser.parse(json);
		JSONArray item = (JSONArray) obj.get("items");

		List<Map> list = new ArrayList();

		for (int i = 0; i < (item.size()); i++) {
			JSONObject tmp = (JSONObject) item.get(i);
			String title = (String) tmp.get("title");
			String image = (String) tmp.get("image");
			String link = (String) tmp.get("link");

			HashMap<String, String> map = new HashMap<String, String>();

			map.put("title", title);
			map.put("image", image);
			map.put("link", link);

			if (map != null) {
				list.add(map);
			}
		} // for

		return list;
	}

}