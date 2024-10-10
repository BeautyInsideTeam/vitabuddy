package com.example.vitabuddy.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.vitabuddy.dao.IMemberDAO;
import com.example.vitabuddy.dao.ISupplementDAO;
import com.example.vitabuddy.model.SupplementVO;

@Service
public class SupplementService implements ISupplementService {
	@Autowired
	@Qualifier("ISupplementDAO")
	ISupplementDAO dao;
	
	@Autowired
	PasswordEncoder pwdEncoder;
	
	//브랜드, 기능, 성분 해시태그

	@Override
	public ArrayList<SupplementVO> getAllBrands() {
		
		return dao.getAllBrands();
	}

	@Override
	public ArrayList<SupplementVO> getAllFunctions() {
		
		return dao.getAllFunctions();
	}

	@Override
	public ArrayList<SupplementVO> getAllIngredients() {
		// TODO Auto-generated method stub
		return dao.getAllIngredients();
	}
	
	
	//모든 영양제 출력 - 상점 페이지 최초 접속 시
	@Override
	public ArrayList<SupplementVO> getAllSupplements() {
		
		return dao.getAllSupplements();
	}
	
	
	

	
	
	

	

}
