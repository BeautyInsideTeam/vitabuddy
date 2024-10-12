package com.example.vitabuddy.controller;


import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.example.vitabuddy.model.MemberVO;
import com.example.vitabuddy.service.MemberService;

import org.springframework.ui.Model;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memService;
	
	
	
	//마이페이지 > 회원정보 수정폼으로: 기존에 입력했던 회원 데이터가 폼에 출력된다 
	@RequestMapping("/member/myInfoChangeForm")
	public String myInfoChangeForm(Model model) {
		
		//String userId = (String)session.getAttribute("sid");  //sessionId
		String userId = "user01";  //임시 세팅값
		
		MemberVO myInfo = memService.myInfoUpdateForm(userId);
		model.addAttribute("myInfo", myInfo);  //이걸 추가해야, jsp 페이지에서 {myInfo.memId}했을 때 볼 수 있음
		System.out.println(myInfo);
		return "member/infoChange";
	}
	
	@RequestMapping("/member/myInfoUpdate")
	public String myInfoUpdate(MemberVO vo, @RequestParam("userPh1") String userPh1,
											@RequestParam("userPh2") String userPh2,
											@RequestParam("userPh3") String userPh3,
											HttpSession session, Model model) {
		//String userId = (String)session.getAttribute("sid"); //session 값
		String userId = "user01";  //임시 세팅값
		vo.setUserId(userId);  //임시 세팅값
		
		String userPh = userPh1 + "-" + userPh2 + "-" + userPh3;
		vo.setUserPh(userPh); 
		memService.myInfoUpdate(vo);
		return "member/myPage"; 

		}


	
	
	
	

	

}
