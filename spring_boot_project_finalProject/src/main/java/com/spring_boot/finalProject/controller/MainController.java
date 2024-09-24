package com.spring_boot.finalProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	@RequestMapping("/")
	public String intro() {
		return "intro";
	}
	
	@RequestMapping("/home")
	public String main() {
		return "home";
	}
}


