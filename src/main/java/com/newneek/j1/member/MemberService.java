package com.newneek.j1.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.newneek.j1.util.Pager;


@Service
public class MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	
	
	public MemberVO getMemberLogin(MemberVO memberVO) throws Exception {
		return memberMapper.getMemberLogin(memberVO);
	}
	
	public int setMemberJoin(MemberVO memberVO) throws Exception{
		return memberMapper.setMemberJoin(memberVO);
	}
	
	
	public boolean getMemberError(MemberVO memberVO, BindingResult bindingResult) throws Exception{
		//result : true -> 검증 위반(실패)
		//result : false -> 검증 성공
		boolean result = false;
		
		//기본 Annotation 검증 결과
		if(bindingResult.hasErrors()) {
			result = true;
		}
		
		//Password가 일치하는지 검증
		if(!memberVO.getPw().equals(memberVO.getPw2())) {
			//bindingResult.rejectValue("멤버변수명", "propertie 파일의 코드(키)", "코드가 없으면 기본메세지");
			bindingResult.rejectValue("pw2", "memberVO.password.notEqual");
			result = true;
		}
		
		//email 중복검사
		MemberVO email = memberMapper.emailCheck(memberVO);
		if(email != null) {
			bindingResult.rejectValue("email", "memberVO.email.Duplicate");
			result = true;
		}
		
		return result;
	}
	
	public int setMemberSub(MemberVO memberVO) throws Exception{
		return memberMapper.setMemberSub(memberVO);
	}
	
	public int setMemberUpdate(MemberVO memberVO) throws Exception{
		return memberMapper.setMemberUpdate(memberVO);
	}
	
	public MemberVO emailCheck(MemberVO memberVO) throws Exception{
		return memberMapper.emailCheck(memberVO);
	}
	
	public long getMemberCount(Pager pager) throws Exception{
		return memberMapper.getMemberCount(pager);
	}
	
	public int setMemberInfo(MemberVO memberVO) throws Exception {
		return memberMapper.setMemberInfo(memberVO);
	}
	
	public int setMemberPw(MemberVO memberVO) throws Exception {
		return memberMapper.setMemberPw(memberVO);
	}
	
	public int setMemberDelete(MemberVO memberVO) throws Exception {
		return memberMapper.setMemberDelete(memberVO);
	}
	
	public int emailCheckUpdate(MemberVO memberVO) throws Exception{
		return memberMapper.emailCheckUpdate(memberVO);
	}
	
	
	//-------------------------------------- Admin
	
	public List<MemberVO> admin_getMemberList(Pager pager) throws Exception{
		pager.makeRow();
		long totalCount = memberMapper.getMemberCount(pager);
		pager.makePage(totalCount);
		
		return memberMapper.admin_getMemberList(pager);
	}

}
