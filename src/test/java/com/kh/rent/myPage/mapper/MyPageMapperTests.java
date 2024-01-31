package com.kh.rent.myPage.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.myPage.domain.PWchangeDTO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@Log4j
@WebAppConfiguration
public class MyPageMapperTests {
	// 잘올라가라
	
	@Autowired
	private MyPageMapper myPageMapper;
	
	// 회원정보 조회하기
	@Test
	public void testGetList() {

		String mem_id = "MEMBER02";
		List<MemberVO> list = myPageMapper.getList(mem_id);
		log.info("list:" + list);

	}
	
	// 비밀번호 변경하기
	@Test
	public void testChangePassword() {

		PWchangeDTO pwChangeDTO = PWchangeDTO.builder()
				.mem_id("MEMBER01")
				.newPassword("MEMBER01")
				.build();
				int result = myPageMapper.changePassword(pwChangeDTO);
				log.info("result:" + result);
	}
	
	// 회원정보 수정하기
	@Test
	public void testUpdateMember() {
		MemberVO updateVO = MemberVO.builder()
				.mem_id("test02")
				.mem_email("kim@naver.com")
				.mem_birth("2020-12-31")
				.mem_phone("01032143214")
				.mem_zip_code("66666")
				.mem_addr("울산시 남구 달동")
				.build();
		int result = myPageMapper.updateMember(updateVO);
		log.info("result:" + result);
	}
	
	// 탈퇴회원 기록하기
	@Test
	public void testRegisterDelMember() {
		MemberVO deletedVO = MemberVO.builder()
				.mem_id("test02")
				.mem_name("bb")
				.mem_email("bb@naver.com")
				.mem_birth("20000101")
				.mem_phone("01011111111")
				.mem_zip_code("55555")
				.mem_addr("울산시 남구 달동")
				.mem_point(5000)
				.mem_adminck(0)
				.build();
		int result = myPageMapper.registerDelMember(deletedVO);
		log.info("result:" + result);
	}

	// 회원정보 삭제하기
	@Test
	public void testDeleteMember() {
		String mem_id = "test01";
		int result = myPageMapper.deleteMember(mem_id);
		log.info("result:" + result);
	}
}
