package com.newneek.j1.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member/**")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	
	@GetMapping("memberProfile")
	public ModelAndView getMemberProfile() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("member/memberProfile");
		
		return mv;
	}
	
	
	@GetMapping("memberJoin")
	public ModelAndView setMemberJoin() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("member/memberJoin");
		
		return mv;
	}
	
	@PostMapping("memberJoin")
	public ModelAndView setMemberJoin(MemberVO memberVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = memberService.setMemberJoin(memberVO);
		
		if(result>0) {
			mv.addObject("msg", "Welcome NEWNEEK!");
			mv.addObject("path", "../");
		}else {
			mv.addObject("msg", "회원가입에 실패했습니다.");
			mv.addObject("path", "./memberJoin");
		}
		
			mv.setViewName("common/result");
		
		return mv;
	}
	
	
	@PostMapping("memberSub")
	public ModelAndView setMemberSub(MemberVO memberVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = memberService.setMemberSub(memberVO);
		
		if(result>0) {
			mv.addObject("msg", "NEWNEEK 구독 완료!");
			mv.addObject("path", "../");
		}else {
			mv.addObject("msg", "구독 실패");
			mv.addObject("path", "../");
		}
		
			mv.setViewName("common/result");
		
		return mv;
	}
	
	
	@GetMapping("emailCheck")
	public ModelAndView emailCheck(MemberVO memberVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		memberVO = memberService.emailCheck(memberVO);
		
		int result = 0;
		
		if(memberVO != null) {
			result = 1;
		}
		
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	

}
