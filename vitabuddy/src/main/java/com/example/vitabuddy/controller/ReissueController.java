package com.example.vitabuddy.controller;

import java.sql.Timestamp;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.vitabuddy.jwt.JWTUtil;
import com.example.vitabuddy.model.RefreshVO;
import com.example.vitabuddy.service.RefreshService;

import io.jsonwebtoken.ExpiredJwtException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
@ResponseBody
public class ReissueController {

    JWTUtil jwtUtil;
    RefreshService refservice;
    
    private Cookie createCookie(String key, String value) {

        Cookie cookie = new Cookie(key, value);
        cookie.setMaxAge(24*60*60);
        //cookie.setSecure(true);
        //cookie.setPath("/");
        cookie.setHttpOnly(true);

        return cookie;
    }
    
    private void addRefreshEntity(String username, String refresh, Long expiredMs) {
        // 만료 시간을 계산하여 Timestamp로 설정
        Timestamp expiration = new Timestamp(System.currentTimeMillis() + expiredMs);

        // VO 객체에 값을 세팅
        RefreshVO refreshVO = new RefreshVO();
        refreshVO.setUserId(username);
        refreshVO.setRefreshToken(refresh);
        refreshVO.setExpiration(expiration);

        // MyBatis를 통해 데이터베이스에 저장
        refservice.saveRefreshToken(refreshVO);  
    }
    

    public ReissueController(JWTUtil jwtUtil, RefreshService refservice) {

        this.jwtUtil = jwtUtil;
        this.refservice = refservice;
    }

    @PostMapping("/reissue")
    public ResponseEntity<?> reissue(HttpServletRequest request, HttpServletResponse response) {

        //get refresh token
        String refresh = null;
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {

            if (cookie.getName().equals("refresh")) {

                refresh = cookie.getValue();
            }
        }

        if (refresh == null) {

            //response status code
            return new ResponseEntity<>("refresh token null", HttpStatus.BAD_REQUEST);
        }

        //expired check
        try {
            jwtUtil.isExpired(refresh);
        } catch (ExpiredJwtException e) {

            //response status code
            return new ResponseEntity<>("refresh token expired", HttpStatus.BAD_REQUEST);
        }

        // 토큰이 refresh인지 확인 (발급시 페이로드에 명시)
        String category = jwtUtil.getCategory(refresh);

        if (!category.equals("refresh")) {

            //response status code
            return new ResponseEntity<>("invalid refresh token", HttpStatus.BAD_REQUEST);
        }
        
        Boolean isExist = refservice.existsByRefresh(refresh);
        if(!isExist) {
        	
        	//response body
        	return new ResponseEntity<>("invalid refresh token", HttpStatus.BAD_REQUEST);
        }
        

        String username = jwtUtil.getUsername(refresh);
        String role = jwtUtil.getRole(refresh);

        //make new JWT
        String newAccess = jwtUtil.createJwt("access", username, role, 600000L);
        String newRefresh = jwtUtil.createJwt("refresh", username, role, 86400000L);

        //Refresh 토큰 저장 DB에 기존의 Refresh 토큰 삭제 후 새 Refresh 토큰을 저장.
        refservice.deleteByRefresh(refresh);
        addRefreshEntity(username, newRefresh, 86400000L);
        
        
        
        //response
        response.setHeader("access", newAccess);
        response.addCookie(createCookie("refresh", newRefresh));
        
        return new ResponseEntity<>(HttpStatus.OK);
    }
}

