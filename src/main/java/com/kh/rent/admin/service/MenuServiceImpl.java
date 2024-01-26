package com.kh.rent.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.rent.admin.domain.MenuVO;
import com.kh.rent.admin.mapper.MenuMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MenuServiceImpl implements MenuService {
	
	private List<MenuVO> menuList;
	
	@Autowired
	private MenuMapper menuMapper;

	@Override
	public List<MenuVO> getTopMenu() {
		List<MenuVO> topMenuList = menuMapper.getTopMenu();
		return topMenuList;
	}
	
	@Override
	public List<MenuVO> getSubMenu(String parent_menu_id) {
	    List<MenuVO> subMenuList = menuMapper.getSubMenu(parent_menu_id);
	    return subMenuList;
	}
	

	@Override
	public int addMenu(MenuVO menuVO) {
		int count = menuMapper.insertMenu(menuVO);
		return count;
	}

	@Override
	public MenuVO getOneMenu(String menu_id) {
		MenuVO menuVO = menuMapper.getOneMenu(menu_id);
		return menuVO;
	}

	@Override
	public int modifyMenu(MenuVO menuVO) {
		int count = menuMapper.updateMenu(menuVO);
		return count;
	}

	@Override
	public int delete(String menu_id) {
		int count = menuMapper.delete(menu_id);
		return count;
	}


}
