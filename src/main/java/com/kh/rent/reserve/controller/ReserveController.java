package com.kh.rent.reserve.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public void reserve( CarInfoVO carinfoVO, HttpSession session, Model model) {
		List<CarInfoVO> carlist = reserveService.getCarInfo();
		model.addAttribute("carlist", carlist); 
		log.info("carlist"+carlist);
		log.info("reserve...");
	}
	
	// 선택
	@GetMapping("/reservecars")
	public String reservecars(CarInfoVO carInfoVO, HttpSession session, Model model) {
		log.info("carInfoVo:" + carInfoVO);
		ReserveDTO reserveDTO = new ReserveDTO();
		List<ReserveDTO> checkcarlist = reserveService.selectCheck(reserveDTO);
		model.addAttribute("checkcarlist", checkcarlist); 
		log.info("checkcarlist"+checkcarlist);
		
		return "reserve/reservecars"; 
		
	}
	
	@GetMapping("/licenseinfo")
	public void licenseinfo() {
		log.info("licenseinfo...");
	}
}
