package com.example.vitabuddy.jwt;

import jakarta.servlet.FilterChain;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.sql.Timestamp;
import java.util.Collection;
import java.util.Iterator;

import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.example.vitabuddy.service.RefreshService;
import com.example.vitabuddy.model.RefreshVO;

public class loginFilter extends UsernamePasswordAuthenticationFilter {

    private final AuthenticationManager authenticationManager;
    private final JWTUtil jwtUtil;
    private final RefreshService refreshService;  // MyBatis 기반 서비스 구현체

    public loginFilter(AuthenticationManager authenticationManager, JWTUtil jwtUtil, RefreshService refreshService) {
        this.authenticationManager = authenticationManager;
        this.jwtUtil = jwtUtil;
        this.refreshService = refreshService;
        this.setUsernameParameter("userId");
        this.setPasswordParameter("userPwd");
    }

    private Cookie createCookie(String key, String value) {
        Cookie cookie = new Cookie(key, value);
        cookie.setMaxAge(24 * 60 * 60);
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
        refreshService.saveRefreshToken(refreshVO);  // Service를 통해 DAO로 저장
    }

    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException {
        String userId = obtainUsername(request);
        String userPwd = obtainPassword(request);

        UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(userId, userPwd, null);
        return authenticationManager.authenticate(authToken);
    }

    @Override
    protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain, Authentication authentication) {
        // 유저 정보
        String username = authentication.getName();
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        Iterator<? extends GrantedAuthority> iterator = authorities.iterator();
        GrantedAuthority auth = iterator.next();
        String role = auth.getAuthority();

        // JWT 토큰 생성
        String access = jwtUtil.createJwt("access", username, role, 600000L);  // 10분 만료
        String refresh = jwtUtil.createJwt("refresh", username, role, 86400000L);  // 1일 만료

        // Refresh 토큰 저장 (MyBatis DAO 사용)
        addRefreshEntity(username, refresh, 86400000L);

        // 응답 설정
        response.setHeader("access", access);
        response.addCookie(createCookie("refresh", refresh));
        response.setStatus(HttpStatus.OK.value());
    }

    @Override
    protected void unsuccessfulAuthentication(HttpServletRequest request, HttpServletResponse response, AuthenticationException failed) {
        response.setStatus(HttpStatus.UNAUTHORIZED.value());
    }
}
