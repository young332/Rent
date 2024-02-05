package com.kh.rent.checkout.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.rent.checkout.domain.PaymentDTO;
import com.kh.rent.checkout.domain.PaymentVO;
import com.kh.rent.checkout.service.PaymentService;
import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.reserve.domain.LicenseDTO;
import com.kh.rent.reserve.domain.ReserveDTO;
import com.kh.rent.reserve.domain.ReserveVO;
import com.kh.rent.reserve.service.ReserveService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/checkout/*")
public class CheckoutController {
	
	@Autowired
    private PaymentService paymentService;

	@Autowired 
	private ReserveService reserveService;
	
	@GetMapping("/payment")
	public void paymentGet(HttpSession session, Model model) {
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		String mem_id = loginInfo.getMem_id();
		List<ReserveVO> reserveList = paymentService.getResRid(mem_id);
		model.addAttribute("reserveList", reserveList);
		log.info("paymentGet");
		log.info("reserveList" + reserveList);
		
//		List<PaymentDTO> paymentList = paymentService.getPaymentInfo(reserveVO.getRes_mem_id());	
//		log.info("paymentList: " + paymentList);
//		log.info("reserveList: " + reserveList);
		
		
	}


    @PostMapping("/checkout")
	public String order(PaymentDTO paymentDTO) {
		log.info(paymentDTO);
		paymentService.pay(paymentDTO);
		return "redirect:/myPage/reservationList";
	}
    
    
  
}
