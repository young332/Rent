package com.kh.rent.checkout.mapper;

import java.util.List;

import com.kh.rent.checkout.domain.PaymentDTO;
import com.kh.rent.checkout.domain.PaymentVO;
import com.kh.rent.reserve.domain.ReserveVO;

public interface PaymentMapper {
	
	// 결제 내역 (insert)
	public int addPaymentRecord(PaymentVO paymentVO);
	
	// 결제 조회
	public List<PaymentDTO> getPaymentInfo(String pay_mem_id);
	
	// 결제 번호
	public List<ReserveVO> payNumber(int res_rid);
	
	// 포인트 차감
	public int deductPayment(PaymentVO paymentVO);
	
	// 포인트 조회
	public int getMemberPoint(int mem_point);
	
	// 예약번호 조회
	public List<ReserveVO> getResRid(String mem_id);
	
	// 비회원 번호 조회
	public int getPayNonResRid(int pay_res_rid);
	
	// 예약상태 확인
	public int reserveStatus(int pay_res_rid); 
	
	// 예약 금액
	public int getTotalPay(int pay_res_rid);
	
	
}
