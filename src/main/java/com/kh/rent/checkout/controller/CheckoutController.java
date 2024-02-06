package com.kh.rent.checkout.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.rent.checkout.domain.PaymentDTO;
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
	
	@GetMapping("/payment")
	public void paymentGet(HttpSession session, Model model) {
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");	
		String mem_id = loginInfo.getMem_id();
		List<ReserveVO> reserveList = paymentService.getResRid(mem_id);
		model.addAttribute("reserveList", reserveList);
		log.info("reserveList" + reserveList);
		log.info("payment");
		
	}
	
	
    @PostMapping("/payment")
	public String paymentPost(PaymentDTO paymentDTO, Model model,
	                                 HttpSession session,
	                                 RedirectAttributes rttr) {
    	
    	log.info("paymentDTO:" + paymentDTO);
    	MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");		
    	String mem_id = loginInfo.getMem_id();
    	log.info("mem_id:" + mem_id);
    	paymentDTO.setMem_id(mem_id);
//    	List<ReserveVO> reserveList = paymentService.getResRid(mem_id);
//		model.addAttribute("reserveList", reserveList);
    	log.info("paymentDTO2:" + paymentDTO);
    	boolean result = paymentService.pay(paymentDTO);
    	log.info("result: " + result);
//    	model.addAttribute("result", result);	
		rttr.addFlashAttribute("pay_result", String.valueOf(result));

	    return "redirect:/myPage/reservationList";
	}
    
    @GetMapping("/point")
    public void point() {
 
		log.info("point");
	}
}
