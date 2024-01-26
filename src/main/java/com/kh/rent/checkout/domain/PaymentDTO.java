package com.kh.rent.checkout.domain;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class PaymentDTO {
	
	//결제 타입
	private String pay_type;	
	//예약 번호
	private int pay_res_rid;
	//사용자 ID
	private String pay_mem_id;
	//결제 일시
	private Date pay_date;
	//결제 금액
	private int pay_cost;
	
	/* DB테이블 존재하지 않는 데이터*/
	
	// 할인 적용된 가격
	private int salePrice;
	
	// 총 가격
	private int totalPrice;
	
	
}
