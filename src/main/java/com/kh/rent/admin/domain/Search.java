package com.kh.rent.admin.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class Search {
	
	//검색
	private String type; //검색조건 (이름, 아이디)
	private String keyword; //검색어(사용자 입력)
	


}
