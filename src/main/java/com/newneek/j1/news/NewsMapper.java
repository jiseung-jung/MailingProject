package com.newneek.j1.news;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.newneek.j1.util.Pager;

@Mapper
public interface NewsMapper {
	
	public long getNewsCount(Pager pager) throws Exception;
	
	//-------------------------------------- Admin
	
	public List<NewsVO> admin_getNewsList(Pager pager) throws Exception;
	
	public int admin_setNewsInsert(NewsVO newsVO) throws Exception;
	
	public int admin_setNewsUpdate(NewsVO newsVO) throws Exception;
	
	public int admin_setNewsDelete(NewsVO newsVO) throws Exception;

}
