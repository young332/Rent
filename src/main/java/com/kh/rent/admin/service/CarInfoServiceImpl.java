package com.kh.rent.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.rent.admin.domain.CarInfoVO;
import com.kh.rent.admin.mapper.CarInfoMapper;

@Service
public class CarInfoServiceImpl implements CarInfoService {
	
	@Autowired
	private CarInfoMapper carInfoMapper;
	

	@Override
	public int addCar(CarInfoVO carInfoVO) {
		int count = carInfoMapper.insertCar(carInfoVO);
		return count;
	}

}
