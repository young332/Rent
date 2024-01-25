package com.kh.rent.reserve.service;

import java.util.List;

import com.kh.rent.reserve.domain.ReserveVO;

public interface ReserveService {
	
	public void reserveinsert(ReserveVO reserveVO);
	public List<ReserveVO> getList();
}
