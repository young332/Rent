package com.kh.rent.admin.code.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.rent.admin.domain.CommonCodeVO;
import com.kh.rent.admin.domain.MenuVO;
import com.kh.rent.admin.mapper.CodeMapper;
import com.kh.rent.admin.mapper.MenuMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@Log4j
@WebAppConfiguration
public class CodeMapperTests {
	
	@Autowired
	private CodeMapper codeMapper;
	
	
	@Test
	public void testGetOneMenu() {
		
		List<CommonCodeVO> list = codeMapper.getTopCode();
		log.info("list:"+ list);
	}
	

}
