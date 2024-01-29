package com.kh.rent.checkout.service;

import com.kh.rent.checkout.domain.PaymentDTO;

public interface PaymentService {
	
	public PaymentDTO getPaymentDTO(int pay_res_rid);

	public void deductPayment(int pay_res_rid, int pay_cost);
}
