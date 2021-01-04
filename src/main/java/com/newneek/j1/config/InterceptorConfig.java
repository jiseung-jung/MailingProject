package com.newneek.j1.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.newneek.j1.interceptor.HelpInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {
	
	@Autowired
	private HelpInterceptor helpInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(helpInterceptor)
		.addPathPatterns("/help/**")
		.excludePathPatterns("/help/helpPage");
		
		WebMvcConfigurer.super.addInterceptors(registry);
	}
	
	

}
