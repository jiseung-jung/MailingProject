package com.newneek.j1.news;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NewsMapper {
	
	public long newsCount(NewsVO newsVO) throws Exception;

}
