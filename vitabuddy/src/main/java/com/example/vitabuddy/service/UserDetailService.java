package com.example.vitabuddy.service;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.vitabuddy.dao.IMemberDAO;
import com.example.vitabuddy.model.MemberVO;

@Service
public class UserDetailService implements UserDetailsService {

    private final IMemberDAO memberDAO;

    public UserDetailService(IMemberDAO memberDAO) {
        this.memberDAO = memberDAO;
    }

    @Override
    public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
        MemberVO member = memberDAO.findByUsername(userId);

        if (member == null) {
            throw new UsernameNotFoundException("User not found with username: " + userId);
        }

        // 권한 설정 (ROLE_USER만 설정)
        Collection<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority("ROLE_USER"));

        return new User(member.getUserId(), member.getUserPwd(), authorities);
    }
}
