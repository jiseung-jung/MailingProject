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

@Controller
@RequestMapping("/news/**")
public class NewsController {
	
	@Autowired
	private NewsService newsService;
	@Value("${news.filePath}")
	private String filePath;
	
	@Autowired
	private LikeService likeService;
	
	
	
	@GetMapping("newsSelect")
	public ModelAndView admin_getNewsOne(NewsOneVO newsOneVO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		newsOneVO = newsService.admin_getNewsOne(newsOneVO);

		
		if(memberVO!= null) {
			List<LikeVO> ar = likeService.getLikeList(memberVO.getEmail());
			for(LikeVO likeVO : ar) {
				if(newsOneVO.getNum()==likeVO.getNewsNum()) {
					mv.addObject("class", "like");
					System.out.println(likeVO.getEmail());
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
	
}
