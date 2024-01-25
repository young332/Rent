package com.kh.rent.reserve.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/reserve/*")
@Log4j
public class ReserveController {
	
	@GetMapping("/reserve")
	public void reserve() {
		log.info("reserve...");
	}
	
	@GetMapping("/licenseinfo")
	public void licenseinfo() {
		log.info("licenseinfo...");
	}
}
