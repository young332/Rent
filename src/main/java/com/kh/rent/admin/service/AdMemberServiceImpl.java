package com.kh.rent.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.rent.admin.domain.DelMemberVO;
import com.kh.rent.admin.domain.MenuVO;
import com.kh.rent.admin.mapper.AdMemberMapper;
import com.kh.rent.login.domain.LoginDTO;
import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.login.service.Sha256;
import com.kh.rent.myPage.domain.PWchangeDTO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class AdMemberServiceImpl implements AdMemberService {
	
	@Autowired
	private AdMemberMapper adMemberMapper;
	
	@Autowired
	private Sha256 sha256;

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
	
	
	@Override //로그인(암호화로그인)
	public MemberVO login(LoginDTO loginDTO) {
		log.info("loginDTO:" + loginDTO);
		loginDTO.setMem_pw(sha256.encrypt(loginDTO.getMem_pw()));
		MemberVO memberVO = adMemberMapper.findByIdAndPw(loginDTO);
		if (memberVO != null) {
			return memberVO;

		}
		return null;
	}
	
	// 비밀번호 변경하기
	@Transactional
	@Override
	public int changePassword(PWchangeDTO pwChangeDTO) {
		int result = adMemberMapper.changePassword(pwChangeDTO);
		log.info("serviceImpl result:" + result);
		return result;
	}

	//로그인
//	@Override
//	public MemberVO login(LoginDTO loginDTO) {
//		MemberVO memberVO = adMemberMapper.login(loginDTO);
//		return memberVO;
//	}



}
