package com.newneek.j1.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	
	
	public int setMemberJoin(MemberVO memberVO) throws Exception{
		return memberMapper.setMemberJoin(memberVO);
	}
	
	public int setMemberSub(MemberVO memberVO) throws Exception{
		return memberMapper.setMemberSub(memberVO);
	}
	
	public int setMemberUpdate(MemberVO memberVO) throws Exception{
		return memberMapper.setMemberUpdate(memberVO);
	}

}
