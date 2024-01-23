package com.kh.rent.myPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/myPage/*")
@Log4j
public class MyPageController {
	
	@GetMapping("/reservationList")
	public void reservation() {
		log.info("reservationListGet..");
	}
	
	@GetMapping("/point")
	public void point() {
		log.info("pointGet..");
	}
	
	@GetMapping("/myPage")
	public void myPage() {
		log.info("myPageGet..");
	}
	
	@GetMapping("/myPageInfo")
	public void myPageInfo() {
		log.info("myPageGet..");
	}
	
}
