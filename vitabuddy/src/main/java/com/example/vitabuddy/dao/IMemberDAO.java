package com.example.vitabuddy.dao;

import com.example.vitabuddy.model.MemberVO;

public interface IMemberDAO {
	
	
	//회원정보 수정 폼
	public MemberVO myInfoUpdateForm(String userId);
	
	//회원정보 수정
	public void myInfoUpdate(MemberVO vo);
	
	
	
	
	

}
