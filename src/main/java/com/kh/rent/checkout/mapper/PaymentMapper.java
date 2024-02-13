package com.kh.rent.checkout.mapper;

import java.util.List;
import java.util.Map;

import com.kh.rent.checkout.domain.PaymentDTO;
import com.kh.rent.checkout.domain.PaymentVO;
import com.kh.rent.reserve.domain.ReserveDTO;
import com.kh.rent.reserve.domain.ReserveVO;

public interface PaymentMapper {
	
	// 결제 내역 (insert)
	public int addPaymentRecord(PaymentVO paymentVO);
	
	// 결제 금액 변경
	public int pay_amount(int pay_res_rid);
	
	// 결제 번호
	public List<ReserveVO> payNumber(int res_rid);
	
	// 포인트 차감
	public int deductPayment(PaymentVO paymentVO);
	
	// 포인트 조회
	public int getMemberPoint(int mem_point);
	
	// 예약번호 조회
	public List<ReserveVO> getResRid(String mem_id);
		
	// 예약상태 확인
	public int reserveStatus(int pay_res_rid); 
		
	// 예약 금액(결제완료)
	public int getTotalPay(int pay_res_rid);
	
	// 예약 금액(결제취소)
	public int getPay(int pay_res_rid);
	
	// 예약정보 조회하기
	public List<ReserveVO> getReserveList(String mem_id);
	
	// ReserveDTO 조회하기
	public List<ReserveDTO> getReserveDTO(String mem_id);
	
	// 예약 상태 변경 (예약 취소)
	public int reserveCancel(int pay_pid);
	
	// 결제 상태 변경
	public int payCancel(int pay_pid);
	
	// 포인트 증가(환불)
	public int refundPay(PaymentVO paymentVO);
	
	// 포인트 기록 (insert)
	public int point_cost_record(PaymentVO paymentVO);
	
	// 포인트 기록 변경 (update)
	public int point_cost_update(String pay_mem_id);

}
