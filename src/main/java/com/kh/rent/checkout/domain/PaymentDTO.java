package com.kh.rent.checkout.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PaymentDTO {
	
	private String car_name;
    private String car_company;
    private String car_size;
    private String car_fuel;
    private String op_carseat;
    private String op_navi;
    private String op_bt;
    private String op_cam;
    private Integer car_cost;
	
	
}
