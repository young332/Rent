package com.kh.rent.admin.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class PointDTO {
	
	private Integer point_id;
	private String point_user_id;
	private String point_code;
	private String point_code_name;
	private Timestamp point_use_date;
	private Integer point_cost;

}
