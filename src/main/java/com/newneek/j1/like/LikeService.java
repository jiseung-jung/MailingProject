package com.newneek.j1.like;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LikeService {

	@Autowired
	private LikeMapper likeMapper;
	
	
	public int setInsert(LikeVO likeVO) throws Exception{
		return likeMapper.setInsert(likeVO);
	}
	
	public int getCount(LikeVO likeVO) throws Exception{
		return likeMapper.getCount(likeVO);
	}
	
	public LikeVO getOne(LikeVO likeVO) throws Exception{
		return likeMapper.getOne(likeVO);
	}
	
	public int setDelete(LikeVO likeVO) throws Exception{
		return likeMapper.setDelete(likeVO);
	}
}
