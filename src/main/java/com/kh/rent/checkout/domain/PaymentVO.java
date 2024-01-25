package com.kh.rent.checkout.domain;

import oracle.sql.TIMESTAMP;

public class PaymentVO {
	private String pay_type;
	private int pay_res_rid;
	private String pay_mem_id;
	private TIMESTAMP pay_date;
	private int pay_cost;
}
