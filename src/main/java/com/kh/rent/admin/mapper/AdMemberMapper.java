package com.kh.rent.admin.mapper;

import java.util.List;

import com.kh.rent.admin.domain.DelMemberVO;
import com.kh.rent.login.domain.MemberVO;

public interface AdMemberMapper {

	public List<MemberVO> selectAllMember();
	public List<DelMemberVO> selectDelMember();
	public MemberVO selectMemberByid(String mem_id);
	public int updateMember(MemberVO updateVO);

}
