package com.study.member;

import java.util.List;
import java.util.Map;

import com.study.board.BoardDTO;
import com.study.reply.ReplyDTO;
import com.study.user.UserDTO;

public interface MemberService {
	UserDTO read(String username);

	int ptotal(Map map);

	int delete(int f_no);

	List<UserDTO> rlist(Map map);

	int rdelete(int request_no);

	int add(Map map);

	List<UserDTO> list(Map map);

	List<BoardDTO> plist(Map map);

	List<ReplyDTO> replylist(Map map);

	int stotal(Map map);

	List<scrapDTO> scraplist(Map map);

	int ScrapDelete(int scrapno);

	int ctotal(Map map);

	int reqFriend(Map map);

	Integer checkfriend(Map map);

	Integer checkReqfriend(Map map);

	Integer checkboth(Map map);

	void reqBothDelete(Map map);

}
