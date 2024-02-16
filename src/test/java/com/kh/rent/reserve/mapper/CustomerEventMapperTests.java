package com.kh.rent.reserve.mapper;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.rent.admin.domain.PointDTO;
import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.point.domain.PointVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@Log4j
@WebAppConfiguration
public class CustomerEventMapperTests {
	@Autowired
	private CustomerEventMapper customerEventMapper;
	
	
//	@Test
//	public void addEventPointTest() {
//		MemberVO memberVO = MemberVO.builder()
//				.mem_id("marutaeng")
//				.mem_point(10000)
//				.build();
//		
//		int result = customerEventMapper.addEventPoint(memberVO);
//		log.info("addEventPointResult:" + result);
//	}
//	
//	
//	@Test
//	public void testAddPointTable() {
//		PointVO pointVO = PointVO.builder()
//				.point_user_id("marutaeng")
//				.point_code("POINT_E")
//				.point_cost(10000)
//				.build();
//		int result = customerEventMapper.addPointTable(Map<String, Object> pointMap);
//		log.info("addPointTableResult:" + result);
//	}
	
	@Test
	public void testSelectPoint() {
		String mem_id ="marutaeng";
		
		int result =customerEventMapper.selectPoint(mem_id);
		log.info("result:"+result);
		
	}
}
