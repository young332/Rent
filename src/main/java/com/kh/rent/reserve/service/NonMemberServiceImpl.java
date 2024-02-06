package com.kh.rent.reserve.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.rent.reserve.domain.NonMemberVO;
import com.kh.rent.reserve.mapper.NonMemberMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class NonMemberServiceImpl implements NonMemberService{
	
	@Autowired
	private NonMemberMapper nonMemberMapper;

	@Override
	public void nonmeminsert(NonMemberVO nonMemberVO) {
		nonMemberMapper.nonmeminsert(nonMemberVO);
		
	}
	
	
}
