package com.example.vitabuddy.service;

import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Random;

@Service
@RequiredArgsConstructor   //
public class EmailVerificationService implements IEmailVerificationService {

    private final JavaMailSender javaNMailSender;
    private String code;


    @Override
    public MimeMessage createMessage(String to, String verificationCode) throws MessagingException, IOException {

        MimeMessage nmessage = javaNMailSender.createMimeMessage();

        nmessage.addRecipients(Message.RecipientType.TO, to);  //to : 보내는 대상
        nmessage.setSubject("회원가입 인증번호입니다");  //이메일 제목

        //template.html 파일을 활용하여 본문 설정하기
        ClassPathResource resource = new ClassPathResource("templates/emailVerificationContent.html");  //html파일 경로
        String content = new String(Files.readAllBytes(resource.getFile().toPath()), StandardCharsets.UTF_8);

        //인증코드 replace
        String finalContent = content.replace("{{code}}", verificationCode);

        //본문 설정
        nmessage.setText(finalContent, "utf-8", "html");  //이메일 본문에 해당한다.
        nmessage.setFrom(new InternetAddress("awsdevelopment@naver.com", "vitabuddy"));  //발신자 정보 설정

        return nmessage;
    }


    @Override
    public String sendSimpleMessage(String to) throws MessagingException, IOException {

        code = createCode();
        MimeMessage message = createMessage(to, code);

        try{
            javaNMailSender.send(message);
        } catch (MailException e) {
            System.err.println("SMTP 인증 실패: " + e.getMessage());
            throw new IllegalStateException("이메일 전송 실패: " + e.getMessage(), e);
        }



        return code;
    }



    //인증코드 생성
    @Override
    public String createCode() {

        StringBuffer key = new StringBuffer();
        Random rnd = new Random();

        for (int i = 0; i < 8; i++) { // 인증코드 8자리
            int index = rnd.nextInt(3); // 0~2 까지 랜덤, rnd 값에 따라서 아래 switch 문이 실행됨

            switch (index) {
                case 0:
                    key.append((char) ((int) (rnd.nextInt(26)) + 97));
                    // a~z (ex. 1+97=98 => (char)98 = 'b')
                    break;
                case 1:
                    key.append((char) ((int) (rnd.nextInt(26)) + 65));
                    // A~Z
                    break;
                case 2:
                    key.append((rnd.nextInt(10)));
                    // 0~9
                    break;
            }
        }

        return key.toString();  //인증 코드 생성 - String

    }

}
