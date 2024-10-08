package com.example.vitabuddy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/")
	public String intro() {
		return "intro";
	}
	
	@RequestMapping("/home")
	public String home() {
		return "home";
	}
	
	
}
