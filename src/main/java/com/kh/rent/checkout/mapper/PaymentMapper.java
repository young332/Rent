package com.kh.rent.checkout.mapper;

import java.util.List;

import com.kh.rent.checkout.domain.PaymentDTO;
import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.reserve.domain.LicenseDTO;
import com.kh.rent.reserve.domain.ReserveVO;

public interface PaymentMapper {
	
	// 결제 내역 (insert)
	public int addPaymentRecord(PaymentDTO paymentDTO);
	
	// 결제 조회
	public List<PaymentDTO> getPaymentInfo(String mem_id);
	
	// 결제 번호
	public List<ReserveVO> payNumber(int res_rid);
	
	// 포인트 차감
	public void deductPayment(PaymentDTO paymentDTO);
	
	// 포인트 조회
	public int getMemberPoint(int mem_point);
	
	// 회원번호 조회
	public List<PaymentDTO> getResRid();
	
	// 비회원 번호 조회
	public int getPayNonResRid(int pay_res_rid);
	
	
}
