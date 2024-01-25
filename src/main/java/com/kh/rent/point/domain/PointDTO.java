package com.kh.rent.point.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PointDTO {
	
	private String point_user_Id;
    private String point_code;
    private Date point_use_date;
    private int point_cost;

}
