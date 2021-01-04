package com.newneek.j1.mail;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MailService {

	private JavaMailSender mailSender;
	private static final String FROM_ADDRESS = "YOUR_EMAIL_ADDRESS";

    public void mailSend(MailVO mailVO) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(mailVO.getAddress());
        message.setFrom(MailService.FROM_ADDRESS);
        message.setSubject(mailVO.getTitle());
        message.setText(mailVO.getContents());

        mailSender.send(message);
    }
}
