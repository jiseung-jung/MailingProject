package com.newneek.j1.help;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/help/**")
public class HelpController {
	
	
	
	@GetMapping("helpPage")
	public ModelAndView helpPage() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}

}
