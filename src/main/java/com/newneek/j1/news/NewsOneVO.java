package com.newneek.j1.news;

import java.sql.Date;
import java.util.List;

import com.newneek.j1.news.file.NewsFilesVO;

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
	
	private String category_name;
	
	private List<NewsFilesVO> newsFilesVO;


}
