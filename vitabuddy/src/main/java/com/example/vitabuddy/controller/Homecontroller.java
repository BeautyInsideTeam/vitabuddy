package com.example.vitabuddy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.vitabuddy.model.MemberVO;

import ch.qos.logback.core.model.Model;

@Controller
public class Homecontroller {
	

	/*@RequestMapping("/")
	public String intro() {
		return "intro";
	}
	
	// 2. 메인홈페이지.
	@RequestMapping("/home")
	public String home() {
		return "home";
	}*/

	//회원가입 수정기능구현을 위해 디폴트 페이지를 myPage로 설정 - merge이후 수정
	/*@RequestMapping("/")
	public String home() {
		return "member/myPage";
	}*/
	
	@RequestMapping("/")
	public String home() {
		return "member/myPage";
	}

	
	
	
}