package com.kh.rent.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.rent.admin.domain.DelMemberVO;
import com.kh.rent.admin.domain.MenuVO;
import com.kh.rent.admin.mapper.AdMemberMapper;
import com.kh.rent.login.domain.LoginDTO;
import com.kh.rent.login.domain.MemberVO;

@Service
public class AdMemberServiceImpl implements AdMemberService {
	
	@Autowired
	private AdMemberMapper adMemberMapper;

	@Override
	public List<MemberVO> selectAllMember() {
		List<MemberVO> MemberList = adMemberMapper.selectAllMember();
		return MemberList;
		
	}

	@Override
	public List<DelMemberVO> selectDelMember() {
		List<DelMemberVO> DelMemberList = adMemberMapper.selectDelMember();
		return DelMemberList;
	}

	@Override
	public MemberVO selectMemberByid(String mem_id) {
		MemberVO memberVO = adMemberMapper.selectMemberByid(mem_id);
		return memberVO;
	}
	
	@Override
	public int updateMember(MemberVO updateVO) {
		int result = adMemberMapper.updateMember(updateVO);
		return result;
	}

	//로그인
	@Override
	public MemberVO login(LoginDTO loginDTO) {
		MemberVO memberVO = adMemberMapper.login(loginDTO);
		return memberVO;
	}



}
