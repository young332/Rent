package com.kh.rent.login.service;

import com.kh.rent.login.domain.LoginDTO;
import com.kh.rent.login.domain.MemberVO;

public interface MemberService {

		//로그인
		public MemberVO login(LoginDTO loginDTO);
		
		//회원가입
		public boolean registerPost(MemberVO memberVO);
		
		//아이디 찾기
		public MemberVO findMemberId(MemberVO memberVO);
		
		//비밀번호변경
		public void changePassword(LoginDTO loginDTO);
		
		//아이디 중복체크
}
