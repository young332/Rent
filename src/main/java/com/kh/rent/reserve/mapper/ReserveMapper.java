package com.kh.rent.reserve.mapper;

import java.util.List;

import com.kh.rent.reserve.domain.ReserveVO;

public interface ReserveMapper {
	
	public void reserveinsert(ReserveVO reserveVO);
	public List<ReserveVO> getList(); 

}
