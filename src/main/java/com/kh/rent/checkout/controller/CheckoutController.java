package com.kh.rent.checkout.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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

		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		String mem_id = loginInfo.getMem_id();
//		List<ReserveVO> reserveList = paymentService.getResRid(mem_id);
//		model.addAttribute("reserveList", reserveList);
		log.info("paymentGet");
//		log.info("reserveList" + reserveList);

	}

    @PostMapping("/payment")
	public String paymentPost(PaymentVO paymentVO, Model model,
	                                 HttpSession session,
	                                 RedirectAttributes rttr) {
    	
    	log.info("paymentDTO:" + paymentVO);
    	MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");		
    	String mem_id = loginInfo.getMem_id();
    	log.info("mem_id:" + mem_id);
    	paymentVO.setPay_mem_id(mem_id);
    	paymentVO.setPay_type("PAY_P");
//    	List<ReserveVO> reserveList = paymentService.getResRid(mem_id);
//		model.addAttribute("reserveList", reserveList);
    	log.info("paymentDTO2:" + paymentVO);
    	boolean result = paymentService.pay(paymentVO);
    	log.info("result: " + result);
//    	model.addAttribute("result", result);	
//			rttr.addFlashAttribute("pay_result", String.valueOf(result));

	    return "redirect:/myPage/reservationList";
//		return null;
    }
	
	
//	@Controller
//	@RequestMapping("/payment")
//	public class PaymentController {
//
//	    @Autowired
//	    private PaymentService paymentService;
//
//	    @Autowired
//	    private ReserveService reserveService;  // Inject ReserveService for fetching reservation details
//
//	    @GetMapping("/process/{res_rid}")
//	    public String processPayment(@PathVariable int res_rid, HttpSession session, Model model) {
//	        // Check if the user is logged in
//	        MemberVO loginInfo = (MemberVO) session.getAttribute("loginInfo");
//	        if (loginInfo == null) {
//	            // Redirect to login page or handle the case when the user is not logged in
//	            return "redirect:/login";
//	        }
//
//	        // Fetch reservation details based on res_rid
//	        ReserveVO reservation = paymentService.payNumber(res_rid);
//
//	        // Add reservation details to the model for rendering on the payment page
//	        model.addAttribute("reservation", reservation);
//
//	        return "paymentPage"; // Replace with the actual payment page name
//	    }
//
//	    @PostMapping("/process/{res_rid}")
//	    public String completePayment(@PathVariable int res_rid, PaymentDTO paymentDTO, HttpSession session, Model model) {
//	        // Validate payment and process it
//	        boolean paymentResult = paymentService.processPayment(paymentDTO);
//
//	        if (paymentResult) {
//	            boolean result = paymentService.pay(paymentDTO);
//				log.info("result: " + result);
//				model.addAttribute("result", result);	
//				rttr.addFlashAttribute("pay_result", String.valueOf(result));
//
//	            return "redirect:/reservation/details/" + res_rid;
//				
//	        } else {
//	            // Payment failed, handle accordingly
//	            model.addAttribute("error", "Payment failed. Please try again.");
//	            return "/payment"; // Redirect back to the payment page with an error message
//	        }
//	    }
//	}
}
    
    
