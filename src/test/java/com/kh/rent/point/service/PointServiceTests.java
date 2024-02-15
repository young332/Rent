package com.kh.rent.point.service;

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
public class PointServiceTests {
	
	@Autowired
	private PointService pointService;
	
	// 포인트 전체 조회하기(한사람)
	@Test
	public void testGetPointList() {
		String mem_id = "ADTEST";
		List<PointDTO> pointDTOList = pointService.getPointList(mem_id);
		log.info(pointDTOList);
	}
	
	// 포인트 충전
	@Test
	public void testAddPoint() {
		MemberVO memberVO = MemberVO.builder()
				.mem_id("MEMBER05")
				.mem_point(10000)
				.build();
		int result = pointService.addPoint(memberVO);
		log.info("addPointResult:" + result);
	}
	
	// 포인트 내역 기록
	@Test
	public void testAddPointTable() {
		PointVO pointVO = PointVO.builder()
				.point_user_id("MEMBER05")
				.point_code("POINT_C")
				.point_cost(20000)
				.build();
		int result = pointService.addPointTable(pointVO);
		log.info("addPointTableResult:" + result);
	}
	
	// 갱신 포인트 조회
	@Test
	public void testGetMemPoint() {
		String mem_id = "MEMBER05";
		int memPoint = pointService.getMemPoint(mem_id);
		log.info("memPoint:" + memPoint);
	}
}
