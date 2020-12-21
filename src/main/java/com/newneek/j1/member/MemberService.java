package com.newneek.j1.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;


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
	
	public long getMemberCount(MemberVO memberVO) throws Exception{
		return memberMapper.getMemberCount(memberVO);
	}
	
	public int setMemberInfo(MemberVO memberVO) throws Exception {
		return memberMapper.setMemberInfo(memberVO);
	}

}
