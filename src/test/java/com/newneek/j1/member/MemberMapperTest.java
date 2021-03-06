package com.newneek.j1.member;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class MemberMapperTest {
	
	@Autowired
	private MemberMapper memberMapper;
	
	
	//@Test
	void getMemberLoginTest() throws Exception {
		MemberVO memberVO = new MemberVO();
		memberVO.setEmail("aa@naver.com");
		memberVO.setPw("aa");
		
		memberVO = memberMapper.getMemberLogin(memberVO);
		assertNotNull(memberVO);
	}

	//@Test
	void setMemberJoinTest() throws Exception{
		MemberVO memberVO = new MemberVO();
		
		for(int i=1;i<20;i++) {
			memberVO.setEmail("test"+(i+1)+"@test.com");
			memberVO.setPw("test"+(i+1));
			memberVO.setName("test"+(i+1));
			memberVO.setMailCheck(0);
		
		int result = memberMapper.setMemberJoin(memberVO);
		
		assertEquals(1, result);
		
		}
		
	}
	
	
	//@Test
	void setMemberSub() throws Exception{
		MemberVO memberVO = new MemberVO();
		
		memberVO.setEmail("Sub@test.com");
		memberVO.setName("SubTest");
		memberVO.setMailCheck(1);
		
		int result = memberMapper.setMemberSub(memberVO);
		
		assertEquals(1, result);
		
	}

}
