package com.spring_boot.finalProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
	@RequestMapping("/product/prdList")
	public String prdList() {
		return "product/productList";
	}

}
