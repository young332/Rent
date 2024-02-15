package com.kh.rent.point.mapper;

import java.util.List;

import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.point.domain.PointDTO;
import com.kh.rent.point.domain.PointVO;

public interface PointMapper {
	
	// 포인트 전체 조회하기(한사람)
	public List<PointDTO> getPointList(String mem_id);
	
	// 포인트 충전
	public int addPoint(MemberVO memberVO);
	
	// 포인트 내역 기록
	public int addPointTable(PointVO pointVO);
	
	// 갱신 포인트 조회
	public int getMemPoint(String mem_id);
	
};
