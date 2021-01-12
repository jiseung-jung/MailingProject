package com.newneek.j1.like;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LikeMapper {
	
	public int setInsert(LikeVO likeVO) throws Exception;
	
	public int getCount(LikeVO likeVO) throws Exception;

	public LikeVO getOne(LikeVO likeVO) throws Exception;
	
	public int setDelete(LikeVO likeVO) throws Exception;
}
