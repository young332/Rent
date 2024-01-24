package com.kh.rent.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.rent.admin.domain.MenuVO;
import com.kh.rent.admin.service.MenuService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/menu/*")
public class MenuController {
	
	@Autowired
	private MenuService menuService;

	
	@PostMapping("/topMenuAdd")
	public void topMenuAdd(MenuVO menuVO) {
		log.info("menuVO:" + menuVO);
	}
}