package com.newneek.j1.news;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/news/**")
public class NewsController {
	
	@Autowired
	private NewsService newsService;
	
	
	
	@GetMapping("newsSelect")
	public ModelAndView admin_getNewsOne(NewsOneVO newsOneVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		newsOneVO = newsService.admin_getNewsOne(newsOneVO);
		
		mv.addObject("vo", newsOneVO);
		mv.setViewName("news/newsSelect");
		
		return mv;
	}

}
