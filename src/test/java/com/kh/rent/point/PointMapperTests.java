package com.kh.rent.point;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.rent.point.domain.PointVO;
import com.kh.rent.point.mapper.PointMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/*.xml"})
@Log4j
@WebAppConfiguration
public class PointMapperTests {
	
	@Autowired
	private PointMapper pointMapper;
	
	@Test
	public void testInsert() {
		Date day = new Date();
		PointVO pointVO = PointVO.builder()
				.point_id(200)
				.point_user_id("MEMBER01")
				.point_code("POINT_J")
				.point_use_date(day)
				.point_cost(10)
				.build();
		pointMapper.insertPoint(pointVO);
		log.info("pointVO"+pointVO);
		
	}
	
//	@Test
//	public void testPointList() {
//		List<PointVO> list = PointMapper
//		log.info("list" + list);
//	}


}
