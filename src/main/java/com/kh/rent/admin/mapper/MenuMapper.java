package com.kh.rent.admin.mapper;

import java.util.List;

import com.kh.rent.admin.domain.MenuVO;

public interface MenuMapper {
	
	public List<MenuVO> getTopMenu();
	public List<MenuVO> getSubMenu();

}
