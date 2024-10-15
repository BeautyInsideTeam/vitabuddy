package com.example.vitabuddy.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.vitabuddy.dao.IMemberUpdateDAO;
import com.example.vitabuddy.model.MemberVO;

@Service
public class MemberUpdateService implements IMemberUpdateService {
	@Autowired
	@Qualifier("IMemberUpdateDAO")
	IMemberUpdateDAO dao;
	
	@Autowired
	PasswordEncoder pwdEncoder;

	@Override
	public MemberVO myInfoUpdateForm(String userId) {
		return dao.myInfoUpdateForm(userId);
	}

	@Override
	public void myInfoUpdate(MemberVO vo) {
		dao.myInfoUpdate(vo);
		
	}
	

	

}
