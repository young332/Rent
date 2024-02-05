package com.kh.rent.reserve.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.rent.reserve.domain.NonMemberVO;
import com.kh.rent.reserve.domain.ReserveVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@Log4j
@WebAppConfiguration
public class NonMemberMapperTests {
	@Autowired
	private NonMemberMapper nonMemberMapper;
	
	@Test
	public void nonresinsert() {
		String date1 = "2024-02-02T16:29";
		String date2 = "2024-02-03T18:30";
		NonMemberVO nonmemVO = new NonMemberVO();
		nonmemVO.setNon_rental_date(date1);
		nonmemVO.setNon_return_date(date2);
		nonmemVO.setNon_name("kim");
		nonmemVO.setNon_tel("123456789");
		nonmemVO.setNon_car_id("3");
		nonmemVO.setNon_license_birth(1990-01-01);
		nonmemVO.setNon_license_type("1종보통");
		nonmemVO.setNon_license_num("12345290");
		
		log.info("nonmemVO:" + nonmemVO);
		nonMemberMapper.nonresinsert(nonmemVO);;
		
	}

}
