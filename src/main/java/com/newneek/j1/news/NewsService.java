package com.newneek.j1.news;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.newneek.j1.member.MemberVO;
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
	
	public boolean getNewsError(NewsVO newsVO, BindingResult bindingResult) throws Exception{
		//result : true -> 검증 위반(실패)
		//result : false -> 검증 성공
		boolean result = false;
		
		//기본 Annotation 검증 결과
		if(bindingResult.hasErrors()) {
			result = true;
		}
		
		return result;
	}
	
	public int admin_setNewsUpdate(NewsVO newsVO) throws Exception{
		return newsMapper.admin_setNewsUpdate(newsVO);
	}
	
	public int admin_setNewsDelete(NewsVO newsVO) throws Exception{
		return newsMapper.admin_setNewsDelete(newsVO);
	}

}
