package com.kh.rent.point.mapper;

import com.kh.rent.point.domain.PointVO;

public interface PointMapper {
	
	public int insertPoint(PointVO pointVO);
	public int updatePoint(PointVO pointVO);
	//포인트 조회 기능
	public int pointList(String point_user_Id);
	
};
