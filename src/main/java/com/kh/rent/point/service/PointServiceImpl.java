package com.kh.rent.point.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.rent.point.domain.PointVO;
import com.kh.rent.point.mapper.PointMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class PointServiceImpl implements PointService {
	
	@Autowired
    private PointMapper pointMapper;
	
	@Override
	public void insertPoint(PointVO pointVO) {
		pointMapper.insertPoint(pointVO);
		
	}

	@Override
	public boolean updatePoint(PointVO pointVO) {
		
		int currentTotalPoints = pointMapper.updatePoint(pointVO);
        
		if (currentTotalPoints == 1) {
			
			return true;
		}
		pointMapper.updatePoint(pointVO);
		
		return false;
		
	}
	

}
