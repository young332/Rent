package com.kh.rent.myPage.service;

import java.util.List;

import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.login.domain.NonMemberLoginDTO;
import com.kh.rent.myPage.domain.GetCarNameDTO;
import com.kh.rent.myPage.domain.GetStatusDTO;
import com.kh.rent.myPage.domain.PWchangeDTO;
import com.kh.rent.reserve.domain.NonMemberVO;

public interface MyPageService {
	
	// 회원정보 조회하기
	public MemberVO selectList(String mem_id);
	
	// 비밀번호 변경하기
	public int changePassword(PWchangeDTO pwChangeDTO);
	
	// 회원정보 수정하기
	public int updateMember(MemberVO updateVO);
	
	// 탈퇴회원 기록하기
	public int registerDelMember(MemberVO deleteVO);
	
	// 회원정보 삭제하기
	public int deleteMember(String mem_id);
	
	// 예약정보 현재시각기준 업데이트
	public void updateTBLReserve(String mem_id);
	
	// 예약정보 조회하기
	public List<GetStatusDTO> getReserveList(String mem_id);

	// 예약번호로 차종 조회하기
	public String getCarName(GetCarNameDTO getCarNameDTO);
	
	// 예약취소
	public int cancelReservation(int res_rid);
	
	// 예약정보 조회하기(비회원)
	public List<NonMemberVO> getNonMemberList(NonMemberLoginDTO nonMemberLoginDTO);
}