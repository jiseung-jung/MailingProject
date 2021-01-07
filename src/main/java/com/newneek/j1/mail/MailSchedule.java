package com.newneek.j1.mail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.newneek.j1.member.MemberService;
import com.newneek.j1.member.MemberVO;
import com.newneek.j1.news.NewsService;
import com.newneek.j1.news.NewsVO;

import lombok.AllArgsConstructor;

@Component
public class MailSchedule {

	@Autowired
	private MailService mailService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private NewsService newsService;

	@Scheduled(cron = "0 0 9 * * 1,3,5" )
    public void MailTest() throws Exception {
		MailVO mailVO = new MailVO();
    	List<NewsVO> newsList = newsService.getEmailList(); 
    	List<MemberVO> ar = memberService.getEmailMemberList();
    	
    	if(newsList.size()>0) {
    	
    	for(MemberVO memberVO : ar) {
    		
    		mailVO.setTitle("test");
    		mailVO.setAddress(memberVO.getEmail());
    		
    		StringBuffer sb = new StringBuffer();
    		sb.append("<div style='width:70%; margin:0 auto;'>");
    		for(NewsVO newsVO : newsList) {
    			sb.append("<h1 style='font-size:30px;font-weight:bold;text-align:center;'>" + newsVO.getTitle() + "</h1><br>");
    			sb.append(newsVO.getContents());
    			sb.append("<br><hr><br>");
        	}
    		sb.append("</div>");
    		mailVO.setContents(sb.toString());
    		
    		mailService.mailSend(mailVO);
    	}
    	
    	
    	}
    }
}
