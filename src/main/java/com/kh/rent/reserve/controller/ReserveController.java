package com.kh.rent.reserve.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.rent.admin.domain.CarInfoVO;
import com.kh.rent.checkout.domain.PaymentDTO;
import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.reserve.domain.LicenseDTO;
import com.kh.rent.reserve.domain.ReserveDTO;
import com.kh.rent.reserve.domain.ReserveInfoDTO;
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
	
	@GetMapping("/licenseinfo")
	public String licenseinfo(ReserveInfoDTO reserveInfoDTO,RedirectAttributes rttr,
	                          Model model) {
		
		
		    log.info("reserveInfoDTO:"+reserveInfoDTO);
		    
		    
		    return "reserve/licenseinfo";
	}
		  
		

	@GetMapping("/reserveinfo")
	@ResponseBody
	public String reserveinfo(ReserveInfoDTO reserveInfoDTO,
	                          HttpSession session,RedirectAttributes rttr) {

	    String topBookPickDate = reserveInfoDTO.getTop_book_pick_date();
	    String topBookOffDate = reserveInfoDTO.getTop_book_off_date();
	    String totalPay = reserveInfoDTO.getTotalPay();
	    String carIndex = reserveInfoDTO.getCar_index();

	    log.info("topBookPickDate: " + topBookPickDate);
	    log.info("topBookOffDate: " + topBookOffDate);
	    log.info("carIndex: " + carIndex);
	    log.info("totalPay: " + totalPay);

	    rttr.addAttribute("top_book_pick_date", topBookPickDate);
	    rttr.addAttribute("top_book_off_date", topBookOffDate);
	    rttr.addAttribute("totalPay", totalPay);
	    rttr.addAttribute("car_index", carIndex);
	    

	    return "redirect:/reserve/licenseinfo";
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
	
	

	@PostMapping("/reserveinsert")
	public String reserveinsert(ReserveVO reserveVO,
	                            @RequestParam("top_book_pick_date") String rentalDate,
	                            @RequestParam("top_book_off_date") String returnDate,
	                            @RequestParam("total_pay") Integer totalPay,
	                            @RequestParam("res_license_type") String licenseType,
	                            @RequestParam("res_license_num") String licenseNum,
	                            HttpSession session, Model model) {
	   
		log.info("rentalDate"+rentalDate);
		log.info("returnDate"+returnDate);
		log.info("totalPay"+totalPay);
		log.info("licenseType"+licenseType);
		log.info("res_license_num"+licenseNum);
		return "reserve/licenseinfo";
	}



}
