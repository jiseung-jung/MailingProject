package com.newneek.j1.security;

import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@EnableWebSecurity //활성화
public class PasswordSecurity implements PasswordEncoder{
	
	private PasswordEncoder passwordEncoder;
	
	public PasswordSecurity() {
		this.passwordEncoder = new BCryptPasswordEncoder();
	}
	
	public PasswordSecurity(PasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
		
	}

	@Override
	public String encode(CharSequence rawPassword) {
		return passwordEncoder.encode(rawPassword);
	}

	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		return passwordEncoder.matches(rawPassword, encodedPassword);
	}
	
	
	

}
