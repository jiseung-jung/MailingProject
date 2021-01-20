package com.newneek.j1.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.newneek.j1.member.MemberService;
import com.newneek.j1.member.MemberVO;
import com.newneek.j1.news.NewsService;
import com.newneek.j1.news.NewsVO;
import com.newneek.j1.util.Pager;

@Controller
public class HomeController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private NewsService newsService;
	
	@GetMapping("/")
	public ModelAndView home(Pager pager, NewsVO newsVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		long count = memberService.getMemberCount(pager);
		List<NewsVO> ar = newsService.main_getNewsList(newsVO);
		for(NewsVO nVO : ar) {
			System.out.println("nVO.num " + nVO.getNum());
			System.out.println("nVO.file " + nVO.getFileList());
			System.out.println("nVO.cte" + nVO.getCategoryVO());
			System.out.println("=========================");
		}
		
		mv.addObject("count", count);
		mv.addObject("list", ar);
		mv.setViewName("index");
		
		return mv;
	}
	
	
	
}
