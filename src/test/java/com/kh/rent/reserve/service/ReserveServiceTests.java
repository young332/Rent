package com.kh.rent.reserve.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.rent.admin.domain.CarInfoVO;
import com.kh.rent.reserve.domain.ReserveVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@Log4j
@WebAppConfiguration
public class ReserveServiceTests {
	
	@Autowired
	private ReserveService reserveService;
	
	@Test
	public void testReserveInsert() {
		String date1 = "2024-02-02T16:29";
		String date2 = "2024-02-03T18:30";
		ReserveVO reserveVO = ReserveVO.builder()
				.res_car_id("4")
				.res_license_num("789456123")
				.res_license_type("2종보통")
				.res_rental_date(date2)
				.res_return_date(date2)
				.res_mem_id("MEMBER04")
				.build();
		log.info("reserveVo:" + reserveVO);
		reserveService.reserveinsert(reserveVO);
		
	};
	
	@Test
	public void testGetList() {
		List<ReserveVO> list = reserveService.getList();
		log.info("list:"+list);
	}
	
	@Test
	public void testGetPosCar() {
		List<CarInfoVO> list = reserveService.getPosCar();
		log.info("carpos:"+list);
	}
	
}
