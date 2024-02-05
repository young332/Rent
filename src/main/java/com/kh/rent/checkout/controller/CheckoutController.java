package com.kh.rent.checkout.controller;

import java.sql.Date;
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
	public void paymentGet(ReserveVO reserveVO,HttpSession session, Model model) {
		//MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");	
		List<ReserveVO> reserveList = paymentService.getResRid();
		log.info("reserveVO: " + reserveVO);
		
//		List<PaymentDTO> paymentList = paymentService.getPaymentInfo(reserveVO.getRes_mem_id());	
//		log.info("paymentList: " + paymentList);
//		log.info("reserveList: " + reserveList);
		
		model.addAttribute("reserveList", reserveList);

		
	}

    @PostMapping("/payment")
	public String paymentPost(@RequestParam("pay_res_rid") int pay_res_rid,
	                                 @RequestParam("res_totalpay") int res_totalpay,
	                                 @RequestParam("point_cost") int point_cost,
	                                 @RequestParam("pay_type") String pay_type,
	                                 @RequestParam("pay_date") Date pay_date,
	                                 @RequestParam("pay_mem_id") String pay_mem_id,
	                                 Model model,
	                                 HttpSession session) {

	    
	    model.addAttribute("pay_res_rid", pay_res_rid);
	    model.addAttribute("res_totalpay", res_totalpay);
	    model.addAttribute("point_cost", point_cost);
	    model.addAttribute("pay_type", pay_type);
	    model.addAttribute("pay_date", pay_date);
	    model.addAttribute("pay_mem_id", pay_mem_id);

	    
	    session.setAttribute("pay_res_rid", pay_res_rid);
	    session.setAttribute("res_totalpay", res_totalpay);
	    session.setAttribute("point_cost", point_cost);
	    session.setAttribute("pay_type", pay_type);
	    session.setAttribute("pay_date", pay_date);
	    session.setAttribute("pay_mem_id", pay_mem_id);
	  
	    return "redirect:/myPage/reservationList";
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
