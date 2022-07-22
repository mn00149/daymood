package com.study.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.member.MemberDTO.*;

@Service("com.study.member.MemberServiceImpl")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;

	@Override
	public member read(String username) {
		return mapper.read(username);
	}

	@Override
	public int ptotal(Map map) {
		// TODO Auto-generated method stub
		return mapper.ptotal(map);
	}

	@Override
	public List<userDTO> list(Map map) {
		// TODO Auto-generated method stub
		return mapper.list(map);
	}

	@Override
	public int delete(int f_no) {
		// TODO Auto-generated method stub
		return mapper.delete(f_no);
	}

	@Override
	public List<userDTO> rlist(Map map) {
		// TODO Auto-generated method stub
		return mapper.rlist(map);
	}

	@Override
	public int rdelete(int reuqest_no) {
		// TODO Auto-generated method stub
		return mapper.rdelete(reuqest_no);
	}

	@Override
	public int add(Map map) {

		return mapper.add(map);
	}

	@Override
	public List<boardDTO> plist(Map map) {
		return mapper.plist(map);
	}

	@Override
	public List<replyDTO> replylist(Map map) {
		return mapper.replylist(map);
	}

	@Override
	public int stotal(Map map) {
		// TODO Auto-generated method stub
		return mapper.stotal(map);
	}

	@Override
	public List<scrapDTO> scraplist(Map map) {
		// TODO Auto-generated method stub
		return mapper.scraplist(map);
	}

	@Override
	public int ScrapDelete(int scrapno) {
		// TODO Auto-generated method stub
		return mapper.ScrapDelete(scrapno);
	}




}