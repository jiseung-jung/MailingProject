package com.newneek.j1.help;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class HelpMapperTest {

	@Autowired
	private HelpMapper helpMapper;
	
	//@Test
	void getList() throws Exception {
		List<HelpVO> ar = helpMapper.getList();
		assertNotEquals(0, ar.size());
	}
	
	@Test
	void setInsert() throws Exception {
		HelpVO helpVO = new HelpVO();
		helpVO.setTitle("test title");
		helpVO.setContents("test contents");
		helpVO.setWriter("test writer");
		
		int result= helpMapper.setInsert(helpVO);
		
		assertNotEquals(0, result);
	}

}
