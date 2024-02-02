package com.kh.rent.login.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CheckPhoneDTO {

	private String mem_phone;
	private int mem_randomnumber;
	
	

}
