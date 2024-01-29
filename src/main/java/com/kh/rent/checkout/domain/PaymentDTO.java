package com.kh.rent.checkout.domain;

import java.sql.Date;

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
	
	private MemberVO memberVO;
	private int pay_res_rid;
	private String pay_mem_id;
	private Date pay_date;
	private int pay_cost;
	private int point_id;
	private String point_user_id;
	private String point_code;
	private Date point_use_date;
	private int point_cost;

}
