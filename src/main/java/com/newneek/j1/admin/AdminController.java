package com.newneek.j1.admin;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	public ModelAndView adminPage(Pager pager) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		long mCount = memberService.getMemberCount(pager);
		long nCount = newsService.getNewsCount(pager);
		
		mv.addObject("mCount", mCount);
		mv.addObject("nCount", nCount);
		
		return mv;
	}
	
	
	
//-------------------------------------------------------------------------------
	
	
	@GetMapping("admin_MemberList")
	public ModelAndView admin_getMemberList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<MemberVO> ar = memberService.admin_getMemberList(pager);
		long mCount = memberService.getMemberCount(pager);
		
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.addObject("mCount", mCount);
		mv.setViewName("admin/admin_MemberList");
		
		return mv;
	}
	
	
	
//-------------------------------------------------------------------------------
	
	
	@GetMapping("admin_NewsList")
	public ModelAndView admin_getNewsList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<NewsVO> ar = newsService.admin_getNewsList(pager);
		long nCount = newsService.getNewsCount(pager);
		
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.addObject("nCount", nCount);
		mv.setViewName("admin/admin_NewsList");
		
		return mv;
	}
	
	
	@GetMapping("admin_NewsWrite")
	public ModelAndView admin_setNewsInsert(NewsVO newsVO) throws Exception{
		ModelAndView mv = new ModelAndView();

		mv.setViewName("/admin/admin_NewsWrite");
		return mv;
	}
	
	
	@PostMapping("admin_NewsWrite")
	public ModelAndView admin_setNewsInsert(@Valid NewsVO newsVO, BindingResult bindingResult) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		if(newsService.getNewsError(newsVO, bindingResult)) {
			mv.setViewName("admin/admin_NewsWrite");
			return mv;
		}
		
		int result = newsService.admin_setNewsInsert(newsVO);
		
		if(result>0) {
			mv.addObject("msg", "기사 작성 완료!");
			mv.addObject("path", "/admin/admin_NewsList");
		}else {
			mv.addObject("msg", "작성 실패");
			mv.addObject("path", "/admin/admin_NewsWrite");
		}
		
		mv.setViewName("common/result");
		
		return mv;
	}
	
	
	
	
	
	
	
	

}
