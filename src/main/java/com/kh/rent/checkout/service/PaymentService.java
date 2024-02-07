package com.kh.rent.checkout.service;

import java.util.List;
import java.util.Map;

import com.kh.rent.checkout.domain.PaymentDTO;
import com.kh.rent.checkout.domain.PaymentVO;
import com.kh.rent.reserve.domain.ReserveVO;

public interface PaymentService {
	
	
//	public boolean addPayment(PaymentVO paymentVO);
	
	// 결제 조회
	public List<PaymentDTO> getPaymentInfo(String pay_mem_id);
	
	// 결제 번호 조회
	public List<ReserveVO> payNumber(int res_rid);
	
	// 결제 및 포인트 차감
	public boolean pay(PaymentVO paymentVO);
		
//	public int deductPayment(PaymentDTO paymentDTO);
	
	// 포인트 조회
	public int getMemberPoint(int mem_point);
	
	// 예약정보 조회하기
	public List<ReserveVO> getReserveList(String mem_id);
	
	// 비회원 번호 조회
	public int getPayNonResRid(int pay_res_rid);
	
	// 예약 금액
	public int getTotalPay(int pay_res_rid);
	
	// 결제취소
	public boolean paymentCancel(PaymentVO paymentVO);
	
}
