package com.kh.rent.admin.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.rent.admin.domain.CommonCodeVO;
import com.kh.rent.admin.domain.MenuVO;

public interface CodeService {
	
	public List<CommonCodeVO> getTopCode();
	
	public List<CommonCodeVO> getSubCodeAll();

//	public List<MenuVO> getSubMenu(@Param("parent_menu_id") String parent_menu_id);
//	
//	public int addMenu(MenuVO menuVO);
//
//	public MenuVO getOneMenu(String menu_id);
//	
//	public int modifyMenu(MenuVO menuVO);
//	
//	public int delete(String menu_id);
	
}
