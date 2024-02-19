package com.kh.rent.point.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PointDTO {
	private Integer rowNum;
	private Integer point_id;
	private String point_user_id;
	private String point_code;
	private String code_name;
	private Timestamp point_use_date;
	private Integer point_cost;
	private Integer mem_point;
	private String point_section;
}
