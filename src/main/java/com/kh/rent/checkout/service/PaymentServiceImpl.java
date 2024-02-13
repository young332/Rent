package com.kh.rent.checkout.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.rent.checkout.domain.PaymentDTO;
import com.kh.rent.checkout.domain.PaymentVO;
import com.kh.rent.checkout.mapper.PaymentMapper;
import com.kh.rent.reserve.domain.ReserveDTO;
import com.kh.rent.reserve.domain.ReserveVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentMapper paymentMapper; 
	
	@Override
	public int getMemberPoint(int mem_point) {
		return paymentMapper.getMemberPoint(mem_point);
	}

	
	@Transactional
	@Override
	public boolean pay(PaymentVO paymentVO) {
		// 결제 내역 기록 (insert)
		int result1 = paymentMapper.addPaymentRecord(paymentVO);
		log.info("result1: " + result1);
		
		// 결제 금액
		int result2 = paymentMapper.pay_amount(paymentVO.getPay_res_rid());
		log.info("resutl2: " + result2);
		
		// 회원 포인트 차감 (update)
		int result3 = paymentMapper.deductPayment(paymentVO);
		log.info("result3: " + result3);
		
		// 예약 상태 변경
		log.info("res_rid:" + paymentVO.getPay_res_rid());
		
		int result4 = paymentMapper.reserveStatus(paymentVO.getPay_res_rid());
		log.info("result4: " + result4);
		
		// point_cost 값 전달
		int result5 = paymentMapper.point_cost_record(paymentVO);
		log.info("result5: " + result5);
		
		return (result1 + result2 + result3 + result4 + result5) == 5 ? true : false;
	}

	@Override
	public List<ReserveVO> payNumber(int res_rid) {
		List<ReserveVO> list = paymentMapper.payNumber(res_rid);
		log.info("ReserveVO list:" + list);
		return list;
	}

	@Override
	public int getTotalPay(int pay_pid) {
		log.info("pay_pid:" + pay_pid);
		return paymentMapper.getTotalPay(pay_pid);	
	}

	@Override
	public List<ReserveVO> getReserveList(String mem_id) {
		List<ReserveVO> list = paymentMapper.getResRid(mem_id);
		return list;
	}
	
	// 예약 취소
	//여러 쿼리가 실행이 되기 때문에 하나의 단위로 동작을 위해
//	@Transactional
//	@Override
//	public boolean paymentCancel(PaymentVO paymentVO) {	
//		
//        //결제 기록 내역
//				
//		//회원 포인트 증가
//		int result1 = paymentMapper.refundPay(paymentVO);
//		log.info("result1: " + result1);
//		
//		//예약 상태 변경
//		int result2 = paymentMapper.reserveCancel(paymentVO.getPay_pid());
//		log.info("result2: " + result2);
//		
//        return (result1 + result2) == 2 ? true : false;
//	}
	
	// 결제취소로 상태변경
	@Override
	public int payCancel(int pay_pid) {
		
		int result = paymentMapper.payCancel(pay_pid);
		
		log.info("결제상태 변경: " + result);
		
		return result;
	}
	
	// 환불
	@Transactional
	@Override
	public void cancelPayAndReserveAndRefund(PaymentVO paymentVO) {
		//회원 포인트 증가
		int i1 =paymentMapper.refundPay(paymentVO);
		log.info("i1 변경: " + i1);
		//예약상태 변경
		int i2 = paymentMapper.reserveCancel(paymentVO.getPay_pid());
		log.info("i2 변경: " + i2);
		// 결제상태 변경
		int i3 = paymentMapper.payCancel(paymentVO.getPay_pid());
		log.info("i3 변경: " + i3);
		// point_cost 값 변경
		int i4 = paymentMapper.point_cost_update(paymentVO.getPay_mem_id());
		log.info("i4 변경: " + i4);
	}

	@Override
	public int getPay(int pay_res_rid) {
		return paymentMapper.getPay(pay_res_rid);	
	}

}
