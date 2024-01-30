package com.kh.rent.checkout.service;

import com.kh.rent.checkout.domain.PaymentDTO;
import com.kh.rent.login.domain.MemberVO;

public interface PaymentService {
	
	public PaymentDTO getPaymentDTO(int pay_res_rid);
	
	public MemberVO getMemberVO(String pay_mem_id);
	
	public int deductPayment(int pay_res_rid, int pay_cost);
	
	public int getMemberPoint(int mem_point);
	
	public int getPayResRid(int pay_res_rid);
	
	public int getPayNonResRid(int pay_res_rid);
}
