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
public class PointVO {
	private int point_id;
	private String point_user_id;
	private String point_code;
	private Timestamp point_use_date;
	private int point_cost;
}
