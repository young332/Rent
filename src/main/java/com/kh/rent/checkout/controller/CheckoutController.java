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
import org.springframework.web.bind.annotation.RequestParam;
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

		int totalPay = paymentService.getTotalPay(res_rid);
		
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
    	
    	log.info("paymentDTO:" + paymentVO);
    	MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");		
    	String mem_id = loginInfo.getMem_id();
    	log.info("mem_id:" + mem_id);
    	
    	int totalPay = paymentService.getTotalPay(paymentVO.getPay_res_rid());
    	
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
	
    @PostMapping("/pay_cancel")
    public String paycancelPost(@RequestParam("pay_res_rid") int pay_res_rid) {
        
    	log.info("결제 취소");
        
        // 결제 상태 변경 서비스 호출
        paymentService.paymentCancle(pay_res_rid);
        
        
        
        // 결제 취소가 완료되면 다음 페이지로 리다이렉트
        return "redirect:/myPage/reservationList";
    }

}
    
    
