package com.newneek.j1.member;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class MemberMapperTest {
	
	@Autowired
	private MemberMapper memberMapper;

	//@Test
	void setMemberJoinTest() throws Exception{
		MemberVO memberVO = new MemberVO();
		
		memberVO.setEmail("test2@test.com");
		memberVO.setPw("test2");
		memberVO.setName("test2");
		memberVO.setMailCheck(0);
		
		int result = memberMapper.setMemberJoin(memberVO);
		
		assertEquals(1, result);
	}
	
	
	@Test
	void setMemberSub() throws Exception{
		MemberVO memberVO = new MemberVO();
		
		memberVO.setEmail("Sub@test.com");
		memberVO.setName("SubTest");
		memberVO.setMailCheck(1);
		
		int result = memberMapper.setMemberSub(memberVO);
		
		assertEquals(1, result);
		
	}

}
