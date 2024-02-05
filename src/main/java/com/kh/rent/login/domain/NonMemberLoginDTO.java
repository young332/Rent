package com.kh.rent.login.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NonMemberLoginDTO {
	
	private String non_name;
	private String non_tel;
	
}
