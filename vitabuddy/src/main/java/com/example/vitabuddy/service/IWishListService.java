package com.example.vitabuddy.service;

import java.util.ArrayList;

import com.example.vitabuddy.model.WishListVO;

public interface IWishListService {
	// 1.찜 목록 조회
	ArrayList<WishListVO> getWishList(String userId);

	// 2.찜 목록 추가
	void insertWishList(WishListVO wishListVO);

	// 3.찜 목록 삭제
	void deleteWishList(WishListVO wishListVO);
}
