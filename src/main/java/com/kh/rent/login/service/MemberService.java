package com.kh.rent.login.service;

import com.kh.rent.login.domain.FindIdDTO;
import com.kh.rent.login.domain.LoginDTO;
import com.kh.rent.login.domain.MemberVO;

public interface MemberService {

		//로그인
		public MemberVO login(LoginDTO loginDTO);
		
		//회원가입
		public boolean registerPost(MemberVO memberVO);
		
		//아이디 찾기
		public String findMemberId(FindIdDTO findIdDTO);
		
		//비밀번호변경
		public void changePassword(LoginDTO loginDTO);
		
		//아이디 중복체크
		public int checkId(String mem_id);
		
		//문자인증
		public void checkPhone(String mem_phone, int randomNumber);
}
