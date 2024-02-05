package com.kh.rent.checkout.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PaymentItemDTO {
	
	// 사용자 ID
	private String pay_mem_id;
	
	// 예약 날짜
	private Date pay_date;
	
	// 결제 타입
	private String pay_type;
	
	// 예약 번호
	private int res_rid;
	
	// 총 가격
	private int res_totalpay;
	
	
	
}
