package com.kh.rent.checkout.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.rent.admin.domain.CarInfoVO;
import com.kh.rent.checkout.domain.PaymentDTO;
import com.kh.rent.checkout.mapper.PaymentMapper;
import com.kh.rent.reserve.domain.LicenseDTO;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentMapper paymentMapper; 

	@Override
	public PaymentDTO getPaymentDTO(int pay_res_rid) {
		
		return paymentMapper.getPaymentInfo(pay_res_rid);
	}

	
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
	public List<LicenseDTO> getResRid() {
		
	List<LicenseDTO> list = paymentMapper.getResRid(); 	
				
	return list;

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
	public void getPaymentInfo(PaymentDTO paymentDto) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public List<PaymentDTO> payNumber() {
		return paymentMapper.payNumber();
	}

}
