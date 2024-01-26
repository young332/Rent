package com.kh.rent.login.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.rent.login.domain.FindIdDTO;
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
	public String findMemberId(FindIdDTO findIdDTO) {
		String mem_id = memberMapper.findMemberId(findIdDTO);
		return mem_id;
	}

	@Override
	public void changePassword(LoginDTO loginDTO) {
		memberMapper.changePassword(loginDTO);
		
	}

	@Override
	public int checkId(String mem_id) {
		int count = memberMapper.checkId(mem_id);
		return count;
	}

	@Override
	public void checkPhone(String mem_phone, int randomNumber) {
		String api_key = "NCSDWNNWYLA0BTWD";
	    String api_secret = "1LXFECAPZ4LFPUUIU9CRYSDHAQCUGPAN";
//	   Message coolsms = new Messa
	

		
	}

}
