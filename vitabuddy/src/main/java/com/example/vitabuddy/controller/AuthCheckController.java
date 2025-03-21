package com.example.vitabuddy.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class AuthCheckController {

    @GetMapping("/checkAuth")
    public ResponseEntity<Void> checkAuth(HttpSession session) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        // Spring Security 인증 체크
        if (auth != null && auth.isAuthenticated() && !(auth instanceof AnonymousAuthenticationToken)) {
            return ResponseEntity.ok().build();
        }

        // Session 기반 체크 (소셜 로그인용)
        Object user = session.getAttribute("sid"); // 예: 세션에 저장한 사용자 객체 이름
        if (user != null) {
            return ResponseEntity.ok().build();
        }

        // 둘 다 실패 시
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
    }

}
