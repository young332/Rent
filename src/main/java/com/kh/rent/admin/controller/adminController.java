package com.kh.rent.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
public class adminController {
	
	@GetMapping("/main")
	public void adminMainGet() {
		
	}
	
	@GetMapping("/menu")
	public void adminMenuGet() {
		
	}
	
	@GetMapping("/menuWrite")
	public void adminMenuAddGet() {
		
	}
}
