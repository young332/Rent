package com.kh.rent.login.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

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
		String id = "MEMBER02";
		String pw = "MEMBER02";
		String name ="이순신";
		String email ="eee@eee.com";
		String birth ="19890704";
		String phone = "01098746543";
		String adress ="울산시 남구 신정동";
		int admink = 0;
		MemberVO memberVO = MemberVO.builder()
				.mem_id(id)
				.mem_pw(pw)
				.mem_name(name)
				.mem_email(email)
				.mem_birth(birth)
				.mem_phone(phone)
				.mem_adress(adress)
				.mem_adminck(admink)
				.build();
		memberService.registerPost(memberVO);
	}
	
	@Test
	public void testfindMemberId() {
		String name = "이순신";
		String email = "eee@eee.com";
		MemberVO memberVO = MemberVO.builder()
				.mem_name(name)
				.mem_email(email)
				.build();
	MemberVO memberVO2 = memberService.findMemberId(memberVO);
	log.info("memberVO2:" + memberVO2);
	}
	
	@Test
	public void testchangPassword() {
		LoginDTO loginDTO = LoginDTO.builder()
		.mem_pw("MEMBER01")
		.mem_id("MEMBER01")
		.build();
		memberService.changePassword(loginDTO);
	}	
	
}
