package com.kh.rent.checkout.mapper;

import com.kh.rent.checkout.domain.PaymentDTO;
import com.kh.rent.login.domain.MemberVO;

public interface PaymentMapper {
	
	public PaymentDTO getPaymentInfo(int pay_res_rid);
	
//	public MemberVO getMemberVO(String pay_mem_id);
	
	public int deductPayment(PaymentDTO paymentDTO);
	
	public int getMemberPoint(int mem_point);
	
	public int getPayResRid(int pay_res_rid);
	
	public int getPayNonResRid(int pay_res_rid);
	
	public void getPaymentRecord(PaymentDTO paymentDTO);

}
