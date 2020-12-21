package com.newneek.j1.member;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/member/**")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	
	@GetMapping("memberLogin")
	public void getMemberLogin(MemberVO memberVO) throws Exception{
		
	}
	
	@PostMapping("memberLogin")
	public ModelAndView getMemberLogin(MemberVO memberVO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		memberVO = memberService.getMemberLogin(memberVO);
		
		if(memberVO != null) {
			session.setAttribute("member", memberVO);
			mv.setViewName("redirect:../");
		} else {
			String message = "Login Fail";
			mv.addObject("msg", message);
			mv.addObject("path", "./memberLogin");
			mv.setViewName("common/result");
		}
		return mv;
	}
	
	@GetMapping("memberLogout")
	public String getmemberLogout(HttpSession session) throws Exception{
		session.invalidate();
		return "redirect:../";
	}
	
	@GetMapping("memberJoin")
	public ModelAndView setMemberJoin(MemberVO memberVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("member/memberJoin");
		
		return mv;
	}
	
	@PostMapping("memberJoin")
	public ModelAndView setMemberJoin(@Valid MemberVO memberVO, BindingResult bindingResult) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		if(memberService.getMemberError(memberVO, bindingResult)) {
			mv.setViewName("member/memberJoin");
			return mv;
		}
		
		
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
	
	@GetMapping("memberJoin_clause1")
	public ModelAndView memberJoin_clause1() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("member/memberJoin_clause1");
		return mv;
	}
	
	@GetMapping("memberJoin_clause2")
	public ModelAndView memberJoin_clause2() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("member/memberJoin_clause2");
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
	
	
	
	@GetMapping("memberProfile")
	public ModelAndView getMemberProfile() throws Exception{
	   ModelAndView mv = new ModelAndView();
	      
	   mv.setViewName("member/memberProfile");
	      
	   return mv;
	}
	

}
