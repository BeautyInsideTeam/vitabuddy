package com.example.vitabuddy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WishListController {
	
	// 찜 목록.
	@RequestMapping("/supplement/wishList")
	public String wish() {
		return "supplement/wishList";
	}

}
