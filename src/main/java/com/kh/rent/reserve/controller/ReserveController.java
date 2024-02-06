package com.kh.rent.reserve.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import com.kh.rent.reserve.domain.NonMemberVO;
import com.kh.rent.reserve.domain.ReserveDTO;
import com.kh.rent.reserve.domain.ReserveInfoDTO;
import com.kh.rent.reserve.domain.ReserveVO;
import com.kh.rent.reserve.service.NonMemberService;
import com.kh.rent.reserve.service.ReserveService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/reserve/*")
@Log4j
public class ReserveController {
	@Autowired
	private ReserveService reserveService;
	@Autowired
	private NonMemberService nonMemberService;
	
	@GetMapping("/reserve")
	public void reserve( CarInfoVO carinfoVO, HttpSession session, Model model) {
		List<CarInfoVO> carlist = reserveService.getCarInfo();
		model.addAttribute("carlist", carlist); 
		log.info("carlist"+carlist);
		log.info("reserve...");
	}
	
	@GetMapping("/licenseinfo")
	public String licenseinfo(ReserveInfoDTO reserveInfoDTO,HttpSession session) {
//		String topbookoffdate = reserveInfoDTO.getTop_book_off_date();
//		String topbookpickdate = reserveInfoDTO.getTop_book_pick_date();
//		String carindex = reserveInfoDTO.getCar_index();
//		String totalpay = reserveInfoDTO.getTotalPay();
//		
//	    log.info("topbookoffdate:"+topbookoffdate);
//	    log.info("topbookpickdate:"+topbookpickdate);
//	    log.info("carindex:"+carindex);
//	    log.info("totalpay:"+totalpay);
	    log.info("reserveInfoDTO:"+reserveInfoDTO);
	    
	    session.setAttribute("reserveInfoDTO", reserveInfoDTO);
//	    session.setAttribute("topbookpickdate", topbookpickdate);
//	    session.setAttribute("carindex", carindex);
//	    session.setAttribute("totalpay", totalpay);
	    
	    
		    
		    
		    return "reserve/licenseinfo";
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
	public String reserveinsert(ReserveVO reserveVO, HttpSession session, Model model) {
	   
		ReserveInfoDTO reserveInfoDTO = (ReserveInfoDTO) session.getAttribute("reserveInfoDTO");
		String topbookoffdate = (String) reserveInfoDTO.getTop_book_off_date();
	    String topbookpickdate = (String) reserveInfoDTO.getTop_book_pick_date();
	    String carindex = (String) reserveInfoDTO.getCar_index();
	    String totalPay = (String) reserveInfoDTO.getTotalPay();
	    
	    totalPay = totalPay.replaceAll(",", "");
	    
	    log.info("inserttopbookoffdate:"+topbookoffdate);
	    log.info("inserttopbookpickdate:"+topbookpickdate);
	    log.info("insertcarindex:"+carindex);
	    log.info("inserttotalpay:"+totalPay);
	    
	    reserveVO.setRes_return_date(topbookoffdate);
	    reserveVO.setRes_rental_date(topbookpickdate);
	    reserveVO.setRes_car_id(carindex);
	    reserveVO.setRes_totalpay(Integer.parseInt(totalPay));
	    
	    MemberVO memberVO = (MemberVO) session.getAttribute("loginInfo");
	    reserveVO.setRes_mem_id(memberVO.getMem_id());
	    log.info("reserveVO:"+reserveVO);
	    
	    reserveService.reserveinsert(reserveVO);

	    return "redirect:/myPage/reservationList";
	}

	
	@PostMapping("/nonmeminsert")
	public String Nonmeminsert(@RequestBody NonMemberVO nonMemberVO, HttpSession session) {

	    ReserveInfoDTO reserveInfoDTO = (ReserveInfoDTO) session.getAttribute("reserveInfoDTO");
	    String topbookoffdate = (String) reserveInfoDTO.getTop_book_off_date();
	    String topbookpickdate = (String) reserveInfoDTO.getTop_book_pick_date();
	    String carindex = (String) reserveInfoDTO.getCar_index();
	    String totalPay = (String) reserveInfoDTO.getTotalPay();

	    totalPay = totalPay.replaceAll(",", "");

	    nonMemberVO.setNon_rental_date(topbookpickdate);
	    nonMemberVO.setNon_return_date(topbookoffdate);
	    nonMemberVO.setNon_car_id(carindex);
	    nonMemberVO.setNon_totalpay(Integer.parseInt(totalPay));

	    nonMemberService.nonmeminsert(nonMemberVO);

	    return "redirect:/localhost";
	}



}

