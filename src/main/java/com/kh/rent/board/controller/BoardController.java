package com.kh.rent.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board")
@Log4j
public class BoardController {
	

	@GetMapping("/register")
	public void register() {
		log.info("register");
	}
	
	@PostMapping("/register")
	public String registerPost() {
		log.info("registerPost");
		return null;
	}

	@GetMapping("/list")
	public void list() {
		log.info("list");
	}
	
}
