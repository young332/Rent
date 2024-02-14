package com.kh.rent.point.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.point.domain.PointDTO;
import com.kh.rent.point.domain.PointVO;
import com.kh.rent.point.mapper.PointMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class PointServiceImpl implements PointService {
	
	@Autowired
    private PointMapper pointMapper;
	
	// 포인트 전체 조회하기(한사람)
	@Override
	public List<PointDTO> getPointList(String mem_id) {
		List<PointDTO> pointDTOList = pointMapper.getPointList(mem_id);
		log.info(pointDTOList);
		return pointDTOList;
	}

	// 포인트 충전
	@Override
	public int addPoint(MemberVO memberVO) {
		int result = pointMapper.addPoint(memberVO);
		return result;
	}

	// 포인트 내역 기록
	@Override
	public int addPointTable(PointVO pointVO) {
		int result = pointMapper.addPointTable(pointVO);
		return result;
	}

	// 갱신 포인트 조회
	@Override
	public int getMemPoint(String mem_id) {
		int newMemPoint = pointMapper.getMemPoint(mem_id);
		return newMemPoint;
	}
	
}
