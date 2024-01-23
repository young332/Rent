package com.kh.rent.admin.service;

import java.util.List;

import com.kh.rent.admin.domain.MenuVO;

public interface MenuService {
	
	public List<MenuVO> getTopMenu();
	public List<MenuVO> getSubMenu();

}
