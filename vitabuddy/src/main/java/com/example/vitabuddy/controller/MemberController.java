package com.example.vitabuddy.controller;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.vitabuddy.model.MemberVO;
import com.example.vitabuddy.service.MemberService;

import org.springframework.ui.Model;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memService;
	
	//마이페이지 > 회원정보 수정폼으로: 기존에 입력했던 회원 데이터가 폼에 출력된다 
	@RequestMapping("/member/myInfoUpdateForm")
	public String myInfoUpdateForm(Model model) {
		String userId = "user01"; 
		MemberVO myInfo = memService.myInfoUpdateForm(userId);
		//attribute에서 에러나는 이슈 : Model import 과정에서 잘못된 클래스를 import 했기 때문
		model.addAttribute("myInfo", myInfo);  //이걸 추가해야, jsp 페이지에서 {myInfo.memId}했을 때 볼 수 있음
		
		return "member/infoChange";
	}
	
	@RequestMapping("/member/myInfoUpdate")
	public String myInfoUpdate(MemberVO vo, @RequestParam("userPh1") String userPh1,
											@RequestParam("userPh2") String userPh2,
											@RequestParam("userPh3") String userPh3,
											HttpSession session, Model model) {
		
		String userPh = userPh1 + "-" + userPh2 + "-" + userPh3;
		vo.setUserPh(userPh); 
		memService.myInfoUpdate(vo);
		//model.addAttribute("msg", 1);  //프론트단에서 처리
		return "myPage"; //다시 요청 (redirect 하지 않는 이유는 Model 객체를 view 페이지에 전달 해야 하기 때문) 

		}


	
	
	
	

	

}
