package com.kh.rent.admin.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CommonCodeVO {
	
	private String code_id;
	private String parent_code_id;
	private Integer code_depth;
	private String code_name;
	private String use_yn;
	private Integer orderby;
	private String ref_1;
	private String ref_2;
	private String update_user;
	private Date update_date;
	

}
