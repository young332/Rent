package com.kh.rent.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.rent.login.domain.LoginDTO;
import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.login.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/login/*")
@Log4j
public class MemberController {
	
	@Autowired
	private MemberService memberService;

	@GetMapping("/loginin")
	public void login() {
		log.info("loginin..");
	}
	
	@PostMapping("/loginPost")
	public void loginPost(LoginDTO loginDTO,Model model) {
		log.info("loginDTO: " + loginDTO);
		MemberVO memberVO = memberService.login(loginDTO);
		if(memberVO == null) {
			return;
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirectL/login";
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
