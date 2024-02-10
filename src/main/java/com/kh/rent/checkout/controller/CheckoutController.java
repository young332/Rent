package com.kh.rent.checkout.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.rent.checkout.domain.PaymentVO;
import com.kh.rent.checkout.service.PaymentService;
import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.reserve.domain.ReserveVO;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/checkout/*")
public class CheckoutController {
	
	@Autowired
    private PaymentService paymentService;
	
	@GetMapping("/payment")
	public void paymentGet(@ModelAttribute("res_rid") int res_rid, HttpSession session, Model model) {
		
		log.info("paymentGet");

		//int totalPay = paymentService.getTotalPay(res_rid);
		//log.info("totalPay" + totalPay);
		
		int totalPay = paymentService.getPay(res_rid);
		log.info("totalPay" + totalPay);
		
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		String mem_id = loginInfo.getMem_id();
		List<ReserveVO> reserveList = paymentService.getReserveList(mem_id);
		model.addAttribute("reserveList", reserveList);
		
		log.info("reserveList: " + reserveList);
		
		model.addAttribute("totalPay", totalPay);

	}

    @PostMapping("/payment")
	public String paymentPost(PaymentVO paymentVO, Model model,
	                                 HttpSession session,
	                                 RedirectAttributes rttr) {
    	
    	log.info("paymentVO:" + paymentVO);
    	MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");		
    	String mem_id = loginInfo.getMem_id();
    	log.info("mem_id:" + mem_id);
    	
    	//int totalPay = paymentService.getTotalPay(paymentVO.getPay_res_rid());
    	int totalPay = paymentService.getPay(paymentVO.getPay_res_rid());
    	
    	paymentVO.setPay_amount(totalPay);
    	paymentVO.setPay_mem_id(mem_id);
    	paymentVO.setPay_type("PAY_P");
    	
    	log.info("paymentDTO2:" + paymentVO);
    	boolean result = paymentService.pay(paymentVO);
    	
    	log.info("result: " + result);
    	if (result) {
    		loginInfo.setMem_point(loginInfo.getMem_point() - totalPay);
    		session.setAttribute("loginInfo", loginInfo);
    	}
//    	model.addAttribute("result", result);	
//		rttr.addFlashAttribute("pay_result", String.valueOf(result));

	    return "redirect:/myPage/reservationList";
	    
    }
    
    
    @ResponseBody
    @GetMapping("/pay_cancel/{pay_pid}")
	public String paycancelPost(@PathVariable("pay_pid") int pay_pid, HttpSession session) {
    	log.info("결제취소");
    	
    	
    	MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
    	String mem_id = loginInfo.getMem_id();
    	int point = loginInfo.getMem_point();
    	int totalPay = paymentService.getTotalPay(pay_pid);
    	log.info("mem_id:" + mem_id);
    	log.info("totalPay" + totalPay);
    	

		PaymentVO paymentVO = PaymentVO.builder()
				.pay_mem_id(mem_id)
				.pay_pid(pay_pid)
				.build();
    	paymentVO.setPay_mem_id(mem_id);
    	paymentVO.setPay_pid(pay_pid);
    
    	paymentService.cancelPayAndReserveAndRefund(paymentVO);
    	loginInfo.setMem_point(point + totalPay);
    	session.setAttribute("loginInfo", loginInfo);
    	/*
    	int count = paymentService.payCancel(pay_pid); // 결제 취소
    	
    	log.info("count: " + count);
    	if (count == 1) {
    		
    		boolean result = paymentService.paymentCancel(paymentVO); // 환불, 예약 취소
        	log.info("result: " + result);
        	
        	if (result) {
        		
        		session.setAttribute("result", result);
        		
        		return "success";
        	}

    		return "success";
    		
    	} else {
    		
    		return "fall";
    	}
    	*/
 	
    	return "success";
    }

}
    
    
