package com.kh.rent.reserve.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.rent.admin.domain.CarInfoVO;
import com.kh.rent.reserve.domain.ReserveDTO;
import com.kh.rent.reserve.domain.ReserveVO;
import com.kh.rent.reserve.mapper.ReserveMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class ReserveServiceImpl implements ReserveService{
	
	@Autowired
	private ReserveMapper reserveMapper;

	@Override
	public void reserveinsert(ReserveVO reserveVO) {
		reserveMapper.reserveinsert(reserveVO);
		
	}

	@Override
	public List<ReserveVO> getList() {
		List<ReserveVO> list = reserveMapper.getList();
		return list;
	}

	@Override
	public List<CarInfoVO> getCarInfo() {
		List<CarInfoVO> list = reserveMapper.getCarInfo();
		
		return list;
	}

	@Override
	public List<ReserveDTO> selectCheck(ReserveDTO reserveDTO) {
		List<ReserveDTO> list = reserveMapper.selectCheck(reserveDTO);
		return list;
	}
	
	
}
