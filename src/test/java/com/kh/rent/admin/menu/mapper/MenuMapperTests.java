package com.kh.rent.admin.menu.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.rent.admin.domain.MenuVO;
import com.kh.rent.admin.mapper.MenuMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@Log4j
@WebAppConfiguration
public class MenuMapperTests {
	
	@Autowired
	private MenuMapper menuMapper;
	
	
	@Test //상위메뉴 등록
	public void  testTopMenuInsert() {
		String menu_id = "Menu002";
		String parent_menu_id = "@";
		Integer menu_type = 1;
		String menu_name = "통계";
		Integer menu_depth = 1;
		String menu_url = "/admin/menu/statistics";
		Integer orderby = 2;
		String useyn = "Y";
		
		MenuVO menuVO = MenuVO.builder()
				.menu_id(menu_id)
				.parent_menu_id(parent_menu_id)
				.menu_type(menu_type)
				.menu_name(menu_name)
				.menu_depth(menu_depth)
				.menu_url(menu_url)
				.orderby(orderby)
				.use_yn(useyn)
				.build();
		int count = menuMapper.insertMenu(menuVO);
		if(count == 1) {
			log.info("seccess");
		}
	}
	
	@Test
	public void testGetOneMenu() {
		String menu_id = "MENU001";
		MenuVO menuVO = menuMapper.getOneMenu(menu_id);
		log.info("menuVO:"+menuVO);
	}
	

}
