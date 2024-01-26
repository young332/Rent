package com.kh.rent.admin.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class CarInfoVO {
	private String car_index;
	private String car_name;
	private String car_company;
	private String car_size;
	private String op_carseat;
	private String op_navi;
	private String op_bt;
	private String op_cam;
	private String crate_user;
	private Date crate_date;
	private String update_user;
	private Date update_date;
	
}
