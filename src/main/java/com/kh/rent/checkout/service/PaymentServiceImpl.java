package com.kh.rent.checkout.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.rent.checkout.domain.PaymentDTO;
import com.kh.rent.checkout.domain.PaymentVO;
import com.kh.rent.checkout.mapper.PaymentMapper;
import com.kh.rent.login.mapper.MemberMapper;
import com.kh.rent.reserve.domain.ReserveVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentMapper paymentMapper; 
	
//	@Override
//	public boolean addPayment(PaymentDTO paymentDTO) {
//		int count = paymentMapper.addPaymentRecord(paymentDTO);
//		return (count == 1) ? true : false;
//		
//	}

	@Override
	public int getMemberPoint(int mem_point) {
		return paymentMapper.getMemberPoint(mem_point);
	}

	@Override
	public int getPayNonResRid(int pay_res_rid) {
		return paymentMapper.getPayNonResRid(pay_res_rid);
	}

	@Transactional
	@Override
	public boolean pay(PaymentVO paymentVO) {
		// 결제 내역 기록 (insert)
		int result1 = paymentMapper.addPaymentRecord(paymentVO);
		log.info("result1:" + result1);
		// 회원 포인트 차감 (update)
		int result2 = paymentMapper.deductPayment(paymentVO);
		log.info("result2:" + result2);
		// 예약 상태 변경
		log.info("res_rid:" + paymentVO.getPay_res_rid());
		
//		int result3 = paymentMapper.reserveStatus(paymentVO.getPay_res_rid());
//		log.info("result3:" + result3);
		
		return (result1 + result2 ) == 2 ? true : false;
	}


	@Override
	public List<PaymentDTO> getPaymentInfo(String pay_mem_id) {
		
		List<PaymentDTO> list = paymentMapper.getPaymentInfo(pay_mem_id);
		log.info("list:" + list);
		return list;
	}


	@Override
	public List<ReserveVO> payNumber(int res_rid) {
		List<ReserveVO> list = paymentMapper.payNumber(res_rid);
		log.info("ReserveVO list:" + list);
		return list;
	}

	@Override
	public int getTotalPay(int pay_res_rid) {
		return paymentMapper.getTotalPay(pay_res_rid);
	}

	@Override
	public List<ReserveVO> getReserveList(String mem_id) {
		List<ReserveVO> list = paymentMapper.getResRid(mem_id);
		return list;
	}
	
	// 주문취소
	@Transactional //여러 쿼리가 실행이 되기 때문에 하나의 단위로 동작을 위해
	@Override
	public boolean paymentCancel(PaymentVO paymentVO) {	
		
        //결제 기록 내역
				
		//회원 포인트 증가
		int result1 = paymentMapper.refundPay(paymentVO);
		log.info("result1: " + result1);
		
		//예약 상태 변경
		int result2 = paymentMapper.reserveStatus(paymentVO.getPay_res_rid());
		log.info("result2: " + result2);
		
        return (result1 + result2) == 2 ? true : false;
	}



}
