package com.kh.rent.checkout.mapper;

import com.kh.rent.login.domain.MemberVO;

public interface PaymentMapper {
	
	/* 예약 금액 차감 */
	public int minusMoney(MemberVO member);

}
