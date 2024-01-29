package com.kh.rent.reserve.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.rent.admin.domain.CarInfoVO;
import com.kh.rent.reserve.domain.ReserveDTO;
import com.kh.rent.reserve.service.ReserveService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/reserve/*")
@Log4j
public class ReserveController {
	@Autowired
	private ReserveService reserveService;
	
	@GetMapping("/reserve")
	public void reserve( HttpSession session, Model model) {
		List<CarInfoVO> carlist = reserveService.getCarInfo();
		model.addAttribute("carlist", carlist); 
		log.info("carlist"+carlist);
		log.info("reserve...");
	}
	
	@GetMapping("/licenseinfo")
	public void licenseinfo() {
		log.info("licenseinfo...");
	}
}
