package com.kh.rent.checkout.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.rent.checkout.domain.PaymentDTO;
import com.kh.rent.checkout.mapper.PaymentMapper;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentMapper paymentMapper; 

	@Override
	public PaymentDTO getPaymentDTO(int pay_res_rid) {
		
		return paymentMapper.getPaymentInfo(pay_res_rid);
	}

	@Override
	public void deductPayment(int pay_res_rid, int pay_cost) {
		// TODO Auto-generated method stub
		
	}
	
	
}
