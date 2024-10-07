package com.example.vitabuddy.service;

import org.springframework.stereotype.Service;
import com.example.vitabuddy.dao.IMemberDAO;
import com.example.vitabuddy.model.MemberVO;

@Service
public class MemberService {

    private final IMemberDAO memberDAO;

    public MemberService(IMemberDAO memberDAO) {
        this.memberDAO = memberDAO;
    }

    public boolean authenticate(String username, String password) {
        MemberVO member = memberDAO.findByUsername(username);
        if (member == null) {
            return false;
        }
        // 비밀번호 검증 로직 (예: 암호화된 비밀번호와 비교)
        return password.equals(member.getUserPwd()); // 단순 비교
    }

    // 사용자 정보를 로드하는 메서드 (JWTFilter에서 사용)
    public MemberVO loadUserByUsername(String username) {
        return memberDAO.findByUsername(username);
    }
}
