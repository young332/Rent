package com.kh.rent.checkout.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.rent.admin.domain.CarInfoVO;
import com.kh.rent.checkout.domain.PaymentDTO;
import com.kh.rent.checkout.mapper.PaymentMapper;
import com.kh.rent.reserve.domain.LicenseDTO;
import com.kh.rent.reserve.domain.ReserveVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentMapper paymentMapper; 
	
	@Override
	public boolean addPayment(PaymentDTO paymentDTO) {
		int count = paymentMapper.addPaymentRecord(paymentDTO);
		return (count == 1) ? true : false;
		
	}

//	@Override
//	public PaymentDTO getPaymentDTO(int pay_res_rid) {
//		
//		return paymentMapper.getPaymentInfo(pay_res_rid);
//	}

	
//	@Override
//	public int deductPayment(PaymentDTO paymentDTO) {
//		
//		return paymentMapper.deductPayment(PaymentDTO paymentDTO);
//		
//	}
//	

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
	public void pay(PaymentDTO paymentDto) {
		// 결제 내역 기록 (insert)
		paymentMapper.addPaymentRecord(paymentDto);
		// 회원 포인트 차감 (update)
		paymentMapper.deductPayment(paymentDto);
	}


	@Override
	public List<PaymentDTO> getPaymentInfo(String res_mem_id) {
		
		List<PaymentDTO> list = paymentMapper.getPaymentInfo(res_mem_id);
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
	public List<ReserveVO> getResRid() {
		List<ReserveVO> list = paymentMapper.getResRid();
		return list;
	}



}
