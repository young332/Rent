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
	
	@Autowired
	private MenuMapper menuMapper;

	@Override
	public List<MenuVO> getTopMenu() {
		List<MenuVO> topMenuList = menuMapper.getTopMenu();
		return topMenuList;
	}

	@Override
	public List<MenuVO> getSubMenu() {
		List<MenuVO> subMenuList = menuMapper.getSubMenu();
		return subMenuList;
	}

}
