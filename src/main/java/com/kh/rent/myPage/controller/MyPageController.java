package com.kh.rent.myPage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.rent.login.domain.LoginDTO;
import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.myPage.service.MyPageService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/myPage/*")
@Log4j
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;
	
	@GetMapping("/reservationList")
	public void reservation() {
		log.info("reservationListGet..");
	}
	
	@GetMapping("/myPage")
	public void myPage(LoginDTO loginDTO, Model model, HttpSession session) {
		log.info("myPageGet..");
		log.info("loginDTO:" + loginDTO);
	}
	
	@GetMapping("/myPageInfo")
	public void myPageInfo() {
		log.info("myPageInfo Get..");
	}
	
	@GetMapping("/myPageInfo_modify")
	public void myPageInfo_modify() {
		log.info("myPageInfo_modify get..");
	}
	
	@PostMapping("/modify")
	public void modifyInfo() {
		log.info("modifyInfo Post...");
	}
	
}
