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
public class PaymentVO {

		private String pay_type;	
		private int pay_res_rid;
		private String pay_mem_id;
		private Date pay_date;
		private int pay_cost;
		private int salePrice;
		private int totalPrice;
		

}
