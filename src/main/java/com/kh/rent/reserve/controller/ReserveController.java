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
//		List<CarInfoVO> carlist = reserveService.getCarInfo();
//		model.addAttribute("carlist", carlist); 
//		log.info("carlist"+carlist);
//		log.info("reserve...");
	}
	
	// 선택
	@GetMapping(value = "/reserveCheck", produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public List<ReserveDTO> reserveCheck(@RequestBody CarInfoVO carInfoVO, HttpSession session, Model model) {
		log.info("carInfoVo:" + carInfoVO);
//		List<CarInfoVO> carlist = reserveService.getCarInfo();
//		model.addAttribute("carlist", carlist); 
//		log.info("carlist"+carlist);
//		log.info("reserve...");
		List<ReserveDTO> reserveList = new ArrayList<>();
		reserveList.add(new ReserveDTO("1234", "5678", "소나타", "현대", "소형", "휘발유", "카시트", "네비", "비티", "캠", 10000));
		reserveList.add(new ReserveDTO("4321", "8765", "소나타2", "기아", "대형", "경유", "카시트2", "네비2", "비티2", "캠2", 20000));
//		model.addAttribute("reserveList", reserveList);
//		return "reserve/reserve2"; // reserve2.jsp 
		return reserveList;
	}
	
	@GetMapping("/licenseinfo")
	public void licenseinfo() {
		log.info("licenseinfo...");
	}
}
