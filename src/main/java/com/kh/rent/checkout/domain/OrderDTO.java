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
public class OrderDTO {
	
	/* 회원 */
	
	// 예약번호
	private int pay_res_rid;
	
	// 예약자
	private String res_mem_id;
	
	// 회원ID (mem_id)
	private String mem_id;
	
	// 대여일 RES_RENTAL_DATE
	private Date res_rental_date;
	
	// 반납일 RES_RETURN_DATE
	private Date res_return_date; 
		
	// 소형, 중형 (TBL_CAR_INFO - CAR_SIZE)
	private String car_size; 
	
	// 면허타입 (몇 종) RES_LICENSE_TYPE
	private String res_license_type;
	
	// 생년월일 MEM_BIRTH
	private String mem_birth;
		
	
	/* 비회원 */
	
	// 비회원 이름 NON_NAME
	private String non_name;

	// 대여일 NON_RENTAL_DATE
	private Date non_rental_date;
	
	// 반납일 NON_RETURN_DATE
	private Date non_return_date;
	
	// 면허타입 (몇 종) NON_LICENSE_TYPE
	private	String non_license_type;
	
	// 비회원 생년월일 NON_LICENSE_BIRTH
	private int non_license_birth;
	
	//결제 일시
	private Date pay_date;
	
	/* 금액 관련 */
	
	//결제 타입
	private String pay_type;
	
	// 사용 포인트
	private int point_cost;
	
	// 최종 판매 비용 (소비자가 결제하는 최종비용)
	private int pay_cost;
	
	/*DB에 없는 데이터*/
	// 판매가
	private int orderSalePrice;
	
	// 최종 비용 (판매가-포인트)
	public void getOrderPriceInfo() {
		pay_cost = orderSalePrice - point_cost;
	}

}
