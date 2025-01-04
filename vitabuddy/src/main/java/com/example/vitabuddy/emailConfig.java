package com.example.vitabuddy;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import java.util.Properties;

@Configuration
public class emailConfig {

    //@Value ("${spring.mail.username}") private String username;
    //@Value ("${spring.mail.password}") private String password;


    @Bean
    public JavaMailSender javaNMailSender(){
        JavaMailSenderImpl javaNMailSender = new JavaMailSenderImpl();

        javaNMailSender.setHost("smtp.naver.com");
        javaNMailSender.setUsername("awsdevelopment@naver.com");
        javaNMailSender.setPassword("awsdevelop0318**");  //네이버는 2단계 인증 해제하고 할 것
        javaNMailSender.setPort(465);
        javaNMailSender.setJavaMailProperties(getNMailProperties());

        return javaNMailSender;
    }

    private Properties getNMailProperties(){
        Properties Nproperties = new Properties();
        Nproperties.setProperty("mail.transport.protocol", "smtp");
        Nproperties.setProperty("mail.smtp.auth", "true");
        Nproperties.setProperty("mail.smtp.starttls.enable", "true");
        Nproperties.setProperty("mail.debug", "true");
        Nproperties.setProperty("mail.smtp.ssl.trust","smtp.naver.com");
        Nproperties.setProperty("mail.smtp.ssl.enable","true");
        return Nproperties;  //메일 관련 설정 return
    }


}
