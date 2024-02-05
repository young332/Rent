package com.kh.rent.login.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@AllArgsConstructor
@Log4j
@RequestMapping("/oauth")
public class OAuthController {

	
	@ResponseBody
	@GetMapping("/kakao")
	public void kakaoCallback(@RequestParam String code) {
		log.info("code:"+ code);
		
		
	}
}
