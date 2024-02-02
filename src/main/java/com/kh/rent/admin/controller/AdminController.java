package com.kh.rent.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.rent.admin.domain.CommonCodeVO;
import com.kh.rent.admin.domain.MenuVO;
import com.kh.rent.admin.service.CodeService;
import com.kh.rent.admin.service.MenuService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private CodeService codeService;
	
	
	@GetMapping("/")
	public String adminMainGet(Model model, @RequestParam(value="menu_id", defaultValue = "MENU001") String menu_id,
			HttpServletRequest request) {
		request.setAttribute("menu_id", menu_id);
		log.info("****");
//		request.getAttribute("topMenuList");
		//List<MenuVO> topMenuList = menuService.getTopMenu();
		/* List<MenuVO> subMenuList = menuService.getSubMenu(parent_menu_id); */
		
		//model.addAttribute("TopMenuList", topMenuList);
		/* model.addAttribute("SubMenuList", subMenuList); */

		return "admin/main";
	}
	
	
	
	
	@GetMapping(value = "/main"/* , produces = {MediaType.APPLICATION_JSON_VALUE} */)
//	@ResponseBody
	public String adminMainPost(@RequestParam(value="menu_id", defaultValue = "MENU001") String menu_id,
			Model model, HttpSession session, HttpServletRequest request) {
		
		
//		List<MenuVO> topMenuList = (List<Menu>) 
//		List<MenuVO> subMenuList =
//		
//		Map<String, Object> responseMap = new HashMap<>();
//	    responseMap.put("TopMenuList", topMenuList);
//	    responseMap.put("SubMenuList", subMenuList);
//		
//		model.addAttribute("TopMenuList", topMenuList);
//		model.addAttribute("SubMenuList", subMenuList);
//		log.info("subMenuList:::"+subMenuList);
//
//		return responseMap;
		
		return "/admin/include/sub_menu";
	}

	@GetMapping("/menu")
	public void adminMenuGet(Model model) {
		List<MenuVO> topMenuList = menuService.getTopMenu();
		/* List<MenuVO> subMenuList = menuService.getSubMenu(parentMenu); */
		
		model.addAttribute("topMenuList", topMenuList);
		/* model.addAttribute("subMenuList", subMenuList); */

	}
	
	@GetMapping("/commonCode")
	public void adminCommonCodeGet(Model model) {
		
		List<CommonCodeVO> topCodeList = codeService.getTopCode();
		log.info("topCodeList:"+topCodeList);

		model.addAttribute("topCodeList", topCodeList);

	}
	
	@GetMapping("/member")
	public void adminMemberGet() {
		
	}

	
	@GetMapping("/car/registerCar")
	public void adminregisterCarGet() {
		
	}
	

}
