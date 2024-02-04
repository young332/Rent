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
import org.springframework.web.bind.annotation.ResponseBody;

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

	@Autowired 
	private ReserveService reserveService;
	
	@GetMapping("/payment")
	public void payment(HttpSession session, Model model) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		ReserveVO reserveVO = (ReserveVO)session.getAttribute("reserveInfo");
		
		
		List<PaymentDTO> paymentList = paymentService.getPaymentInfo(memberVO.getMem_id());
		
		model.addAttribute("paymentList", paymentList);

		
	}
	
    @PostMapping("/payment")
    @ResponseBody
    public String payment(@RequestBody PaymentDTO paymentDTO, HttpSession session) {
    	MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
    	ReserveDTO reserveDTO = (ReserveDTO)session.getAttribute("reserveDTO");
    	
    	paymentService.pay(paymentDTO);
    	
    	log.info("paymentDTO" + paymentDTO);
    	
  //  	boolean result = paymentService.addPayment(paymentDTO);
    	   	
   		return "/myPage/myPage";
    }
    
    @GetMapping("/point")
    public void point() {
 
		log.info("point");
	}


//    @GetMapping("/payment")
//    public void payment(MemberVO memberVO, HttpSession session, Model model) {
//    	MemberVO loginInfo = (MemberVO) session.getAttribute("loginInfo");
//        if (loginInfo != null) {
//            model.addAttribute("loginInfo", loginInfo);
//        }
//
//    	log.info("payment");
//    }
//    
//    @PostMapping("/payment")
//    public String payment(@PathVariable("pay_res_rid") int pay_res_rid,
//         PaymentDTO paymentDTO, Model model, HttpSession session) {
//    	
//    	MemberVO loginInfo = (MemberVO) session.getAttribute("loginInfo");
//    	if (loginInfo != null) {
//    		model.addAttribute("loginInfo", loginInfo);
//    	}
//    	
//    	
//    	 PaymentDTO paymentDto = new PaymentDTO();
//
//    	 paymentService.pay(paymentDto);
//
//    	 List<PaymentDTO> paymentList = paymentService.payNumber();
//
//    	 model.addAttribute("paymentlist", paymentList);
//
//		
//		return "/myPage/myPage";
//		
//	}

    
}
