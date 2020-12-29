package com.newneek.j1.help;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class HelpService {

	@Autowired
	private HelpMapper helpMapper;
	
	public List<HelpVO> getList() throws Exception{
		return helpMapper.getList();
	}
	
	public int setInsert(HelpVO helpVO) throws Exception{
		return helpMapper.setInsert(helpVO);
	}
	
	public int setUpdate(HelpVO helpVO) throws Exception{
		return helpMapper.setUpdate(helpVO);
	}
	
	public int setDelete(HelpVO helpVO) throws Exception{
		return helpMapper.setDelete(helpVO);
	}
	

	
	
}
