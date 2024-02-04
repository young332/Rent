package com.kh.rent.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.rent.admin.domain.CarInfoVO;
import com.kh.rent.admin.domain.CommonCodeVO;
import com.kh.rent.admin.domain.FileVO;
import com.kh.rent.admin.domain.MenuVO;

public interface CarInfoMapper {

	public int insertCar(CarInfoVO carInfoVO);
	
	public int insertFile(FileVO fileVO);
	
	public List<CommonCodeVO> selectCarName();
	
	public List<CarInfoVO> selectCarInfo();
	/*
	 * public List<MenuVO> getTopMenu();
	 * 
	 * public List<MenuVO> getSubMenuAll(String menu_id);
	 * 
	 * public List<MenuVO> getSubMenu(@Param("parent_menu_id") String
	 * parent_menu_id);
	 * 
	 * public MenuVO getOneMenu(String menu_id);
	 * 
	 * 
	 * public int updateMenu(MenuVO menuVO);
	 * 
	 * public int delete(String menu_id);
	 */

}
