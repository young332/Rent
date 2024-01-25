package com.kh.rent.myPage.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.rent.login.domain.LoginDTO;
import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.myPage.domain.DeletedMemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@Log4j
@WebAppConfiguration
public class MyPageMapperTests {
	
	@Autowired
	private MyPageMapper myPageMapper;
	
	// 회원정보 조회하기
	@Test
	public void testGetList() {
		String mem_id = "MEMBER01";
		List<MemberVO> list = myPageMapper.getList(mem_id);
		log.info("list:" + list);
	}
	
	// 비밀번호 변경하기
	@Test
	public void testChangePassword() {
		LoginDTO loginDTO = LoginDTO.builder()
				.mem_id("MEMBER01")
				.mem_pw("MEMBER01")
				.build();
				int result = myPageMapper.changePassword(loginDTO);
				log.info("result:" + result);
	}
	
	// 회원정보 수정하기 - 보류
	@Test
	public void testUpdateMember() {
		MemberVO updateVO = MemberVO.builder()
				.mem_name("강감찬-수정")
				.mem_email("khproject2309@gmail.com")
				.mem_birth("20201231")
				.mem_phone("01032143214")
				.mem_adress("울산시 북구 강동동")
				.build();
		int result = myPageMapper.updateMember(updateVO);
		log.info("result:" + result);
	}
	
	// 탈퇴회원 기록하기
	@Test
	public void testRegisterDelMember() {
		DeletedMemberVO deletedVO = DeletedMemberVO.builder()
				.del_id("test01")
				.del_name("aa")
				.del_email("aa@naver.com")
				.del_birth("20000101")
				.del_phone("01000000000")
				.del_zip_code("55555")
				.del_addr("울산시 남구 삼산동")
				.del_cdate("2024-01-22 15:13:14")
				.del_point(5000)
				.del_adminck(0)
				.build();
		int result = myPageMapper.registerDelMember(deletedVO);
		log.info("result:" + result);
	}

	// 회원정보 삭제하기
	public void testDeleteMember() {
		String mem_id = "test01";
		int result = myPageMapper.deleteMember(mem_id);
		log.info("result:" + result);
	}
}
