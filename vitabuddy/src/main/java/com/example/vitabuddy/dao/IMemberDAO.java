package com.example.vitabuddy.dao;

import com.example.vitabuddy.model.MemberVO;

public interface IMemberDAO {
    MemberVO findByUsername(String userId);
}

