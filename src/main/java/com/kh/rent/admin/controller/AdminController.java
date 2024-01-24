package com.kh.rent.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.rent.admin.domain.MenuVO;
import com.kh.rent.admin.service.MenuService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private MenuService menuService;
	
	@GetMapping("/main")
	public void adminMainGet() {
		
	}
	
	@GetMapping("/menu")
	public void adminMenuGet(Model model) {
		List<MenuVO> topMenuList = menuService.getTopMenu();
		/* List<MenuVO> subMenuList = menuService.getSubMenu(parentMenu); */
		model.addAttribute("topMenuList", topMenuList);
		/* model.addAttribute("subMenuList", subMenuList); */

	}
	
	@GetMapping("/menuModify")
	public void menuModify(){
		
	}

}
