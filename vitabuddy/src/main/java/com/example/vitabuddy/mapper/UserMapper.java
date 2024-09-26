package com.example.vitabuddy.mapper;

import com.example.vitabuddy.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserMapper {
	@Select("SELECT * FROM users WHERE id = #{id}")
	User selectUser(int id);
	
	void interUser(User user);
}