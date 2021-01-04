package com.newneek.j1.news;

import java.sql.Date;

import lombok.Data;

@Data
public class NewsOneVO {
	
	private long num;
	private long newsId;
	private String title;
	private String writer;
	private String contents;
	private Date regDate;
	private long hit;
	
	private long fnum;
	private long num_1;
	private String fileName;
	private String oriName;
	
	private String category_name;


}
