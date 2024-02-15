package com.kh.rent.checkout.service;

import java.util.List;
import java.util.Map;

import com.kh.rent.checkout.domain.PaymentDTO;
import com.kh.rent.checkout.domain.PaymentVO;
import com.kh.rent.reserve.domain.ReserveDTO;
import com.kh.rent.reserve.domain.ReserveVO;

public interface PaymentService {
	
			
	// 결제 번호 조회
	public List<ReserveVO> payNumber(int res_rid);
	
	// 결제 및 포인트 차감
	public boolean pay(PaymentVO paymentVO);
		
//	public int deductPayment(PaymentDTO paymentDTO);
	
	// 포인트 조회
	public int getMemberPoint(int mem_point);
	
	// 예약정보 조회하기
	public List<ReserveVO> getReserveList(String mem_id);
			
	public int getPay(int pay_res_rid);
	
	// 예약 금액
	public int getTotalPay(int pay_res_rid);
	
	// 환불
//	public boolean paymentCancel(PaymentVO paymentVO);
	
	// 결제취소로 상태변경
	public int payCancel(int pay_pid);
	
	// 환불
	public void cancelPayAndReserveAndRefund(PaymentVO paymentVO);
	
		
}
