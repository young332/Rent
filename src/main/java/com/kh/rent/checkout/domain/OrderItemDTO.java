package com.kh.rent.checkout.domain;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderItemDTO {
		
	//예약 번호
	private int pay_res_rid;
	
	//사용자 ID
	private String pay_mem_id;
		
	/* DB테이블 존재하지 않는 데이터*/
	
	// 상품 한 개 가격
	private int carPrice;
	
	// 할인 적용된 가격
	private int salePrice;
	
	// 총 가격
	private int totalPrice;
	

	
}
