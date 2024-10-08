package com.example.vitabuddy.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.vitabuddy.dao.IMemberDAO;

@Service
public class MemberService implements IMemberService {

	@Autowired
	@Qualifier("IMemberDAO")
	IMemberDAO dao;
	
	@Autowired
	PasswordEncoder pwdEncoder;
	
	// 1. 암호화 비밀번호 & 사용자 비밀번호 확인후 로그인 실행
	@Override
	public String login(HashMap<String, Object> map) {
		
		String secPwd = dao.login((String) map.get("id"));
		String result = "fail";
		if(secPwd != null && pwdEncoder.matches((String) map.get("pwd"), secPwd)) {
			result = "success";
		}
		return result;
	}
	
	
}
