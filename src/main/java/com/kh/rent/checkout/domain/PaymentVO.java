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
		
		@Override
		public String toString() {
			return "PaymentVO [pay_type=" + pay_type + ", pay_res_rid=" + pay_res_rid + ", pay_mem_id=" + pay_mem_id
					+ ", pay_date=" + pay_date + ", pay_cost=" + pay_cost + ", salePrice=" + salePrice + ", totalPrice="
					+ totalPrice + ", toString()=" + super.toString() + "]";
		}
		
		public void initSaleTotal() {
			this.salePrice = (int) (this.pay_cost * 1);
			this.totalPrice = this.salePrice;
			
		}
		

}
