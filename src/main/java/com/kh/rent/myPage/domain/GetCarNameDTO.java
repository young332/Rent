package com.kh.rent.myPage.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GetCarNameDTO {

	private Integer res_rid;
	private String res_car_id;
}
