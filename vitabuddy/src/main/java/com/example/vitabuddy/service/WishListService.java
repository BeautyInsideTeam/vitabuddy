package com.example.vitabuddy.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.example.vitabuddy.dao.IWishListDAO;
import com.example.vitabuddy.model.WishListVO;

public class WishListService implements IWishListService {

	@Autowired
	IWishListDAO dao;

	@Override
	public ArrayList<WishListVO> getWishList(String userId) {

		return dao.getWishList(userId);
	}

	@Override
	public void insertWishList(WishListVO wishListVO) {
		ArrayList<WishListVO> wishList = dao.getWishList(wishListVO.getUserId());
		boolean isDuplicate = wishList.stream().anyMatch(wish -> wish.getSupId().equals(wishListVO.getSupId()));

		if (!isDuplicate) {
			dao.insertWishList(wishListVO);
		}
	}

	@Override
	public void deleteWishList(WishListVO wishListVO) {

		dao.deleteWishList(wishListVO);

	}

}
