package com.kh.rent.login.mapper;

import java.util.List;

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
public class MemberMapperTests {
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Test //회원가입
	public void  testInsert() {
		String id = "MEMBER01";
		String pw = "MEMBER01";
		String name ="강감찬";
		String email ="www@www.com";
		String birth ="20201212";
		String phone = "01032143214";
		String adress ="울산시 남구 삼산동";
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
		int result = memberMapper.registerPost(memberVO);
		log.info("result:" + result);
	
	}
	
	@Test
	public void testLogin() {
		String mem_id = "MEMBER01";
		String mem_pw = "MEMBER01";
		LoginDTO loginDTO = LoginDTO.builder()
				.mem_id(mem_id)
				.mem_pw(mem_pw)
				.build();
		MemberVO memberVO = memberMapper.login(loginDTO);
		log.info("memberVO:" + memberVO);
	}
	
	@Test //조회
	public void testgetList() {
		List<MemberVO> list = memberMapper.getList();
		log.info("list:" + list);
	}
	
	@Test //아이디찾기
	public void testfindMemberId() {
		String name = "강감찬";
		String phone = "01032143214";
		FindIdDTO findIdDTO = FindIdDTO.builder()
				.mem_name(name)
				.mem_phone(phone)
				.build();
		String find_id = memberMapper.findMemberId(findIdDTO);
		log.info("find_id:" + find_id);
		
	}
	
	@Test
	public void testchangPassword() {
		LoginDTO loginDTO = LoginDTO.builder()
		.mem_pw("MEMBER01")
		.mem_id("MEMBER01")
		.build();
		int result = memberMapper.changePassword(loginDTO);
		log.info("result:" + result);
	}
}
