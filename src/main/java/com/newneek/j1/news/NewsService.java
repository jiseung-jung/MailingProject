package com.newneek.j1.news;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NewsService {
	
	@Autowired
	NewsMapper newsMapper;
	
	
	
	public long newsCount(NewsVO newsVO) throws Exception{
		return newsMapper.newsCount(newsVO);
	}

}
