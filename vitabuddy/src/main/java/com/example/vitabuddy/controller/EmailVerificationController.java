package com.example.vitabuddy.controller;

import com.example.vitabuddy.service.EmailVerificationService;
import com.example.vitabuddy.service.MemberService;
import jakarta.mail.MessagingException;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLOutput;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class EmailVerificationController {

    //주입
    private final EmailVerificationService emailVerificationService;
    private final MemberService memberService;

    @ResponseBody
    @RequestMapping("/member/emailverify")
    public String emailVerification(@RequestParam("userEmail") String userEmail) throws MessagingException, IOException {
        //@RequestParam("userEmail") 여기서 userEmail 은 ajax 통신의 data 부분과 일치해야 한다.

        String code = emailVerificationService.sendSimpleMessage(userEmail);
        System.out.println("이메일 인증 코드 입니다" + code);
        return code;
    }

    //이메일 중복체크
    @ResponseBody
    @GetMapping("/member/checkEmail")
    public String emailCheckfromDB(@RequestParam("userEmail") String userEmail){

        boolean isuserEmailAvailable = memberService.isUserEmailAvailable(userEmail);  //true, false
        if(isuserEmailAvailable) {
            return "1";
        }
        return "0";

    }




}
