package com.kh.rent.checkout.domain;

import java.util.Date;

import com.kh.rent.login.domain.MemberVO;

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
	
	// 예약 상태
	
	// 사용 포인트
	private int point_cost;

	// 회원 포인트
	private int mem_point;
	
	// 예약 날짜
	private Date res_rental_date;

	// 결제 고유 번호 (PK)
	private int pay_pid;
			
	// 결제 번호 (FK)
	private int pay_res_rid;
	
	// 사용자 ID(FK)
	private String pay_mem_id;
	
	//결제일시
	private Date pay_date;
	
	// 결제 타입
	private String pay_type;
	
	// 총 금액
	private int res_totalpay;
	
}
