package com.kh.rent.reserve.mapper;


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.rent.admin.domain.CarInfoVO;
import com.kh.rent.reserve.domain.ReserveDTO;
import com.kh.rent.reserve.domain.ReserveVO;
import com.kh.rent.reserve.mapper.ReserveMapperTests;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@Log4j
@WebAppConfiguration
public class ReserveMapperTests {
	
	@Autowired
	private ReserveMapper reserveMapper;
	
	@Test
	public void testReserveInsert(){
		String date1 = "2024-02-02T16:29";
		String date2 = "2024-02-03T18:30";
		ReserveVO reserveVO = new ReserveVO();
		reserveVO.setRes_rental_date(date1);
		reserveVO.setRes_return_date(date2);
		reserveVO.setRes_car_id("3");
		reserveVO.setRes_mem_id("MEMBER02");
		reserveVO.setRes_license_type("1종보통");
		reserveVO.setRes_license_num("12345290");
		log.info("reserveVo:" + reserveVO);
		reserveMapper.reserveinsert(reserveVO);
		
		
	}
	
	@Test
	public void testGetList() {
		List<ReserveVO> list = reserveMapper.getList();
		log.info("list:"+list);
	}
	
	@Test
	public void testGetCarInfo() {
		List<CarInfoVO> carlist = reserveMapper.getCarInfo();
		log.info("carlist"+carlist);
	}
	
	@Test
	public void testSelectCheck() {
		ReserveDTO car = new ReserveDTO();
//		car.setCar_fuel("휘발유");
//		car.setCar_company("현대");
		car.setOp_carseat("Y");
		car.setOp_navi("N");
		
		List<ReserveDTO> list = reserveMapper.selectCheck(car);
		log.info("list"+list);
	}
	@Test
	public void testFindByCindex() {
		int car_index=3;
		ReserveDTO rserveDto =reserveMapper.findByCindex(car_index);
		log.info("rserveDto:"+rserveDto);
	}
	
	@Test
	public void testGetPosCar() {
		List<CarInfoVO> list = reserveMapper.getPosCar();
		log.info("carpos:"+list);
	}
	
}
