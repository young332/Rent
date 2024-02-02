 package com.kh.rent.reserve.domain;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReserveVO {
	private Integer res_rid;
	private String res_rental_date;
	private String res_return_date;
	private String res_car_id;
	private String res_mem_id;
	private Date res_modi_date;
	private String res_license_type;
	private String res_license_num;
	private Integer res_pay_pid;
	private Integer res_totalpay;
}
