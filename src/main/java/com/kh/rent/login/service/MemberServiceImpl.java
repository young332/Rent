package com.kh.rent.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.rent.login.domain.LoginDTO;
import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.login.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public MemberVO login(LoginDTO loginDTO) {
		MemberVO memberVO = memberMapper.login(loginDTO);
		return memberVO;
	}

	@Override
	public boolean registerPost(MemberVO memberVO) {
		int count = memberMapper.registerPost(memberVO);
		if(count == 1) {
			return true;
		}
		return false;
	}

	@Override
	public MemberVO findMemberId(MemberVO memberVO) {
		MemberVO vo = memberMapper.findMemberId(memberVO);
		return vo;
	}

	@Override
	public void changePassword(LoginDTO loginDTO) {
		memberMapper.changePassword(loginDTO);
		
	}

}
