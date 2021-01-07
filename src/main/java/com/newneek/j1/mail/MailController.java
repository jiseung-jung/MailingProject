package com.newneek.j1.mail;

import java.util.List;

import org.apache.ibatis.javassist.compiler.ast.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.MvcNamespaceHandler;

import com.newneek.j1.member.MemberService;
import com.newneek.j1.member.MemberVO;
import com.newneek.j1.news.NewsService;
import com.newneek.j1.news.NewsVO;
import com.newneek.j1.util.Pager;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class MailController {
	
	private final MailService mailService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private NewsService newsService;

    @GetMapping("mail")
    public ModelAndView dispMail() throws Exception{
    	ModelAndView mv = new ModelAndView();
    	List<NewsVO> newsList = newsService.getEmailList(); 
    	for(NewsVO newsVO : newsList) {
    		System.out.println(newsVO.getContents());
    	}
    	mv.addObject("news" , newsList );
    	mv.setViewName("mail/mail");
		return mv;
    }

    @PostMapping("mail")
    public void execMail(MailVO mailVO) throws Exception {
    	
    	List<MemberVO> ar = memberService.getEmailMemberList();
    	
    	
    	for(MemberVO memberVO : ar) {
    		
    		mailVO.setAddress(memberVO.getEmail());
    		mailService.mailSend(mailVO);
    	}
    	
    }
}
