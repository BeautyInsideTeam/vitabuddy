package com.example.vitabuddy.jwt;

import java.nio.charset.StandardCharsets;
import java.util.Date;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import io.jsonwebtoken.Jwts;

@Component
public class JWTUtil {
	
    private SecretKey secretKey;

    // 비밀키를 생성할 때 HMAC 알고리즘을 사용하도록 설정
    public JWTUtil(@Value("${spring.jwt.secret}") String secret) {
    	secretKey = new SecretKeySpec(secret.getBytes(StandardCharsets.UTF_8), Jwts.SIG.HS256.key().build().getAlgorithm());
    }

    // JWT에서 사용자 이름 추출
    public String getUsername(String token) {
    	return Jwts.parser().verifyWith(secretKey).build().parseSignedClaims(token).getPayload().get("username", String.class);
    }

    // JWT에서 역할(role) 추출
    public String getRole(String token) {
    	return Jwts.parser().verifyWith(secretKey).build().parseSignedClaims(token).getPayload().get("role", String.class);
    }
    
    // 
    public String getCategory(String token) {
    	return Jwts.parser().verifyWith(secretKey).build().parseSignedClaims(token).getPayload().get("category", String.class);
    }

    // JWT가 만료되었는지 확인
    public Boolean isExpired(String token) {
    	return Jwts.parser().verifyWith(secretKey).build().parseSignedClaims(token).getPayload().getExpiration().before(new Date());
    	
    }

    // JWT 생성 메서드
    public String createJwt(String category ,String username, String role, Long expiredMs) {
        return Jwts.builder()
        		.claim("category", category)
        		.claim("username", username)
                .claim("role", role)
                .issuedAt(new Date(System.currentTimeMillis()))
                .expiration(new Date(System.currentTimeMillis() + expiredMs))
                .signWith(secretKey)
                .compact();
        
        
    }
}
