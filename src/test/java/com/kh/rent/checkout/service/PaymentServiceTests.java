package com.kh.rent.checkout.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.rent.checkout.domain.PaymentDTO;
import com.kh.rent.login.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@Log4j
@WebAppConfiguration
public class PaymentServiceTests {
	
	@Autowired
    private PaymentService paymentService;
	
	@Test
    public void testPaymentDeduction() {};
    
//    @Test
//    public void testPay() {
//    	this.paymentService.pay();
//    }
	
}

