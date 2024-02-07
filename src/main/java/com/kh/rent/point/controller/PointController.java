package com.kh.rent.point.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/point/*")
public class PointController {
	@GetMapping("/point")
    public void point() {
 
		log.info("point");
	}
}
