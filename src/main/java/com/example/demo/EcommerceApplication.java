package com.example.demo;

import java.util.HashMap;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.context.annotation.SessionScope;

import com.example.demo.entity.CartEntity;

@SpringBootApplication
public class EcommerceApplication{

	public static void main(String[] args) {
		SpringApplication.run(EcommerceApplication.class, args);
	}

	@Bean(name = "myCartItems")
	@SessionScope
	public HashMap<Integer, CartEntity> createCart() {
		return new HashMap<Integer, CartEntity>();
	}
}
