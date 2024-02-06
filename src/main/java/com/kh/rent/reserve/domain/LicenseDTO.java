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
	private String mem_phone;
	private String res_license_type;
	private String res_license_num;
	
}
