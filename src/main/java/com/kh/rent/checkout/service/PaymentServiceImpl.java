package com.kh.rent.checkout.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.rent.admin.domain.CarInfoVO;
import com.kh.rent.checkout.domain.PaymentDTO;
import com.kh.rent.checkout.domain.PaymentVO;
import com.kh.rent.checkout.mapper.PaymentMapper;
import com.kh.rent.reserve.domain.LicenseDTO;
import com.kh.rent.reserve.domain.ReserveVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentMapper paymentMapper; 
	
<<<<<<< HEAD
	@Override
	public boolean addPayment(PaymentDTO paymentDTO) {
		int count = paymentMapper.addPaymentRecord(paymentDTO);
		return (count == 1) ? true : false;
		
	}
=======
//	@Override
//	public boolean addPayment(PaymentVO paymentVO) {
//		int count = paymentMapper.addPaymentRecord(paymentVO);
//		return (count == 1) ? true : false;
//		
//	}

//	@Override
//	public int deductPayment(PaymentDTO paymentDTO) {
//		
//		return paymentMapper.deductPayment(PaymentDTO paymentDTO);
//		
//	}
//	
>>>>>>> branch 'simyoon' of https://github.com/young332/Rent.git

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
	public boolean pay(PaymentDTO paymentDto) {
		// 결제 내역 기록 (insert)
		int result1 = paymentMapper.addPaymentRecord(paymentDto);
		// 회원 포인트 차감 (update)
		int result2 = paymentMapper.deductPayment(paymentDto);
		// 예약 상태 변경
		int result3 = paymentMapper.reserveStatus(paymentDto);
		
		return (result1 + result2 + result3) == 3 ? true : false;
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
	public List<ReserveVO> getResRid(String mem_id) {
		List<ReserveVO> list = paymentMapper.getResRid(mem_id);
		return list;
	}



}
