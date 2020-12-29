package com.newneek.j1.news;

import java.sql.Date;

import javax.validation.constraints.NotEmpty;

import com.newneek.j1.category.CategoryVO;

import lombok.Data;

@Data
public class NewsVO {
	
	
	private long num;
	@NotEmpty
	private long newsId;
	@NotEmpty
	private String title;
	private String writer;
	@NotEmpty
	private String contents;
	private Date regDate;
	private long hit;
	
	private CategoryVO cVO;
	

}
