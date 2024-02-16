package com.kh.rent.admin.service;

import java.util.List;

import com.kh.rent.myPage.domain.GetStatusDTO;
import com.kh.rent.reserve.domain.NonMemberVO;

public interface AdReserveService {

	public List<GetStatusDTO> allReserveList();
	
	public List<NonMemberVO> allNonlist();

}
