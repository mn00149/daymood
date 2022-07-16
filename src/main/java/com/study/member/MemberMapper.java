package com.study.member;

import java.util.List;
import java.util.Map;

import com.study.member.MemberDTO.*;

public interface MemberMapper {
	member read(String username);
	int total(Map map);
	List<MemberDTO> list(Map map);
	int delete(int friend_no);
}
