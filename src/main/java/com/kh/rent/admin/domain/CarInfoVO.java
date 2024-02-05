package com.kh.rent.admin.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class CarInfoVO {
	
	private Integer car_index;
	private String car_name;
	private String car_number;
	private String car_company;
	private String car_size;
	private String car_fuel;
	private String op_carseat;
	private String op_navi;
	private String op_bt;
	private String op_cam;
	private String create_user;
	private Timestamp create_date;
	private String update_user;
	private Timestamp update_date;
	private Integer car_cost;
	private int file_id;
	private String file_stre_cours;
	private String orignl_file_nm;
	private String unique_file_nm;
	private String use_yn;
	
}
