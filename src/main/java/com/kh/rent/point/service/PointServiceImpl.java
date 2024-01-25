package com.kh.rent.point.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.rent.point.domain.PointDTO;
import com.kh.rent.point.domain.PointVO;
import com.kh.rent.point.mapper.PointMapper;

import lombok.extern.log4j.Log4j;


//public class PointServiceImpl implements PointService {
//	
//	@Autowired
//	private PointMapper pointMapper;
//
//	@Override
//	public void updatePoint(Map<String, Object> map) {
//		
//		PointVO pointVO = (PointVO)map.get("pointVO");
//		@SuppressWarnings("unchecked")
//		Map<String, Object> pointMap = (Map<String, Object>)map.get("pointMap");
//		int count = pointMapper.updatePoint(map);
//		Map<String, Object> Map = new HashMap<>();
//		map.put("POINT_COST", -5);
//		count += pointMapper.updatePoint(map);
//		if (count == 2) {
//			PointDTO pointDTO = pointMapper.selectById(msg_id);
//			return pointDTO;
//		}
//		
//		log.info("count:"+ count);
//		
//		return null;
//	}
//
//	@Override
//	public int insertPoint(PointVO pointVO) {
//		
//		int count = pointMapper.insertPoint(pointVO);
//		Map<String, Object> map = new HashMap<>();
//		map.put("ppoint", 5);
//		map.put("mid", mid);
//		count += memberMapper.updatePoint(map);
//		if (count == 2) {
//			ReadMessageDTO readMessageDTO = messageMapper.selectById(msg_id);
//			return readMessageDTO;
//		}
//		
//		log.info("count:"+ count);
//		
//		return null;
//		return 0;
//	}
//
//}
