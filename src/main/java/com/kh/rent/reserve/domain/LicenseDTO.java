package com.kh.rent.reserve.domain;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class LicenseDTO {
	private String mem_id;
	private String mem_name;
	private String mem_birth;
	private String res_license_type;
	private String res_license_num;
	private String non_license_num;
	private String non_license_type;
	private Integer non_license_birth;
	private String non_name;
	private String non_tel;
	
}
