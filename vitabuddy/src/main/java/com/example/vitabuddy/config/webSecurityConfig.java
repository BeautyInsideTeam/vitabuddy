package com.example.vitabuddy.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.authentication.logout.LogoutFilter;

import com.example.vitabuddy.jwt.JWTFilter;
import com.example.vitabuddy.jwt.JWTUtil;
import com.example.vitabuddy.jwt.loginFilter;
import com.example.vitabuddy.jwt.logoutFilter;
import com.example.vitabuddy.service.MemberService;
import com.example.vitabuddy.service.RefreshService;

@Configuration
@EnableWebSecurity
public class webSecurityConfig {

    private final AuthenticationConfiguration authenticationConfiguration;
    private final JWTUtil jwtUtil;
    private final MemberService memberService;
    private final RefreshService refreshService;

    public webSecurityConfig(AuthenticationConfiguration authenticationConfiguration, JWTUtil jwtUtil, MemberService memberService, RefreshService refreshService) {
        this.authenticationConfiguration = authenticationConfiguration;
        this.jwtUtil = jwtUtil;
        this.memberService = memberService;
        this.refreshService = refreshService;
    }

    @Bean
    public PasswordEncoder getPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration configuration) throws Exception {
        return configuration.getAuthenticationManager();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http.csrf(csrf -> csrf.disable())
            .formLogin(formLogin -> formLogin.disable())
            .headers(headerConfig -> headerConfig.frameOptions(frameOptionsConfig -> frameOptionsConfig.disable()))
            .httpBasic(basic -> basic.disable())
            .authorizeHttpRequests(auth -> auth
            .requestMatchers("/**").permitAll()   // 여기는 public 경로로 허용
            .requestMatchers("/user").hasRole("USER")
            .requestMatchers("/reissue").permitAll()
            .requestMatchers("/profile", "/order", "/cart").authenticated()
            .anyRequest().authenticated())                // 그 외 모든 요청은 인증 필요
            .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
            .addFilterBefore(new JWTFilter(jwtUtil, memberService), loginFilter.class)  // 필터 추가
        	.addFilterAt(new loginFilter(authenticationManager(authenticationConfiguration), jwtUtil, refreshService), UsernamePasswordAuthenticationFilter.class)
        	.addFilterBefore(new logoutFilter(jwtUtil, refreshService), LogoutFilter.class);
        return http.build();
    }
}
