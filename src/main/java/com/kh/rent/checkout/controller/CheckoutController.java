package com.kh.rent.checkout.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
    public String payment(HttpServletResponse response, @RequestParam(name = "point_cost") String pointCost) {
        log.info("payment");

        return "redirect:/reserve/reserve";
    }
		
}
