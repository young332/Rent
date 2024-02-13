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
import com.kh.rent.checkout.domain.PaymentVO;
import com.kh.rent.reserve.domain.ReserveVO;

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
		PaymentVO paymentVO = PaymentVO.builder()
				.pay_mem_id("MEMBER01")
				.pay_type("PAY_P")
				.build();
		paymentMapper.deductPayment(paymentVO);
		log.info("paymentVO"+paymentVO);
		
	}

	
	@Test
	public void testpayreserveCancel() {
		
		PaymentVO paymentVO = PaymentVO.builder()
				.pay_status("결제취소")
				.pay_res_rid(34)
				.build();
		int res_rid = 34;
		
		paymentMapper.reserveCancel(res_rid);	
		log.info("paymentVO" + paymentVO);
	}
	
}
