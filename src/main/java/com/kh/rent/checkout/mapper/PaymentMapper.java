package com.kh.rent.checkout.mapper;

import com.kh.rent.checkout.domain.PaymentDTO;
import com.kh.rent.login.domain.MemberVO;

public interface PaymentMapper {
	
	public PaymentDTO getPaymentInfo(int pay_res_rid);
	public MemberVO getMemberVO(String pay_mem_id);

}
