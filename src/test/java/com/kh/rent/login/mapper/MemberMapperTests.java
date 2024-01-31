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
		String id = "MEMBER02";
		String pw = "MEMBER02";
		String name ="하삼동";
		String email ="yyyy@ttt.com";
		String birth ="19890101";
		String phone = "01099998888";
		String code ="5235";
		String addr ="울산시 중구 우정동";
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
	
	@Test
	public void tesetCheckId() {
		String mem_id = "MEMBER01";
		int count = memberMapper.checkId(mem_id);
		log.info("count:" + count);
	}
	
	@Test
	public void testCheckPhone() {
		String mem_phone ="01015450428";
		int count = memberMapper.checkPhone(mem_phone);
		log.info("count : " + count);
	}
	
//	@Test
//	public void testFindBypw() {
//		String mem_id = "MEMBER03";
//		String mem_pw ="1942b77e8133d5323f6e99288a6d45cd21529547bb39d1256385082892719f76";
//		String count  = memberMapper.findByIdAndPw(LoginDTO )
//		log.info("count: " + count);
//	}
	
	@Test
	public void testFindByName() {
		String mem_name = "한소희";
		MemberVO memberVO = memberMapper.findeByName(mem_name);
		log.info("memberVO:" + memberVO);
	}
	
	
}
