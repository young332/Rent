package com.kh.rent.point.mapper;

import java.util.Map;

import com.kh.rent.point.domain.PointVO;

public interface PointMapper {
	
	public int insertPoint(PointVO pointVO);
	public int updatePoint(Map<String, Object> map);
};
