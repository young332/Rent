package com.kh.rent.checkout.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/checkout/*")
public class checkoutController {
	
	@GetMapping("/payment")
	public void pay() {
		log.info("pay");	
	}
	
}
