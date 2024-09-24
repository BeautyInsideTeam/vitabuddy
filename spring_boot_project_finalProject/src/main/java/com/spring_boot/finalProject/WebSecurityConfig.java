package com.spring_boot.finalProject;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig {
	@Bean
	public PasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
		//BCryptPasswordEncoder는 Bcrypt라는 해시 함수를 이용하여 패스워드를 토대로 암호화하는 구현체(객체)
	}
	
	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception{
		//스프링 자체가 제공하는 보안기능 중에 불필요한(기능 구현을 하지 않음) 보안 기능을 비활성화 시키는 코드
		//이 내용 추가하지 않으면 비밀번호 암호화 하도록 구성하면 스프링 시큐리티가 자동 동작하고 로그인 기능이 스프링 기본 로그인ㅇ로 동작하게 함
		//스프링 보안을 활용하면 로그인 기능은 포함되어 있고 기본 로그린이 됨-직접 개발한 로그인 사용하려면 비활성화 시켜야 함
		http
			.csrf(csrf->csrf.disable())
		.formLogin(formLogin->formLogin.disable())
		.headers(headerConfig->headerConfig.frameOptions(frameOptionsConfig->frameOptionsConfig.disable()));
		
		return http.build();
	}

}
