package com.newneek.j1.help;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface HelpMapper {

	public List<HelpVO> getList() throws Exception;
	
	public int setInsert(HelpVO helpVO) throws Exception; 
	
	public int setUpdate(HelpVO helpVO) throws Exception;
	
	public int setDelete(HelpVO helpVO) throws Exception;
}
