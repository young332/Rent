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
    private PaymentService PaymentService;
	
	@Test
    public void testPaymentDeduction() {
        
        int pay_res_rid = 1;
        String pay_mem_id = "MEMBER01";
        int pay_cost = 100; // 테스트하고자 하는 결제 금액

       
        PaymentDTO paymentInfoBefore = PaymentService.getPaymentDTO(pay_res_rid);
        int memberPointBefore = getMemberPoint(PaymentDTO.builder()
        						.pay_cost(pay_cost)
        						.pay_res_rid(pay_res_rid)
        						.build());

        
        PaymentService.deductPayment(pay_res_rid, pay_cost);

        
        PaymentDTO paymentInfoAfter = PaymentService.getPaymentDTO(pay_res_rid);
        int memberPointAfter = getMemberPoint(MemberVO.builder().build());

       
       
    }

	    private int getMemberPoint(PaymentDTO paymentDTO) {
	       
		   
	        return 1000;
	    }
	

}

