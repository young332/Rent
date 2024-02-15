package com.kh.rent.point.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.point.domain.PointDTO;
import com.kh.rent.point.domain.PointVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@Log4j
@WebAppConfiguration
public class PointMapperTests {
	
	@Autowired
	private PointMapper pointMapper;
	
	// 포인트 전체 조회하기(한사람)
	@Test
	public void testGetPointList() {
		String mem_id = "ADTEST";
		List<PointDTO> pointDTOList = pointMapper.getPointList(mem_id);
		log.info(pointDTOList);
	}
	
	// 포인트 충전
	@Test
	public void testAddPoint() {
		MemberVO memberVO = MemberVO.builder()
				.mem_id("MEMBER05")
				.mem_point(10000)
				.build();
		int result = pointMapper.addPoint(memberVO);
		log.info("addPointResult:" + result);
	}
	
	// 포인트 내역 기록
	@Test
	public void testAddPointTable() {
		PointVO pointVO = PointVO.builder()
				.point_user_id("MEMBER05")
				.point_code("POINT_P")
				.point_cost(-10000)
				.build();
		int result = pointMapper.addPointTable(pointVO);
		log.info("addPointTableResult:" + result);
	}
	
	// 갱신 포인트 조회
	@Test
	public void testGetMemPoint() {
		String mem_id = "MEMBER05";
		int memPoint = pointMapper.getMemPoint(mem_id);
		log.info("memPoint:" + memPoint);
	}
	
	
	
	
//	// 포인트 지급 관련 한 테스트 (추후)
//	@Test
//	public void testInsert() {
//		Date day = new Date();
//		PointVO pointVO = PointVO.builder()
//				.point_user_id("MEMBER01")
//				.point_code("POINT_J")
////				.point_use_date(day)
//				.point_cost(10)
//				.build();
//		pointMapper.insertPoint(pointVO);
//		log.info("pointVO"+pointVO);
//		
//	}
//	
//	//포인트 차감
//	@Test
//	public void testUpdate() {
//		Date day = new Date();
//		PointVO pointVO = PointVO.builder()
//				.point_user_id("MEMBER01")
//				.point_code("POINT_J")
////				.point_use_date(day)
//				.point_cost(-10)
//				.build();
//		pointMapper.updatePoint(pointVO);
//		log.info("pointVO"+pointVO);
//		
//	}

}
