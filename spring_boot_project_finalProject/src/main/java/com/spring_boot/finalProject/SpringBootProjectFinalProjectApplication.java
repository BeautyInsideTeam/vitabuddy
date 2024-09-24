package com.spring_boot.finalProject;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages={"com.spring_boot.finalProject"})
@MapperScan(basePackages={"com.spring_boot.finalProject"})
public class SpringBootProjectFinalProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootProjectFinalProjectApplication.class, args);
	}

}
