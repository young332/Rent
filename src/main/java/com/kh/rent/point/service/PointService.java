package com.kh.rent.point.service;

import java.util.Map;

import com.kh.rent.point.domain.PointVO;

public interface PointService {

	public int insertPoint(PointVO pointVO);
	public void updatePoint(Map<String, Object> map);
}
