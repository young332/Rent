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
	
	private String mem_id;
	
	private int res_rid;
	
	private int mem_point;
	
	// 결제 고유 번호 (PK)
	private int pay_pid;
			
	// 결제 번호 (FK)
	private int pay_res_rid;
	
	//사용자ID(FK)
	private String pay_mem_id;
	
	//결제일시
	private Date pay_date;
	
	//결제금액 (사용자 요청 금액) - 최종 판매 금액
	private int pay_cost;
	
	// 포인트 아이디 (시퀀스)
	private int point_id;
	
	// 사용자 ID (FOREIGN KEY (POINT_USER_ID) references TBL_MEMBER(MEM_ID))
	private String point_user_id;
	
	// 포인트 코드
	private String point_code;
	
	// 결제 날짜
	private Date point_use_date;
	
	// 사용 포인트
	private int point_cost;
	
	// 결제 타입
	private String pay_type;
	
	// 총 금액
	private int res_totalpay;
	
	
	
}
