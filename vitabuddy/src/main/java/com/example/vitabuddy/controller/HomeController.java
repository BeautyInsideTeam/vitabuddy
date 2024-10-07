package com.example.vitabuddy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class HomeController {

    @GetMapping("/")
    public String intro() {
        return "intro";  
    }
    
    @GetMapping("/home")
    public String home() {
  
        return "home";
    }
    
    @GetMapping("/info")
    public String info() {
  
        return "infoChange";
    }
    
}
