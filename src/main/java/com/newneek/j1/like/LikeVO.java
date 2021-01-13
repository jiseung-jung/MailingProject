package com.newneek.j1.like;

import com.newneek.j1.news.NewsVO;

import lombok.Data;

@Data
public class LikeVO {

	private long num;
	private String email;
	private long newsNum;
	
	private NewsVO newsVO;
}
