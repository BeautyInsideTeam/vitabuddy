package com.example.vitabuddy;

import org.mybatis.spring.annotation.MapperScan;
<<<<<<< HEAD
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
=======
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
>>>>>>> merge_features/Login

@SpringBootApplication
@ComponentScan(basePackages = { "com.example.vitabuddy" })
@MapperScan(basePackages = { "com.example.vitabuddy" })
<<<<<<< HEAD
public class VitabuddyApplication {
=======
public class VitabuddyApplication{
>>>>>>> merge_features/Login

	public static void main(String[] args) {
		SpringApplication.run(VitabuddyApplication.class, args);
	}

}