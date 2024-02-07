package com.kh.rent.admin.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.rent.admin.domain.CarInfoVO;
import com.kh.rent.admin.domain.CommonCodeVO;
import com.kh.rent.admin.domain.FileVO;
import com.kh.rent.admin.domain.MenuVO;

public interface CarInfoService {
	
	
	public int addCar(CarInfoVO carInfoVO);
	
	public List<CommonCodeVO> selectCarName();
	
	public int insertFile(FileVO fileVO);
	
	public List<CarInfoVO> selectCarInfo();
	
	public CarInfoVO selectCarInfoByIndex(Integer car_index);
	
	public int updateCarInfo(CarInfoVO carInfoVO);
	
	
}
