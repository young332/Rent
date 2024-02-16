package com.kh.rent.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.rent.admin.mapper.AdBoardMapper;
import com.kh.rent.admin.mapper.AdReserveMapper;
import com.kh.rent.myPage.domain.GetStatusDTO;
import com.kh.rent.reserve.domain.NonMemberVO;

@Service
public class AdReserveServiceImpl implements AdReserveService {

	@Autowired
	private AdReserveMapper adReserveMapper;
	
	@Override
	public List<GetStatusDTO> allReserveList() {
		List<GetStatusDTO> reserveList = adReserveMapper.allReserveList();
		return reserveList;
	}

	@Override
	public List<NonMemberVO> allNonlist() {
		List<NonMemberVO> nonMemberList = adReserveMapper.allNonlist();
		return nonMemberList;
	}
	

	
}
