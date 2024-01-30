package com.kh.rent.checkout.domain;

import org.apache.ibatis.annotations.Param;

// MemberVO와 PaymentDTO를 연결
public interface PaymentDAO {
	public void updateMemberPoint(@Param("mem_id") String memberId, 
			@Param("pointToDeduct") int pointToDeduct);
}
