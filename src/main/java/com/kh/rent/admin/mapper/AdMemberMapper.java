package com.kh.rent.admin.mapper;

import java.util.List;

import com.kh.rent.admin.domain.DelMemberVO;
import com.kh.rent.admin.domain.PointDTO;
import com.kh.rent.admin.domain.Search;
import com.kh.rent.login.domain.LoginDTO;
import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.myPage.domain.PWchangeDTO;

public interface AdMemberMapper {

	public List<MemberVO> selectAllMember(Search search);
	
	public List<DelMemberVO> selectDelMember();
	
	public MemberVO selectMemberByid(String mem_id);
	
	public int updateMember(MemberVO updateVO);
	
	//일반로그인
	/* public MemberVO login(LoginDTO loginDTO); */
	
	//암호화 비밀번호 로그인
	public MemberVO findByIdAndPw(LoginDTO loginDTO);
	
	//비밀번호 변경하기
	public int changePassword(PWchangeDTO pwChangeDTO);
	
	//회원검색
	public List<MemberVO> searchMember(MemberVO searchDTO);
	
	//포인트 현황
	public List<PointDTO> selectPointByid(String mem_id);
	
	//포인트 충전
	public int addPoint(MemberVO memberVO);
	
	//포인트충전 추가
	public int addPointTable(PointDTO pointDTO);
	
}
