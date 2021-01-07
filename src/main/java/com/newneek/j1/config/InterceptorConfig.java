package com.newneek.j1.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.newneek.j1.interceptor.HelpInterceptor;
import com.newneek.j1.interceptor.MailInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {
	
	@Autowired
	private HelpInterceptor helpInterceptor;
	
	@Autowired
	private MailInterceptor mailInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(helpInterceptor)
		.addPathPatterns("/help/**")
		.excludePathPatterns("/help/helpPage");
		
		registry.addInterceptor(mailInterceptor)
		.addPathPatterns("/mail");
		
		WebMvcConfigurer.super.addInterceptors(registry);
	}
	
	

}
