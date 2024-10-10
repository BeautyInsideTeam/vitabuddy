package com.example.vitabuddy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.vitabuddy.model.MemberVO;

import ch.qos.logback.core.model.Model;

@Controller
public class Homecontroller {
	
	@RequestMapping("/")
	public String mypage() {
		return "home";
	}

	
	/*@RequestMapping("/member/myInfoUpdateForm")
	public String myInfoUpdateForm() {
		return "member/infoChange";
	}*/
	
    /*@RequestMapping("/member/myInfoUpdate")
    public String myInfoUpdate(MemberVO vo, Model model) {
        // 여기서 MemberVO 객체를 통해 받은 데이터를 로그로 출력하거나
        System.out.println("이름: " + vo.getUserName());
        System.out.println("비밀번호: " + vo.getUserPwd());
        System.out.println("이메일: " + vo.getUserEmail());
        System.out.println("전화번호: " + vo.getUserPh());
        System.out.println("우편번호: " + vo.getUserZipcode());
        System.out.println("주소: " + vo.getUserAddress1());
        System.out.println("상세 주소: " + vo.getUserAddress2());

        // 데이터 확인을 위해 Model에 담아 JSP에서 출력
        //model.addAttribute("member", vo);

        // 데이터가 잘 넘어왔는지 확인하기 위해 마이페이지로 이동
        return "member/myPage";
    }*/

}