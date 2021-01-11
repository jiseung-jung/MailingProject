package com.newneek.j1.news;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.newneek.j1.news.file.NewsFilesVO;

@Controller
@RequestMapping("/news/**")
public class NewsController {
	
	@Autowired
	private NewsService newsService;
	@Value("${news.filePath}")
	private String filePath;
	
	
	
	
	@GetMapping("newsSelect")
	public ModelAndView admin_getNewsOne(NewsOneVO newsOneVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		newsOneVO = newsService.admin_getNewsOne(newsOneVO);
		
		mv.addObject("vo", newsOneVO);
		mv.setViewName("news/newsSelect");
		
		return mv;
	}
	
	
	@GetMapping("newsfileDown")
	public ModelAndView getFileOne(NewsFilesVO newsFilesVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		newsFilesVO = newsService.getFileOne(newsFilesVO);
		System.out.println(newsFilesVO.getFileName());
		
		mv.addObject("nfileVO", newsFilesVO);
		mv.addObject("filePath", filePath);
		mv.setViewName("fileDown");
		
		return mv;
	}

}
