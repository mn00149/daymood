package com.study.member;

import java.util.List;
import java.util.Map;

import com.study.member.MemberDTO.*;

public interface MemberService {
	member read(String username);

	int ptotal(Map map);

	int delete(int f_no);

	List<userDTO> rlist(Map map);

	int rdelete(int request_no);

	int add(Map map);

	List<userDTO> list(Map map);

	List<boardDTO> plist(Map map);

	List<replyDTO> replylist(Map map);
}
