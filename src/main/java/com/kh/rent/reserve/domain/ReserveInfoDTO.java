package com.kh.rent.reserve.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReserveInfoDTO {
	private String top_book_pick_date;
	private String top_book_off_date;
	private String car_index;
	private String totalPay;
}
