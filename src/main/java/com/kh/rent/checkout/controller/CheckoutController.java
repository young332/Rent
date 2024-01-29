package com.kh.rent.checkout.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/checkout/*")
public class CheckoutController {

	@GetMapping("/point")
	public void point() {
		log.info("point");
		
	}
	
	@RequestMapping(value = "/payment", method = {RequestMethod.GET, RequestMethod.POST})
    public void payment() {

		log.info("payment");
	}
		
}
