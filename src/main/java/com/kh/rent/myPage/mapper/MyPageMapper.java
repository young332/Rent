package com.kh.rent.myPage.mapper;

import java.util.List;

import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.myPage.domain.GetCarNameDTO;
import com.kh.rent.myPage.domain.PWchangeDTO;
import com.kh.rent.reserve.domain.ReserveVO;

public interface MyPageMapper {

	// 회원정보 조회하기
	public MemberVO getVO(String mem_id);
	
	// 비밀번호 변경하기
	public int changePassword(PWchangeDTO pwChangeDTO);
	
	// 회원정보 수정하기
	public int updateMember(MemberVO updateVO);
	
	// 탈퇴회원 기록하기
	public int registerDelMember(MemberVO deletedVO);
	
	// 회원정보 삭제하기
	public int deleteMember(String mem_id);
	
	// 예약정보 조회하기
	public List<ReserveVO> getReserveList(String mem_id);
	
	// 예약번호로 차종 조회하기
	public String getCarName(GetCarNameDTO getCarNameDTO);
}
