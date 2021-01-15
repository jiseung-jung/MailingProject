package com.newneek.j1.security;

import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@EnableWebSecurity //활성화
public class PasswordSecurity extends WebSecurityConfigurerAdapter{

	@Override
	protected void configure(HttpSecurity http) throws Exception {
        http
        .csrf().disable() //스프링 시큐리티의 CSRF 보호 기능을 비활성화
        				  //CSRF(Cross Site Request Forgery : 사이트 간 요청 위조)
        
        .cors().disable() //CORS(Cross Origin Resource Sharing : 도메인 간 통신을 허용)
        .headers().frameOptions().disable();
	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	

}
