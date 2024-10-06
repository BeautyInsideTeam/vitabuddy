package com.example.vitabuddy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.vitabuddy.dao.IRefreshDAO;
import com.example.vitabuddy.model.RefreshVO;

@Service
public class RefreshService implements IRefreshService {

	@Autowired
	private IRefreshDAO dao;

	@Override
	public Boolean existsByRefresh(String refreshToken) {
		return dao.existsByRefresh(refreshToken);
	}

	@Override
	public void deleteByRefresh(String refreshToken) {
		dao.deleteByRefresh(refreshToken);
	}

	// 여기에서 DAO를 통해 refreshToken을 저장하는 로직을 구현
	@Override
	public void saveRefreshToken(RefreshVO refreshVO) {
		dao.saveRefreshToken(refreshVO);
	}

}
