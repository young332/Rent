package com.kh.rent.reserve.mapper;

import java.util.List;

import com.kh.rent.reserve.domain.NonMemberVO;

public interface NonMemberMapper {
	public void nonmeminsert(NonMemberVO nonmemberVO);
	public List<NonMemberVO> getNonlist();
}
