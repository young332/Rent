package com.kh.rent.login.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {

	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_email;
	private String mem_birth;
	private String mem_phone;
	private String mem_zip_code;
	private String mem_addr;
	private Date mem_cdate;
	private Date mem_udate;
	private Integer mem_point;
	private Integer mem_adminck;
}
