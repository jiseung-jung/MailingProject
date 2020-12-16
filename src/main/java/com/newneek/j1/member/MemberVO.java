package com.newneek.j1.member;

import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

import lombok.Data;

@Data
public class MemberVO {
	
	@NotEmpty
	private String email;
	@NotEmpty
	@Length(min=4, max=12)
	private String pw;
	@NotEmpty
	private String name;
	private Integer mailCheck;

}
