package com.kh.rent.checkout.service;

import java.util.List;

import com.kh.rent.checkout.domain.PaymentDTO;
import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.reserve.domain.LicenseDTO;

public interface PaymentService {
	
	public PaymentDTO getPaymentDTO(int pay_res_rid);
	
//	public int deductPayment(PaymentDTO paymentDTO);
	
	public int getMemberPoint(int mem_point);
	
	public List<LicenseDTO> getResRid();
	
	public int getPayNonResRid(int pay_res_rid);
	
	public void getPaymentInfo(PaymentDTO paymentDto);

	public void pay(PaymentDTO paymentDto);
	
	public List<PaymentDTO> payNumber();

}
