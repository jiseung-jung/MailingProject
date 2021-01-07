package com.newneek.j1.news;

import java.sql.Date;
import java.util.List;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;

import com.newneek.j1.category.CategoryVO;
import com.newneek.j1.news.file.NewsFilesVO;

import lombok.Data;

@Data
public class NewsVO {
	
	
	private long num;
	private long newsId;
	@NotEmpty
	private String title;
	private String writer;
	@NotEmpty
	private String contents;
	private Date regDate;
	private long hit;
	
	private CategoryVO cVO;
	private List<NewsFilesVO> files;

}
