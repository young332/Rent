package com.kh.rent.admin.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.rent.admin.domain.Search;
import com.kh.rent.admin.menu.mapper.MenuMapperTests;

import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@Log4j
@WebAppConfiguration
public class AdMemberServiceTest {
	
	@Autowired
	private AdMemberService adMemberService;

	//검색기능 
	@Test
	public void search() {
		Search search = new Search("N", "하");
		
		adMemberService.selectAllMember(search);
	}

}
