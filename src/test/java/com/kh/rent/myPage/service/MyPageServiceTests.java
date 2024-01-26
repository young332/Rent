package com.kh.rent.myPage.service;

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
public class MyPageServiceTests {
	
	@Autowired
	private MyPageService myPageService;
	
	// 회원정보 조회하기
	@Test
	public void testSelectList() {
		List<MemberVO> list = myPageService.selectList("test02");
		log.info("list:" + list);
	}
	
	// 비밀번호 변경하기
	@Test
	public void testChangePassword() {
		LoginDTO loginDTO = LoginDTO.builder()
				.mem_id("test02")
				.mem_pw("test02")
				.build();
				int result = myPageService.changePassword(loginDTO);
				log.info("result:" + result);
	}
	
	// 회원정보 수정하기
		@Test
		public void testUpdateMember() {
			MemberVO updateVO = MemberVO.builder()
					.mem_id("test02")
					.mem_name("김영희-수정")
					.mem_email("kim@naver.com")
					.mem_birth("20201231")
					.mem_phone("01032143214")
					.mem_zip_code("66666")
					.mem_addr("울산시 남구 달동")
					.build();
			int result = myPageService.updateMember(updateVO);
			log.info("result:" + result);
		}
		
	// 탈퇴회원 기록하기
	@Test
	public void testRegisterDelMember() {
		DeletedMemberVO deletedVO = DeletedMemberVO.builder()
				.del_id("test03")
				.del_name("cc")
				.del_email("cc@naver.com")
				.del_birth("20000101")
				.del_phone("01011111111")
				.del_zip_code("55555")
				.del_addr("울산시 남구 삼호동")
				.del_cdate("2024-01-24 15:13:14")
				.del_point(5000)
				.del_adminck(0)
				.build();
		int result = myPageService.registerDelMember(deletedVO);
		log.info("result:" + result);
	}
	
	// 회원정보 삭제하기
		@Test
		public void testDeleteMember() {
			String mem_id = "test02";
			int result = myPageService.deleteMember(mem_id);
			log.info("result:" + result);
		}

}
