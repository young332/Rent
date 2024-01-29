package com.kh.rent.checkout.domain;

import org.apache.ibatis.annotations.Param;

// MemberVO와 PaymentDTO를 조작하는 DAO클래스
public interface PaymentDAO {
	public void updateMemberPoint(@Param("mem_id") String memberId, 
			@Param("pointToDeduct") int pointToDeduct);
}
