package com.newneek.j1.news;

import java.sql.Date;

import lombok.Data;

@Data
public class NewsVO {
	
	private long num;
	private long newsId;
	private String title;
	private String writer;
	private String contents;
	private Date regDate;
	private long hit;
	

}
