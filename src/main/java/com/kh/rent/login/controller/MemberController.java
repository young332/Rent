package com.kh.rent.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;



import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/login/*")
@Log4j
public class MemberController {

	@GetMapping("/loginin")
	public void login() {
		log.info("loginin..");
	}
	
	@GetMapping("/singup")
	public void findId() {
		log.info("singup");
	}
	
	@GetMapping("/findPw")
	public void findPw() {
		log.info("findpw");
	}
	
	@GetMapping("/findId")
	public void singUp() {
		log.info("findId");
	}
	
}
