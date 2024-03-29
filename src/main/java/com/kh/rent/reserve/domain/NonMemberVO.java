package com.kh.rent.reserve.domain;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class NonMemberVO {
	private Integer non_rid;
	private String non_name;
	private String non_tel;
	private String non_car_id;
	private String non_rental_date;
	private String non_return_date;
	private String non_license_num;
	private String non_license_type;
	private String non_license_birth;
	private String non_status;
	private Integer non_totalpay;
}
