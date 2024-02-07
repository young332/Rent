package com.kh.rent.checkout.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PaymentDTO {
	
	// 예약 번호
	private int res_rid;
	
	// 예약자
	private String mem_name;
	
	// 예약 회원 아이디
	private String mem_id;
	
	// 사용 포인트
	private int point_cost;

	// 회원 포인트
	private int mem_point;
	
	// 총 금액
	private int res_totalpay;
	
	private String pay_mem_id;
	
	private String pay_type;
	
	private Date pay_date;
	
	
}
