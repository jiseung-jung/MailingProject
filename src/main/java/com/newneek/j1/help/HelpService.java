package com.newneek.j1.help;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.newneek.j1.mail.MailService;
import com.newneek.j1.mail.MailVO;
import com.newneek.j1.util.MailHandler;

@Service
public class HelpService {

	@Autowired
	private HelpMapper helpMapper;
	

	@Autowired
	private JavaMailSender mailSender;
	private static final String FROM_ADDRESS = "mpj9516@gmail.com";
	
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
	
	public HelpVO getOne(HelpVO helpVO) throws Exception{
		return helpMapper.getOne(helpVO);
	}
	
	 public void mailSend(MailVO mailVO) {
	        try {
	            MailHandler mailHandler = new MailHandler(mailSender);
	            
	            // 받는 사람
	           mailHandler.setTo(HelpService.FROM_ADDRESS);
	            // 보내는 사람
	           mailHandler.setFrom(mailVO.getAddress());
	            // 제목
	           mailHandler.setSubject(mailVO.getTitle());
	            // HTML Layout
	            String htmlContent = "<p> 요청 메일주소 : " + mailVO.getAddress() +"<br>" + mailVO.getContents()+ "</p>";
	            mailHandler.setText(htmlContent, true);

	            mailHandler.send();
	        }
	        catch(Exception e){
	            e.printStackTrace();
	        }
	    }
	
	
}
