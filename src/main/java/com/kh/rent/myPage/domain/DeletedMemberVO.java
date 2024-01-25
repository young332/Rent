package com.kh.rent.myPage.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import oracle.sql.TIMESTAMP;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class DeletedMemberVO {

	private String del_id;
	private String del_name;
	private String del_email;
	private String del_birth;
	private String del_phone;
	private String del_zip_code;
	private String del_addr;
	private String del_cdate;
	private TIMESTAMP del_ddate;
	private Integer del_point;
	private Integer del_adminck;
}
