package com.newneek.j1.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.newneek.j1.member.MemberService;
import com.newneek.j1.member.MemberVO;
import com.newneek.j1.news.NewsService;
import com.newneek.j1.news.NewsVO;
import com.newneek.j1.util.Pager;

@Controller
@RequestMapping("/admin/**")
public class AdminController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	NewsService newsService;
	
	
	
	@GetMapping("adminPage")
	public ModelAndView adminPage(Pager pager, NewsVO newsVO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		long mCount = memberService.getMemberCount(pager);
		long nCount = newsService.newsCount(newsVO);
		
		mv.addObject("mCount", mCount);
		mv.addObject("nCount", nCount);
		
		return mv;
	}

}
