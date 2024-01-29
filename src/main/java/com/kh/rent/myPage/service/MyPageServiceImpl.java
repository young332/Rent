package com.kh.rent.myPage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.rent.login.domain.LoginDTO;
import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.myPage.domain.DeletedMemberVO;
import com.kh.rent.myPage.mapper.MyPageMapper;

@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Autowired
	private MyPageMapper myPageMapper;

	// 회원정보 조회하기
	@Override
	public MemberVO selectList(String mem_id) {
		MemberVO selectVO = myPageMapper.getVO(mem_id);
		return selectVO;
	}

	// 비밀번호 변경하기
	@Transactional
	@Override
	public int changePassword(LoginDTO loginDTO) {
		int result = myPageMapper.changePassword(loginDTO);
		return result;
	}

	// 회원정보 수정하기
	@Transactional
	@Override
	public int updateMember(MemberVO updateVO) {
		int result = myPageMapper.updateMember(updateVO);
		return result;
	}

	// 탈퇴회원 기록하기
	@Transactional
	@Override
	public int registerDelMember(MemberVO deletedVO) {
		int result = myPageMapper.registerDelMember(deletedVO);
		return result;
	}

	// 회원정보 삭제하기
	@Transactional
	@Override
	public int deleteMember(String mem_id) {
		int result = myPageMapper.deleteMember(mem_id);
		return result;
	}

}
