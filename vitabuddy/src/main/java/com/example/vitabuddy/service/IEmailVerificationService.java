package com.example.vitabuddy.service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

public interface IEmailVerificationService {

    //메일에 해당하는 내용을 작성하는 코드
    MimeMessage createMessage(String to, String verificationCode) throws MessagingException, IOException;

    //메일을 보내기 위한 메서드
    String sendSimpleMessage(String to) throws MessagingException, IOException;

    //랜덤 인증번호 생성
    public String createCode();  //랜덤 인증코드
}
