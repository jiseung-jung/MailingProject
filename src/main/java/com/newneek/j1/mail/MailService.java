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
            String htmlContent = "<div style='width:100%;background-color:#ebebeb;'><img src='cid:sample-img' width='590px' style='display: block;margin: 0 auto;'><p>" + mailVO.getContents() 
            +"</p><div><p style='font-size:12px;text-align:center;line-height:2;'>세상 돌아가는 소식, 알고는 싶지만 신문 볼 새 없이 바쁜 게 우리 탓은 아니잖아요!😂<br>월/수/금 아침마다 세상 돌아가는 소식을 메일로 받아보세요.📧</div></div>";
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
