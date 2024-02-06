package com.kh.rent.checkout.service;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.rent.checkout.domain.PaymentDTO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@Log4j
@WebAppConfiguration
public class PaymentServiceTests {
	
	@Autowired
    private PaymentService paymentService;
	
	//포인트 차감
	@Test
	public void testDeductPayment() {
		Date day = new Date();
		PaymentDTO paymentDTO = PaymentDTO.builder()
				.pay_res_rid(4)
				.pay_mem_id("MEMBER01")
				.pay_type("PAY_P")
				.pay_date(day)
				.point_cost(3000)
				.build();
		paymentService.pay(paymentDTO);
		log.info("paymentDTO"+paymentDTO);
		
	}
	
	//결제 내역
	@Test
	public void testPaymentRecord() {
		for (int i = 0; i < 5; i++) { // 2, 4, 5
			if (i == 2 || i == 4 || i == 5) {
				Date day = new Date();
				PaymentDTO paymentDTO = PaymentDTO.builder()
						.pay_mem_id("MEMBER01")
						.pay_date(day)
						.pay_type("PAY_P")
						.pay_res_rid(i)
						.build();
				paymentService.pay(paymentDTO);
				log.info("paymentDTO" + paymentDTO);
			}
		}
	}
	
	
//	@Test
//	public void testReserve() {
//		PaymentDTO paymentDTO = PaymentDTO.builder()
//				.res_rid(2)
//				.build();
//		paymentService.getResRid();
//		log.info("paymentDTO: " + paymentDTO);
//		
//		
//	}
	
	
	@Test
	public void testgetPaymentInfo() {
		Date day = new Date();
		PaymentDTO paymentDTO = PaymentDTO.builder()
				.pay_res_rid(1)
				.pay_type("PAY_P")
				.pay_mem_id("MEMBER01")
				.pay_date(day)
				.build();
		String res_mem_id = "MEMBER01";
		paymentService.getPaymentInfo(res_mem_id);
		log.info("paymentDTO: " + paymentDTO);

	}
	
	@Test
	public void testpayNumber() {
		Date day = new Date();
		PaymentDTO paymentDTO = PaymentDTO.builder()
				.pay_mem_id("MEMBER01")
				.pay_date(day)
				.pay_type("PAY_P")
				.pay_res_rid(2)
				.res_totalpay(50000)
				.build();
		int res_rid = 2;
		paymentService.payNumber(res_rid);
		log.info("paymentDTO: " + paymentDTO);
	}
	
}

