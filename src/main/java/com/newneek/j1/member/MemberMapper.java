package com.newneek.j1.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.newneek.j1.util.Pager;

@Mapper
public interface MemberMapper {
	
	public int setMemberJoin(MemberVO memberVO) throws Exception;
	
	public int setMemberSub(MemberVO memberVO) throws Exception;
	
	public int setMemberUpdate(MemberVO memberVO) throws Exception;
	
	public MemberVO emailCheck(MemberVO memberVO) throws Exception;
	
	public long getMemberCount(Pager pager) throws Exception;
	
	public MemberVO getMemberLogin(MemberVO memberVO) throws Exception;
	
	public int setMemberInfo(MemberVO memberVO) throws Exception;
	
	public int setMemberPw(MemberVO memberVO) throws Exception;
	
	public int setMemberDelete(MemberVO memberVO) throws Exception;
	
	//-------------------------------------- Admin
	
	public List<MemberVO> admin_getMemberList(Pager pager) throws Exception;
	
	//-------------------------------------- Email
	public List<MemberVO> getEmailMemberList() throws Exception;
	
	
}
