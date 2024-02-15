package com.kh.rent.reserve.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.rent.reserve.mapper.CustomerEventMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class CustomerEventServiceImpl implements CustomerEventService{
	
	@Autowired
	private CustomerEventMapper customerEventMapper;


//	@Override
//	public int addPointTable(PointVO pointVO) {
//		int result = customerEventMapper.addPointTable(pointVO);
//		return result;
//	}
//
//	@Override
//	public int addEventPoint(MemberVO memberVO) {
//		int result = customerEventMapper.addEventPoint(memberVO);
//		return result;
//	}

	@Override
	public int selectPoint(String mem_id) {
		int result =customerEventMapper.selectPoint(mem_id);
		return result;
	}

	@Transactional
	@Override
	public boolean addPointOfEvent(Map<String, Object> pointMap) {
//		int point_cost = (int)pointMap.get("point_cost");
//		String point_code = (String)pointMap.get("point_code");
//		String mem_id = (String)pointMap.get("mem_id");
		
//		Map<String, Object> paramMap = new HashMap<>();
//		paramMap.put("mem_id", mem_id);
//		paramMap.put("point_cost", point_cost);
		int result1 = customerEventMapper.addEventPoint(pointMap);
		int result2 = customerEventMapper.addPointTable(pointMap);
		log.info("result1:" + result1);
		log.info("result1:" + result2);
		return (result1 + result2) > 0 ? true : false;
	}

	
	
	
}
