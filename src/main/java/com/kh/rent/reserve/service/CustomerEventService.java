package com.kh.rent.reserve.service;

import java.util.Map;


public interface CustomerEventService {
	//포인트조회
	public int selectPoint(String mem_id);
	
	//이벤트 포인트 충전
//	public int addEventPoint(MemberVO memberVO);
		
	// 포인트 내역 기록
//	public int addPointTable(PointVO pointVO);
	
	//이벤트 포인트 지급 트랜지션
	public boolean addPointOfEvent(Map<String, Object> pointMap);
}
