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
import com.kh.rent.admin.domain.DelMemberVO;
import com.kh.rent.admin.domain.MenuVO;
import com.kh.rent.admin.service.AdMemberService;
import com.kh.rent.admin.service.CodeService;
import com.kh.rent.admin.service.MenuService;
import com.kh.rent.login.domain.LoginDTO;
import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.login.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private AdMemberService adMemberService;
	
	
	
	@GetMapping("/")
	public String adminMainGet(Model model, @RequestParam(value="menu_id", defaultValue = "MENU001") String menu_id,
			HttpServletRequest request) {
		request.setAttribute("menu_id", menu_id);
		log.info("****");
		return "admin/login";
	}
	
	
	
	
	@GetMapping(value = "/main"/* , produces = {MediaType.APPLICATION_JSON_VALUE} */)
//	@ResponseBody
	public String adminMainPost(@RequestParam(value="menu_id", defaultValue = "MENU001") String menu_id,
			Model model, HttpSession session, HttpServletRequest request) {

		
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
	public void adminMemberGet(Model model) {
		List<MemberVO> MemberList = adMemberService.selectAllMember();
		log.info("MemberList:"+MemberList);
		model.addAttribute("MemberList", MemberList);
	}
	
	@GetMapping("/delMember")
	public void adminDelMemberGet(Model model) {
		List<DelMemberVO> DelMemberList = adMemberService.selectDelMember();
		log.info("DelMemberList:"+DelMemberList);
		model.addAttribute("DelMemberList", DelMemberList);
	}

	
	@GetMapping("/car/registerCar")
	public void adminregisterCarGet() {
		
	}
	
	@GetMapping("/car/ListCar")
	public void adminListCarGet() {
		
	}
	
    // ----------- 로그인 --------------- 	
	
	@GetMapping("/login")
	public void adminLoginGet() {
		
	}
	
	//로그인
	@PostMapping("/loginPost")
	public void loginPost(LoginDTO loginDTO, Model model, HttpSession session) {
		log.info("loginDTO: " + loginDTO);
		MemberVO memberVO = adMemberService.login(loginDTO);
		log.info("memberVO: " + memberVO);
		session.setAttribute("memberVO", memberVO);
		if(memberVO == null) {
			return;
		}
		model.addAttribute("loginInfo", memberVO);
		model.addAttribute("useCookie", loginDTO.getUseCookie());
		
	}
	
	

}
