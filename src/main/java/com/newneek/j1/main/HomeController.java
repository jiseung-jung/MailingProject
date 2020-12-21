package com.newneek.j1.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.newneek.j1.member.MemberService;
import com.newneek.j1.member.MemberVO;

@Controller
public class HomeController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/")
	public ModelAndView home(MemberVO memberVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		long count = memberService.getMemberCount(memberVO);
		
		mv.addObject("count", count);
		mv.setViewName("index");
		
		return mv;
	}
	
	
}
