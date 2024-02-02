package com.kh.rent.reserve.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.rent.admin.domain.CarInfoVO;
import com.kh.rent.checkout.domain.PaymentDTO;
import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.reserve.domain.LicenseDTO;
import com.kh.rent.reserve.domain.ReserveDTO;
import com.kh.rent.reserve.domain.ReserveVO;
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
	public String reservecars(@RequestParam(name = "car_company", required = false) String carCompany,
				            @RequestParam(name = "car_size", required = false) String carSize,
				            @RequestParam(name = "car_fuel", required = false) String carFuel,
				            @RequestParam(name = "op_carseat", required = false) String opCarseat,
                           @RequestParam(name = "op_navi", required = false) String opNavi,
                           @RequestParam(name = "op_bt", required = false) String opBt,
                           @RequestParam(name = "op_cam", required = false) String opCam,
				            Model model) {
			log.info("Selected carCompany: " + carCompany);
			log.info("Selected carSize: " + carSize);
			log.info("Selected carFuel: " + carFuel);
			log.info("Selected opCarseat: " + opCarseat);
			log.info("Selected opNavi: " + opNavi);
			log.info("Selected opBt: " + opBt);
			log.info("Selected opCam: " + opCam);
		
			ReserveDTO reserveDTO = new ReserveDTO();
			reserveDTO.setCar_company(carCompany);
			reserveDTO.setCar_size(carSize);
			reserveDTO.setCar_fuel(carFuel);
			reserveDTO.setOp_carseat(opCarseat);
			reserveDTO.setOp_navi(opNavi);
			reserveDTO.setOp_bt(opBt);
			reserveDTO.setOp_cam(opCam);
			
			
			
			List<ReserveDTO> checkcarlist = reserveService.selectCheck(reserveDTO);
			model.addAttribute("checkcarlist", checkcarlist);
			log.info("checkcarlist: " + checkcarlist);
			
			return "reserve/reservecars";
		
	}
	
	
	@GetMapping("/licenseinfo")
	public String licenseinfo(HttpSession session, Model model) {
	    MemberVO loginInfo = (MemberVO) session.getAttribute("loginInfo");
	    if (loginInfo != null) {
	        model.addAttribute("loginInfo", loginInfo);
	    }
	    
	    return "reserve/licenseinfo";
	}
	
	@PostMapping("/licenseinfo")
	public String processLicenseInfo(@RequestParam("name") String name,
	                                 @RequestParam("tel") String tel,
	                                 @RequestParam("birthdate") String birthdate,
	                                 @RequestParam("licenseType") String licenseType,
	                                 @RequestParam("licensenum") String licensenum,
	                                 Model model,
	                                 HttpSession session) {

	    // Store the information in the model for later retrieval
	    model.addAttribute("name", name);
	    model.addAttribute("tel", tel);
	    model.addAttribute("birthdate", birthdate);
	    model.addAttribute("licenseType", licenseType);
	    model.addAttribute("licensenum", licensenum);

	    // Additionally, you can save this information to the session if needed
	    // Example:
	    session.setAttribute("name", name);
	    session.setAttribute("tel", tel);
	    session.setAttribute("birthdate", birthdate);
	    session.setAttribute("licenseType", licenseType);
	    session.setAttribute("licensenum", licensenum);

	    // Redirect to the payment page
	    return "redirect:/checkout/payment";
	}

	
	@PostMapping("/reserveinsert")
	public String reserveinsert(ReserveVO reserveVO) {
		reserveService.reserveinsert(reserveVO);
		log.info("reserveVO"+reserveVO);
		return "redirect:/checkout/payment";
	}
}
