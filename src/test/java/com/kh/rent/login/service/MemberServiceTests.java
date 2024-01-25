package com.kh.rent.login.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.rent.login.domain.FindIdDTO;
import com.kh.rent.login.domain.LoginDTO;
import com.kh.rent.login.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@Log4j
@WebAppConfiguration
public class MemberServiceTests {
	
	@Autowired
	private MemberService memberService;
	
	@Test
	public void testLogin() {
		String id = "MEMBER02";
		String pw = "MEMBER02";
		LoginDTO loginDTO = LoginDTO.builder()
				.mem_id(id)
				.mem_pw(pw)
				.build();
		MemberVO memberVO = memberService.login(loginDTO);
		 log.info("memberVO: " + memberVO);
	}

	@Test
	public void testInsert() {
		String id = "MEMBER04";
		String pw = "MEMBER04";
		String name ="안소희";
		String email ="ttt@ttt.com";
		String birth ="19920202";
		String phone = "01074128521";
		String code = "8521";
		String addr ="울산시 남구 대현동";
		MemberVO memberVO = MemberVO.builder()
				.mem_id(id)
				.mem_pw(pw)
				.mem_name(name)
				.mem_email(email)
				.mem_birth(birth)
				.mem_phone(phone)
				.mem_zip_code(code)
				.mem_addr(addr)
				.build();
		memberService.registerPost(memberVO);
	}
	
	@Test
	public void testfindMemberId() {
		String name = "강감찬";
		String phone = "01032143214";
		FindIdDTO dto1 = FindIdDTO.builder()
				.mem_name(name)
				.mem_phone(phone)
				.build();
	String findId = memberService.findMemberId(dto1);
	log.info("findId:" + findId);
	}
	
	@Test
	public void testchangPassword() {
		LoginDTO loginDTO = LoginDTO.builder()
		.mem_pw("MEMBER01")
		.mem_id("MEMBER01")
		.build();
		memberService.changePassword(loginDTO);
	}	
	
	@Test
	public void testCheckId() {
		String mem_id = "MEMBER01";
		int count = memberService.checkId(mem_id);
		log.info("count:" + count);
	}
	
}
