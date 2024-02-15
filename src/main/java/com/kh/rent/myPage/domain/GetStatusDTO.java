 package com.kh.rent.myPage.domain;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class GetStatusDTO {
	private Integer res_rid;
	private String res_rental_date;
	private String res_return_date;
	private String res_car_id;
	private String res_mem_id;
	private Date res_modi_date;
	private String res_license_type;
	private String res_license_num;
	private Integer res_totalpay;
	private String res_status;
	private String pay_status;
	private int pay_pid;
	// 이미지
	private String car_name;
	private int file_id;
    private String unique_file_nm;
}
