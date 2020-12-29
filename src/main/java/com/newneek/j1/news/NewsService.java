package com.newneek.j1.news;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newneek.j1.util.Pager;

@Service
public class NewsService {
	
	@Autowired
	NewsMapper newsMapper;
	
	
	
	public long getNewsCount(Pager pager) throws Exception{
		return newsMapper.getNewsCount(pager);
	}
	
	
	
	//-------------------------------------- Admin
	
	public List<NewsVO> admin_getNewsList(Pager pager) throws Exception{
		pager.makeRow();
		long totalCount = newsMapper.getNewsCount(pager);
		pager.makePage(totalCount);
		return newsMapper.admin_getNewsList(pager);
	}
	
	public int admin_setNewsInsert(NewsVO newsVO) throws Exception{
		return newsMapper.admin_setNewsInsert(newsVO);
	}
	
	public int admin_setNewsUpdate(NewsVO newsVO) throws Exception{
		return newsMapper.admin_setNewsUpdate(newsVO);
	}
	
	public int admin_setNewsDelete(NewsVO newsVO) throws Exception{
		return newsMapper.admin_setNewsDelete(newsVO);
	}

}
