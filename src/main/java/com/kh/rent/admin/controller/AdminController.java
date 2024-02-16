package com.kh.rent.admin.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.rent.admin.domain.CarInfoVO;
import com.kh.rent.admin.domain.CommonCodeVO;
import com.kh.rent.admin.domain.DelMemberVO;
import com.kh.rent.admin.domain.MenuVO;
import com.kh.rent.admin.domain.Search;
import com.kh.rent.admin.service.AdMemberService;
import com.kh.rent.admin.service.CarInfoService;
import com.kh.rent.admin.service.CodeService;
import com.kh.rent.admin.service.MenuService;
import com.kh.rent.board.service.BoardService;
import com.kh.rent.login.domain.LoginDTO;
import com.kh.rent.login.domain.MemberVO;

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
	
	@Autowired
	private CarInfoService carInfoService;
	
	@Autowired
	private BoardService boardService;
	
	
	
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
	public void adminMemberGet(Model model, Search search) {
		List<MemberVO> MemberList = adMemberService.selectAllMember(search);
		//log.info("search:" +search);
		//log.info("MemberList:"+MemberList);
		model.addAttribute("MemberList", MemberList);
	}
	
	@GetMapping("/delMember")
	public void adminDelMemberGet(Model model) {
		List<DelMemberVO> DelMemberList = adMemberService.selectDelMember();
		log.info("DelMemberList:"+DelMemberList);
		model.addAttribute("DelMemberList", DelMemberList);
	}


	@GetMapping("/car/registerCar")
	public void adminregisterCarGet(Model model) {
		List<CommonCodeVO> carNamelist = carInfoService.selectCarName();
		model.addAttribute("carNamelist", carNamelist);
	}
	
	@GetMapping("/car/ListCar")
	public void adminListCarGet(Model model, Search search) {
		List<CarInfoVO> carInfoList = carInfoService.selectCarInfo(search);
		List<CommonCodeVO> carNamelist = carInfoService.selectCarName();
		model.addAttribute("carNamelist", carNamelist);
		model.addAttribute("carInfoList", carInfoList);
		log.info(carInfoList);
	}
	
	@GetMapping("/board")
	public void adminboardGet(Model model) {
		log.info("list");
//		List<BoardVO> list = boardService.getList();
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String formattedDateTime = now.format(formatter);
		model.addAttribute("dateTime",formattedDateTime);
//		model.addAttribute("boardVO", list);
		log.info("model:" +  model);
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
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		log.info("logout");
		return "redirect:/admin/login";
	}
	

	

}