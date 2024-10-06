package com.example.vitabuddy.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AdminController {
	@GetMapping("/user")
	public String user() {
		return"user Controller";
	}
}
