package com.kh.rent.myPage.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.login.domain.NonMemberLoginDTO;
import com.kh.rent.myPage.domain.GetCarNameDTO;
import com.kh.rent.myPage.domain.GetStatusDTO;
import com.kh.rent.myPage.domain.PWchangeDTO;
import com.kh.rent.reserve.domain.NonMemberVO;

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
		MemberVO selectVO = myPageService.selectList("test02");
		log.info("selectVO:" + selectVO);
	}
	
	// 비밀번호 변경하기
	@Test
	public void testChangePassword() {
		PWchangeDTO pwChangeDTO = PWchangeDTO.builder()
				.mem_id("test02")
				.newPassword("test02")
				.build();
				int result = myPageService.changePassword(pwChangeDTO);
				log.info("result:" + result);
	}
	
	// 회원정보 수정하기
		@Test
		public void testUpdateMember() {
			MemberVO updateVO = MemberVO.builder()
					.mem_id("test02")
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
		MemberVO deletedVO = MemberVO.builder()
				.mem_id("test03")
				.mem_name("cc")
				.mem_email("cc@naver.com")
				.mem_birth("20000101")
				.mem_phone("01011111111")
				.mem_zip_code("55555")
				.mem_addr("울산시 남구 삼호동")
				.mem_point(5000)
				.mem_adminck(0)
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
		
	// 예약정보 현재시각기준 업데이트
	@Test
	public void testUpdateTBLReserve() {
		String mem_id = "MEMBER02";
		myPageService.updateTBLReserve(mem_id);
	}	
		
	// 예약정보 조회하기
	@Test
	public void testReserveList() {
		List<GetStatusDTO> list = myPageService.getReserveList("MEMBER02");
		log.info("Reservelist:" + list);
	}
	
	// 예약번호로 차종 조회하기
	@Test
	public void testGetCarName() {
		GetCarNameDTO getCarNameDTO = GetCarNameDTO.builder()
				.res_rid(4)
				.res_car_id("3")
				.build();
		String car_name = myPageService.getCarName(getCarNameDTO);
		log.info("car_name:" + car_name);
	}
	
	// 예약취소
	@Test
	public void testCancleReservation() {
		int res_rid = 22;
		int result = myPageService.cancelReservation(res_rid);
		log.info("cancleResult:" + result);
	}
	
	// 예약정보 현재시각기준 업데이트(비회원)
	@Test
	public void testUpdateNonMember() {
		NonMemberLoginDTO nonDTO = NonMemberLoginDTO.builder()
				.non_name("jo")
				.non_tel("01046648755")
				.build();
		myPageService.updateNonMember(nonDTO);
	}
	
	// 예약정보 조회하기(비회원)
	@Test
	public void testGetNonMemberList() {
		NonMemberLoginDTO nonDTO = NonMemberLoginDTO.builder()
				.non_name("jo")
				.non_tel("01046648755")
				.build();
		List<NonMemberVO> list = myPageService.getMemberList_non(nonDTO);
		log.info("non_Reservelist:" + list);
	}
	
	
	// 예약번호로 차종 조회하기(비회원)
	@Test
	public void testGetCarName_non() {
		GetCarNameDTO getCarNameDTO = GetCarNameDTO.builder()
				.res_rid(7)
				.res_car_id("3")
				.build();
		String car_name = myPageService.getCarName_non(getCarNameDTO);
		log.info("car_name:" + car_name);
	}
	
	// 예약취소(비회원)
	@Test
	public void testCancleReservation_non() {
		int non_rid = 6;
		int result = myPageService.cancelReservation_non(non_rid);
		log.info("cancleResult:" + result);
	}
	
	// 예약정보 조회하기(마이페이지)
	@Test
	public void testGetMyReserveList() {
		String mem_id = "MEMBER03";
		List<GetStatusDTO> list = myPageService.getMyReserveList(mem_id);
		log.info("Reservelist:" + list);
	}
	
	// 예약정보 조회하기(예약번호 1개 정보)
	@Test
	public void testGetMyResInfo() {
		int res_rid = 86;
		List<GetStatusDTO> list = myPageService.getMyResInfo(res_rid);
		log.info("res_info:" + list);
	}
	
}