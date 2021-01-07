package com.newneek.j1.mail;

import java.util.List;

import org.apache.ibatis.javassist.compiler.ast.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.newneek.j1.member.MemberService;
import com.newneek.j1.member.MemberVO;
import com.newneek.j1.util.Pager;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class MailController {
	
	private final MailService mailService;
	
	@Autowired
	private MemberService memberService;

    @GetMapping("mail")
    public ModelAndView dispMail(Pager pager) throws Exception{
    	ModelAndView mv = new ModelAndView();
    	List<MemberVO> ar = memberService.getEmailMemberList();
    	for(MemberVO memberVO : ar) {
    		System.out.println(memberVO.getEmail() + ",");
    	}
    	mv.addObject("memberList" , ar);
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
