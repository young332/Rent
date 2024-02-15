package com.kh.rent.login.service;

import com.kh.rent.login.domain.FindIdDTO;
import com.kh.rent.login.domain.FindPwDTO;
import com.kh.rent.login.domain.LoginDTO;
import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.login.domain.NonMemberLoginDTO;
import com.kh.rent.reserve.domain.NonMemberVO;

public interface MemberService {

		//로그인
		public MemberVO login(LoginDTO loginDTO);
		
		//비회원로그인
		public int NonMemberLogin(NonMemberLoginDTO nonMemberLoginDTO);
		
		//회원가입
		public boolean registerPost(MemberVO memberVO);
		
		//아이디 찾기
		public String findMemberId(FindIdDTO findIdDTO);
		
		//비밀번호변경
		public void changePassword(LoginDTO loginDTO);
		
		//비밀번호 변경 시 아이디,이메일 확인
		public int findByIdAndEmail(FindPwDTO findPwDTO);
		
		//아이디 중복체크
		public int checkId(String mem_id);
		
		//문자인증
		public void checkSend(String mem_phone, int randomNumber);
		
		//휴대폰 중복체크
		public int checkPhone(String mem_phone);
		
		//이메일 중복체크
		public int checkEmail(String mem_email);
		
		//카카오로그인
		public int kakaCheck(String mem_phone);
		
		//카카오로그인 정보
		public MemberVO getKakalInfo(MemberVO memberVO);
}