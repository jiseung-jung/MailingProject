package com.newneek.j1.member;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

import lombok.Data;

@Data
public class MemberVO {
	
	@NotEmpty
	@Email
	private String email;
	
	@NotEmpty
	@Length(min=8, max=12)
	private String pw;
	
	private String pw2;
	
	@NotEmpty
	@Length(min=2)
	private String name;
	
	private Integer mailCheck;
	private String gender;
	private Integer birthYear;
	private String zipCode;
	private String address;
	private String detailAddress;
	private String extraAddress;
}
