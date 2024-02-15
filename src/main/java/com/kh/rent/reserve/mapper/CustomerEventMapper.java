package com.kh.rent.reserve.mapper;

import java.util.Map;


public interface CustomerEventMapper {
	
	
	//이벤트 포인트 충전
	public int addEventPoint(Map<String, Object> paramMap);
	
	// 포인트 내역 기록
	public int addPointTable(Map<String, Object> pointMap);
	
	//포인트 조회
	public int selectPoint(String mem_id);
}
