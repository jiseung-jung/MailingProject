package com.newneek.j1.news;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.newneek.j1.like.LikeService;
import com.newneek.j1.like.LikeVO;
import com.newneek.j1.member.MemberVO;
import com.newneek.j1.news.file.NewsFilesVO;
import com.newneek.j1.util.C_Pager;
import com.newneek.j1.util.C_Pager2;
import com.newneek.j1.util.Pager;

@Controller
@RequestMapping("/news/**")
public class NewsController {
	
	@Autowired
	private NewsService newsService;
	@Value("${news.filePath}")
	private String filePath;
	
	@Autowired
	private LikeService likeService;
	
	
	
	
	@GetMapping("newsList")
	public ModelAndView c_getNewsList(C_Pager2 c_Pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<NewsVO> ar = newsService.c_getNewsList(c_Pager);
		mv.addObject("list", ar);
		mv.setViewName("news/newsCard");
		
		return mv;
	}
	
	@GetMapping("newsCard")
	public ModelAndView newsCard(NewsOneVO newsOneVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		newsOneVO = newsService.admin_getNewsOne(newsOneVO);
		mv.addObject("vo", newsOneVO);
		mv.setViewName("news/newsCard");
		
		return mv;
	}
	
	@GetMapping("newsSelect")
	public ModelAndView admin_getNewsOne(NewsOneVO newsOneVO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		newsOneVO = newsService.admin_getNewsOne(newsOneVO);

		
		if(memberVO!= null) {
			List<LikeVO> ar = likeService.getLikeList(memberVO.getEmail());

			for(LikeVO likeVO : ar) {
				if(newsOneVO.getNum()==likeVO.getNewsNum()) {
					mv.addObject("class", "active");
					System.out.println("newnum" + newsOneVO.getNum());
					System.out.println(likeVO.getNewsNum());
				}
			}
				
			mv.addObject("num" , newsOneVO.getNum());
			mv.addObject("email", memberVO.getEmail());
		}
		
		
		mv.addObject("vo", newsOneVO);
		mv.setViewName("news/newsSelect");
		return mv;
	}
	
	
	@GetMapping("newsFileDown")
	public ModelAndView getFileOne(NewsFilesVO newsFilesVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		newsFilesVO = newsService.getFileOne(newsFilesVO);
		System.out.println(newsFilesVO.getFileName());
		
		mv.addObject("newsFilesVO", newsFilesVO);
		mv.addObject("filePath", filePath);
		mv.setViewName("fileDown");
		
		return mv;
	}
	
	@GetMapping("newsLike")
	public ModelAndView getLike(LikeVO likeVO) throws Exception {
		ModelAndView mv = new ModelAndView();
	
		return mv;
	}
	

	@PostMapping("newsLike")
	public ModelAndView setInsert(LikeVO likeVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int count = likeService.getCount(likeVO);
		System.out.println("좋아요 " + count);
		if(count==0) {
			likeService.setInsert(likeVO);
		}else {
			likeVO =likeService.getOne(likeVO);
			likeService.setDelete(likeVO);
		}
		mv.addObject("path", "./");
		mv.setViewName("common/result");
		return mv;
	}
	
	@GetMapping("newsPage")
	public ModelAndView newsPage() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("news/newsPage");
		return mv;
		
	}
	
}
