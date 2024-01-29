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
import com.kh.rent.admin.mapper.CodeMapper;
import com.kh.rent.admin.service.CodeService;
import com.kh.rent.admin.service.MenuService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/commonCode/*")
public class CodeController {
	
	@Autowired
	private CodeService codeService;

//	@PostMapping("/topMenuAdd")
//	public String topMenuAdd(MenuVO menuVO, RedirectAttributes rttr) {
//		log.info("menuVO:" + menuVO);
//		int count = menuService.addMenu(menuVO);
//		if(count == 1) {
//			rttr.addFlashAttribute("AddMenuName",menuVO.getMenu_name());
//		}
//		
//		return "redirect:/admin/menu";
//	}
//	
//	
//	@PostMapping("/subMenuAdd")
//	public String SubMenuAdd(MenuVO menuVO, RedirectAttributes rttr) {
//		//log.info("menuVO:" + menuVO);
//		int count = menuService.addMenu(menuVO);
//		if(count == 1) {
//			rttr.addFlashAttribute("AddMenuName",menuVO.getMenu_name());
//		}
//		return "redirect:/admin/menu";
//	}
//	
//	@GetMapping(value = "/submenus/{parentMenu}", produces = {MediaType.APPLICATION_JSON_VALUE})
//    @ResponseBody
//    public List<MenuVO> getSubMenus(@PathVariable("parentMenu") String parentMenu, Model model) {
//		List<MenuVO> subMenuList = menuService.getSubMenu(parentMenu);
//		return subMenuList;
//    }
	
//	
//	@PostMapping("/topMenuModify")
//	public String menuModify(MenuVO menuVO, RedirectAttributes rttr) {
//		log.info("menuVO:" + menuVO);
//		int count = menuService.modifyMenu(menuVO);
//		log.info("count:"+count);
//		if(count == 1) {
//			rttr.addFlashAttribute("ModifyMenuName",menuVO.getMenu_name());
//		}
//		return "redirect:/admin/menu";
//	}
//	
//	@PostMapping("/subMenuModify")
//	public String subMenuModify(MenuVO menuVO, RedirectAttributes rttr) {
//		int count = menuService.modifyMenu(menuVO);
//		if(count == 1) {
//			rttr.addFlashAttribute("ModifyMenuName",menuVO.getMenu_name());
//		}
//		return "redirect:/admin/menu";
//	}
//	
//	@PostMapping("/delete/{parentMenu}")
//	public String menuDelete(@PathVariable("parentMenu") String parentMenu, RedirectAttributes rttr) {
//		int count = menuService.delete(parentMenu);
//	    log.info("count:" + count);
//		if(count == 1) {
//			rttr.addFlashAttribute("deleteMenuName",parentMenu);
//		}
//		return "redirect:/admin/menu";
//	}
//	
//	
	
	
	
	 	
	
	
}
