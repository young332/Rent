package com.kh.rent.admin.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MenuVO {
	private String menu_id;
	private String parent_menu_id;
	private Integer menu_type;
	private String menu_name;
	private Integer menu_depth;
	private String menu_url;
	private Integer orderby;
	private String use_yn;
}
