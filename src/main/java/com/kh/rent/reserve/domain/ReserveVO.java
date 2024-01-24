package com.kh.rent.reserve.domain;

import java.sql.Date;

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
	private Date res_rental_date;
	private Date res_return_date;
	private String res_car_id;
	private String res_mem_id;
	private Date res_modi_date;
}
