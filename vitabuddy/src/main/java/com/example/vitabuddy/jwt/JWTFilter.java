package com.example.vitabuddy.jwt;

import java.io.IOException;
import java.io.PrintWriter;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.filter.OncePerRequestFilter;

import com.example.vitabuddy.service.MemberService;

import io.jsonwebtoken.ExpiredJwtException;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class JWTFilter extends OncePerRequestFilter {

    private final JWTUtil jwtUtil;
    private final MemberService memberService;  // MemberService 추가

    public JWTFilter(JWTUtil jwtUtil, MemberService memberService) {
        this.jwtUtil = jwtUtil;
        this.memberService = memberService;  // MemberService 주입
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
      // Header에서 access키에 담긴 토큰을 꺼낸다.  
        String accessToken = request.getHeader("access");
      // 토큰이 없으면 다음 필터로 넘긴다.
        if (accessToken == null) {
           
        	filterChain.doFilter(request, response);
        	
        	return;
        }
      
        try {
			jwtUtil.isExpired(accessToken);
		} catch (ExpiredJwtException e) {
			
			//response body
			PrintWriter writer = response.getWriter();
			writer.print("access token expired");
			
			//response status code
			response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			return;
		}
       
        // 토큰이 access인지 확인 ( 발급시 payload에 명시)
        String category = jwtUtil.getCategory(accessToken);
        if(!category.equals("access")) {
        	
        	//response body
        	PrintWriter writer = response.getWriter();
        	writer.print("invalid access token");
        	
        	//response status code
        	response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        	return;
        	
        }
       

        String username = jwtUtil.getUsername(accessToken);  // userId 대신 username 사용
        
        
        // 사용자 정보 로드
        UserDetails userDetails = memberService.loadUserByUsername(username);

        if (userDetails == null) {
            System.out.println("user not found");
            filterChain.doFilter(request, response);
            return;
        }

        // 스프링 시큐리티 인증 토큰 생성
        Authentication authToken = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());

        // 세션에 사용자 등록
        SecurityContextHolder.getContext().setAuthentication(authToken);

        filterChain.doFilter(request, response);
    }


}
