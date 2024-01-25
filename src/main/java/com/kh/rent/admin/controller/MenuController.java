package com.kh.rent.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String topMenuAdd(MenuVO menuVO, RedirectAttributes rttr) {
		log.info("menuVO:" + menuVO);
		int count = menuService.addMenu(menuVO);
		if(count == 1) {
			rttr.addFlashAttribute("AddMenuName",menuVO.getMenu_name());
		}
		
		return "redirect:/admin/menu";
	}
	
	
	@PostMapping("/subMenuAdd")
	public String SubMenuAdd(MenuVO menuVO, RedirectAttributes rttr) {
		log.info("menuVO:" + menuVO);
		int count = menuService.addMenu(menuVO);
		if(count == 0) {
			rttr.addFlashAttribute("AddMenuName",menuVO.getMenu_name());
		}
		return "redirect:/admin/menu";
	}
	
	@GetMapping(value = "/submenus/{parentMenu}", produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public List<MenuVO> getSubMenus(@PathVariable("parentMenu") String parentMenu, Model model) {
		List<MenuVO> subMenuList = menuService.getSubMenu(parentMenu);
		return subMenuList;
    }
	
	
	@PostMapping("/modify")
	public String menuModify(MenuVO menuVO) {
		
		return "redirect:/admin/menu";
	}
	
	
//	@GetMapping(value = "/list/{bno}" , produces = MediaType.APPLICATION_JSON_VALUE)
//	public MenuVO getList(@PathVariable("menu_id") String menu_id){
//		
//		MenuVO menuVO = menuService.getOneMenu(menu_id);
//		return menuVO;
//		
//	}
	
	
	
	
	
	 	
	
	
}
