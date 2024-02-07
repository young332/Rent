package com.kh.rent.admin.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DelMemberVO {
	
	private String del_id;
	private String del_name;
	private String del_adminck;
	private String del_email;
	private String del_birth;
	private String del_phone;
	private String del_addr;
	private Timestamp del_ddate;
	private Integer del_point;
	

}




