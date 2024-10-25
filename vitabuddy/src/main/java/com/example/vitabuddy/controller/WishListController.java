package com.example.vitabuddy.controller;

import jakarta.servlet.http.HttpSession;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.vitabuddy.model.WishListVO;
import com.example.vitabuddy.service.WishListService;

@Controller
@RequestMapping("/supplement")
public class WishListController {

	@Autowired
	private WishListService wishService;

	// 1. 찜 목록 조회
	@GetMapping("/wishList")
	public String getWishList(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("sid"); 
		if (userId == null) {
			return "redirect:/intro";
		}

		model.addAttribute("wishList", wishService.getWishList(userId));

		return "supplement/wishList"; 
	}

	// 2. 찜 목록에 상품 추가
	@PostMapping("/wishList/insert")
	@ResponseBody
	public String insertWishList(@RequestBody WishListVO wishListVO, HttpSession session) {
		// 찜 목록에 중복 확인 및 추가
		wishService.insertWishList(wishListVO);

		return "찜 목록에 추가되었습니다."; 
	}

	// 3. 찜 목록에서 상품 삭제
	@PostMapping("/wishList/delete")
	@ResponseBody
	public int deleteWishList(@RequestBody HashMap<String, Object> requestBody) {
		int supId = (int) requestBody.get("supId");
		String userId = (String) requestBody.get("userId");

		int result = wishService.deleteWishList(supId, userId);

		if (result > 0)
			return 1; // 삭제 성공
		else
			return 0; // 삭제 실패
	}

}
