package com.newneek.j1.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	
	public int setMemberJoin(MemberVO memberVO) throws Exception;
	
	public int setMemberSub(MemberVO memberVO) throws Exception;
	
	public int setMemberUpdate(MemberVO memberVO) throws Exception;
	
	public MemberVO emailCheck(MemberVO memberVO) throws Exception;
	
	public long getMemberCount(MemberVO memberVO) throws Exception;
}
