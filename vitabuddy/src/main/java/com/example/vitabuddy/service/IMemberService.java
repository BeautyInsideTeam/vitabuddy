package com.example.vitabuddy.service;

import com.example.vitabuddy.model.MemberVO;

public interface IMemberService {
    MemberVO findByUserId(String userId); // 메서드 이름 수정: 대문자 U로 변경

    boolean existsByUserId(String userId); // 메서드 이름 수정: 대문자 U로 변경

    boolean verifyLogin(String userId, String rawPassword); // 비밀번호 검증
}
