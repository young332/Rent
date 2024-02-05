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
	private String topBookPickDate;
	private String topBookOffDate;
	private String carIndex;
	private String totalPay;
}
