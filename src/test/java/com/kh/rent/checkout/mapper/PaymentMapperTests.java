package com.kh.rent.checkout.mapper;

import java.util.Date;
import java.util.List;

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
public class PaymentMapperTests {
	
	@Autowired
	private PaymentMapper paymentMapper;
	
	//포인트 차감
	@Test
	public void testDeductPayment() {
		Date day = new Date();
		PaymentDTO paymentDTO = PaymentDTO.builder()
				.pay_mem_id("MEMBER01")
				.pay_type("PAY_P")
				.pay_date(day)
				.point_cost(1000)
				.build();
		/*
		 * paymentMapper.deductPayment(paymentDTO); log.info("paymentDTO"+paymentDTO);
		 */
		
	}
	
	
}
