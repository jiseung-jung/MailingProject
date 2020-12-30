package com.newneek.j1.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.newneek.j1.member.MemberVO;

@Component
public class HelpInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("member");
		boolean result = false;
		
		System.out.println("URI : " + request.getRequestURI());
		String path = request.getRequestURI();
		String kind = path.substring(path.lastIndexOf("help")).replace("help", "");
		System.out.println("kind : " + kind);
		
		String message = "권한이 필요";
		if(memberVO != null) {
			if(memberVO.getEmail().equals("admin@newneek.com")) {
				result = true;
			}
		}
		
		
		if(!result) {
			System.out.println("ddddd");
			request.setAttribute("msg", message);
			request.setAttribute("path", "../");
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
			view.forward(request, response);
			
		}
		return result;
	}
	

}
