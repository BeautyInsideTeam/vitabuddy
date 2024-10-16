package com.example.vitabuddy.service;

<<<<<<< HEAD
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.vitabuddy.dao.MemberDAO;
import com.example.vitabuddy.dto.MemberDTO;

@Service
public class MemberService {

    @Autowired
    private MemberDAO memberDAO;

    @Transactional  // 트랜잭션 어노테이션 추가
    public boolean registerMember(MemberDTO member) {
        // 데이터베이스에 회원 등록
        memberDAO.insertMember(member);
        return true;  // 회원가입 성공
    }
    
    public boolean isUserIdAvailable(String userId) {
        return memberDAO.getUserById(userId) == null; // 아이디가 존재하지 않으면 true 반환
    }
    
    public boolean isUserEmailAvailable(String userEmail) {
        return memberDAO.getUserByEmail(userEmail) == null;
    }

=======
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.vitabuddy.dao.IMemberDAO;

@Service
public class MemberService implements IMemberService {

	@Autowired
	@Qualifier("IMemberDAO")
	IMemberDAO dao;
	
	@Autowired
	PasswordEncoder pwdEncoder;
	
	// 1. 암호화 비밀번호 & 사용자 비밀번호 확인후 로그인 실행
	@Override
	public String login(HashMap<String, Object> map) {
		
		String secPwd = dao.login((String) map.get("id"));
		String result = "fail";
		if(secPwd != null && pwdEncoder.matches((String) map.get("pwd"), secPwd)) {
			result = "success";
		}
		return result;
	}
	
	
>>>>>>> merge_features/Login
}
