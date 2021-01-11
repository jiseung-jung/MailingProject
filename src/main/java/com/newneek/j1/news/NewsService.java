package com.newneek.j1.news;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;

import com.newneek.j1.news.file.NewsFilesVO;
import com.newneek.j1.util.FileManager;
import com.newneek.j1.util.FilePathGenerator;
import com.newneek.j1.util.Pager;

@Service
public class NewsService {
	
	@Autowired
	private NewsMapper newsMapper;
	@Autowired
	private FilePathGenerator filePathGenerator;
	@Autowired
	private FileManager fileManager;
	@Value("${news.filePath}")
	private String filePath;
	
	
	
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
	
	public int admin_setNewsInsert(NewsVO newsVO, MultipartFile [] files) throws Exception{
		
		int result = newsMapper.admin_setNewsInsert(newsVO);
		
		File file = filePathGenerator.getUseResourceLoader(this.filePath);
		
		for(MultipartFile multipartFile : files) {
			if(multipartFile.getSize()==0) {
				continue;
			}
			
			String fileName = fileManager.saveFileCopy(multipartFile, file);
			System.out.println(fileName);
			
			NewsFilesVO newsFilesVO = new NewsFilesVO();
			newsFilesVO.setFileName(fileName);
			newsFilesVO.setOriName(multipartFile.getOriginalFilename());
			newsFilesVO.setNum(newsVO.getNum());
			
			result = newsMapper.setInsertFile(newsFilesVO);
			
		}
		
		return result;
	}
	
	
	public NewsOneVO admin_getNewsOne(NewsOneVO newsOneVO) throws Exception{
		return newsMapper.admin_getNewsOne(newsOneVO);
	}
	
	public boolean getNewsError(NewsVO newsVO, BindingResult bindingResult) throws Exception{
		//result : true -> 검증 위반(실패)
		//result : false -> 검증 성공
		boolean result = false;
		
		//기본 Annotation 검증 결과
		if(bindingResult.hasErrors()) {
			
			System.out.println(newsVO.getNewsId());
			result = true;
		}
		return result;
	}
	
	public int admin_setNewsUpdate(NewsVO newsVO, MultipartFile [] files) throws Exception{
		
		int result = newsMapper.admin_setNewsUpdate(newsVO);
		
		File file = filePathGenerator.getUseResourceLoader(this.filePath);
		
		for(MultipartFile multipartFile : files) {
			if(multipartFile.getSize()==0) {
				continue;
			}
			
			String fileName = fileManager.saveFileCopy(multipartFile, file);
			System.out.println(fileName);
			
			NewsFilesVO newsFilesVO = new NewsFilesVO();
			newsFilesVO.setFileName(fileName);
			newsFilesVO.setOriName(multipartFile.getOriginalFilename());
			newsFilesVO.setNum(newsVO.getNum());
			
			result = newsMapper.setInsertFile(newsFilesVO);
			
		}
		
		return result;
	}
	
	public int admin_setNewsDelete(NewsVO newsVO) throws Exception{
		return newsMapper.admin_setNewsDelete(newsVO);
	}
	
	public List<NewsFilesVO> getFile(NewsVO newsVO) throws Exception{
		return newsMapper.getFile(newsVO);
	}
	
	public NewsFilesVO getFileOne(NewsFilesVO newsFilesVO) throws Exception{
		return newsMapper.getFileOne(newsFilesVO);
	}
	
	public int setDeleteFile(NewsFilesVO newsFilesVO) throws Exception{
		
		String fileName = newsFilesVO.getFileName();
		
		File file = filePathGenerator.getUseResourceLoader(this.filePath+fileName);
		
		if(file.exists() == true){
			System.out.println(file);
			file.delete();
		}
		
		return newsMapper.setDeleteFile(newsFilesVO);
	}

	public List<NewsVO> getEmailList() throws Exception{
		return newsMapper.getNewsEmailList();
	}
}
