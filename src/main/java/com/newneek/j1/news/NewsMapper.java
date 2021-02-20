package com.newneek.j1.news;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.newneek.j1.news.file.NewsFilesVO;
import com.newneek.j1.util.C_Pager;
import com.newneek.j1.util.C_Pager2;
import com.newneek.j1.util.Pager;

@Mapper
public interface NewsMapper {
	
	public long getNewsCount(Pager pager) throws Exception;
	
	//-------------------------------------- Admin
	
	public List<NewsVO> admin_getNewsList(Pager pager) throws Exception;
	
	public int admin_setNewsInsert(NewsVO newsVO) throws Exception;
	
	public int admin_setNewsUpdate(NewsVO newsVO) throws Exception;
	
	public int admin_setNewsDelete(NewsVO newsVO) throws Exception;
	
	public NewsOneVO admin_getNewsOne(NewsOneVO newsOneVO) throws Exception;
	
	public List<NewsVO> getNewsEmailList() throws Exception;
	
	
	//-------------------------------------- index
	
	public List<NewsVO> main_getNewsList(NewsVO newsVO) throws Exception;
	
	public List<NewsVO> c_getNewsList(C_Pager2 c_Pager) throws Exception;
	
	public long c_getNewsCount(C_Pager2 c_Pager) throws Exception;
	
	
	//-------------------------------------- file
	
	public int setInsertFile(NewsFilesVO newsFilesVO) throws Exception;
	
	public List<NewsFilesVO> getFile(NewsVO newsVO) throws Exception;
	
	public int setDeleteFile(NewsFilesVO newsFilesVO) throws Exception;
	
	public NewsFilesVO getFileOne(NewsFilesVO newsFilesVO) throws Exception;


}
