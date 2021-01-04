package com.newneek.j1.help;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.newneek.j1.mail.MailService;
import com.newneek.j1.mail.MailVO;

@Controller
@RequestMapping("/help/**")
public class HelpController {
	
	@Autowired
	private HelpService helpService;
	

	@GetMapping("helpList")
	public ModelAndView admin_getHelpList() throws Exception{
		ModelAndView mv = new ModelAndView();
		List<HelpVO> ar = helpService.getList();
		mv.addObject("list", ar);

		mv.setViewName("/help/helpList");
		
		return mv;
	}

	
	@GetMapping("helpPage")
	public ModelAndView getList() throws Exception{
		ModelAndView mv = new ModelAndView();
		List<HelpVO> ar = helpService.getList();
		mv.addObject("list", ar);
		mv.addObject("help", "고객센터");
		return mv;
	}
	
	@PostMapping("helpPage")
    public ModelAndView execMail(MailVO mailVO) {
		ModelAndView mv = new ModelAndView();
        helpService.mailSend(mailVO);
        mv.addObject("path","/help/helpPage");
        mv.addObject("msg", "빠른 시일 내에 이메일 주소로 답변 드릴게요!");
        mv.setViewName("common/result");
        return mv;
    }
	
	@GetMapping("helpSelect")
	public ModelAndView getOne(HelpVO helpVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		helpVO = helpService.getOne(helpVO);
		mv.addObject("vo", helpVO);
		return mv;
	}
	
	@GetMapping("helpWrite")
	public ModelAndView setInsert() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/help/helpWrite");
		return mv;
	}

	
	@PostMapping("helpWrite")
	public ModelAndView setInsert(HelpVO helpVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = helpService.setInsert(helpVO);
		if(result>0) {
			mv.addObject("vo", helpVO);
			mv.addObject("msg", "글등록 성공");
			mv.addObject("path", "./helpList");
		}else {
			mv.addObject("msg", "글등록 실패");
			mv.addObject("path", "./helpWrite");
		}
		mv.setViewName("common/result");
		return mv;
	}
	
	@GetMapping("helpUpdate")
	public ModelAndView Update(HelpVO helpVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		helpVO = helpService.getOne(helpVO);
		mv.addObject("vo", helpVO);
		mv.setViewName("/help/helpUpdate");
		return mv;
	}

	
	@PostMapping("helpUpdate")
	public ModelAndView setUpdate(HelpVO helpVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = helpService.setUpdate(helpVO);
		if(result>0) {
			mv.addObject("vo", helpVO);
			mv.addObject("msg", "글수정 성공");
			mv.addObject("path", "./helpList");
		}else {
			mv.addObject("msg", "글수정 실패");
			mv.addObject("path", "./helpUpdate");
		}
		mv.setViewName("common/result");
		return mv;
	}
	
	@GetMapping("helpDelete")
	public ModelAndView setDelete(HelpVO helpVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = helpService.setDelete(helpVO);
		if(result > 0) {
			mv.addObject("msg", "글삭제 성공");
		}else {
			mv.addObject("msg", "글삭제 실패");
		}
		mv.addObject("path", "./helpList");
		mv.setViewName("common/result");
		return mv;
	}
	
	
	
}
