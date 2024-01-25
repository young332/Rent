package com.kh.rent.login.mapper;

import java.util.List;

import com.kh.rent.login.domain.FindIdDTO;
import com.kh.rent.login.domain.LoginDTO;
import com.kh.rent.login.domain.MemberVO;



public interface MemberMapper {

		//로그인
		public MemberVO login(LoginDTO loginDTO);
		
		//회원가입
		public int registerPost(MemberVO memberVO);
		
		//아이디찾기
		public String findMemberId(FindIdDTO findIdDTO); 
		
		//비밀번호변경
		public int changePassword(LoginDTO loginDTO);
		
		//조회
		public List<MemberVO> getList();
		
		//아이디 중복체크
		public int checkId(String mem_id);
}
