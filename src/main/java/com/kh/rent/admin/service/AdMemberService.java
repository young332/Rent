package com.kh.rent.admin.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.rent.admin.domain.DelMemberVO;
import com.kh.rent.admin.domain.MenuVO;
import com.kh.rent.login.domain.LoginDTO;
import com.kh.rent.login.domain.MemberVO;

public interface AdMemberService {
	
	public List<MemberVO> selectAllMember();
	public List<DelMemberVO> selectDelMember();
	public MemberVO selectMemberByid(String mem_id);
	public int updateMember(MemberVO updateVO);
	
	public MemberVO login(LoginDTO loginDTO);
}
