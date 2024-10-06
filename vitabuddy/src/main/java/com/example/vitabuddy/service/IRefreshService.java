package com.example.vitabuddy.service;

import com.example.vitabuddy.model.RefreshVO;

public interface IRefreshService {
	Boolean existsByRefresh(String refreshToken);

	void deleteByRefresh(String refreshToken);

	void saveRefreshToken(RefreshVO refreshVO);
}
