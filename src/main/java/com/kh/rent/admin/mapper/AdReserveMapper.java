package com.kh.rent.admin.mapper;

import java.util.List;

import com.kh.rent.myPage.domain.GetStatusDTO;
import com.kh.rent.reserve.domain.NonMemberVO;

public interface AdReserveMapper {
	
	public List<GetStatusDTO> allReserveList();
	
	public List<NonMemberVO> allNonlist();
	
}
