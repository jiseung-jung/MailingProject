package com.newneek.j1.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.newneek.j1.util.MailHandler;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MailService {

	@Autowired
	private JavaMailSender mailSender;
	private static final String FROM_ADDRESS = "mpj9516@gmail.com";

    public void mailSend(MailVO mailVO) {
        try {
            MailHandler mailHandler = new MailHandler(mailSender);
            // 받는 사람
           mailHandler.setTo(mailVO.getAddress());
            // 보내는 사람
           mailHandler.setFrom(MailService.FROM_ADDRESS);
            // 제목
           mailHandler.setSubject(mailVO.getTitle());
            // HTML Layout
            String htmlContent = "<div style='width:100%;background-color:#ebebeb;text-align: center;'><img src='cid:sample-img' width='590px'></div> <p>" + mailVO.getContents() +"</p>";
            mailHandler.setText(htmlContent, true);
            // 첨부 파일
           //mailHandler.setAttach("newTest.txt", "static/originTest.txt");
            // 이미지 삽입
           mailHandler.setInline("sample-img", "static/image/mail_logo.png");

            mailHandler.send();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
}
