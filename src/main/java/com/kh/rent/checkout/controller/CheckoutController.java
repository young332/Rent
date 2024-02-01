package com.kh.rent.checkout.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.kh.rent.checkout.domain.PaymentDTO;
import com.kh.rent.checkout.service.PaymentService;
import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.login.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/checkout/*")
public class CheckoutController {
	
	@Autowired
    private PaymentService paymentService;

    @Autowired
    private MemberService memberService;
    
    @RequestMapping(value = "/payment", method = {RequestMethod.GET, 
    		RequestMethod.POST})
    public void payment() {
 
		log.info("payment");
	}
    
    @RequestMapping(value = "/point", method = {RequestMethod.GET, 
    		RequestMethod.POST})
    public void point() {
 
		log.info("point");
	}
    
    @PostMapping()
    public String payPage(@PathVariable("mem_id") String mem_id,
                          PaymentDTO paymentDTO, Model model,
                          HttpSession session) {
    	
    	MemberVO loginInfo = (MemberVO) session.getAttribute("loginInfo");
        if (loginInfo != null) {
            model.addAttribute("loginInfo", loginInfo);
        }
    	
        return "/reserve/reserve";
    }
		
}
