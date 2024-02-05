package com.kh.rent.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.rent.admin.domain.CarInfoVO;
import com.kh.rent.admin.domain.CommonCodeVO;
import com.kh.rent.admin.domain.FileVO;
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
	
	@Override
	public int insertFile(FileVO fileVO) {
		int count = carInfoMapper.insertFile(fileVO);
		
		int file_id = fileVO.getFile_id();
		
		return file_id;
	}


	@Override
	public List<CommonCodeVO> selectCarName() {
		List<CommonCodeVO> carNameList =carInfoMapper.selectCarName();
		return carNameList;
	}
	
	@Override
	public List<CarInfoVO> selectCarInfo() {
		List<CarInfoVO> carInfoList =carInfoMapper.selectCarInfo();
		return carInfoList;
	}

}