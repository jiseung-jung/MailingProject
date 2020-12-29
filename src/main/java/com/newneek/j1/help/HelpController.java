package com.newneek.j1.help;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/help/**")
public class HelpController {
	
	@Autowired
	private HelpService helpService;
	
	
	@GetMapping("helpPage")
	public ModelAndView getList() throws Exception{
		ModelAndView mv = new ModelAndView();
		List<HelpVO> ar = helpService.getList();
		mv.addObject("list", ar);
		mv.addObject("help", "고객센터");
		return mv;
	}
}
