package com.kh.rent.admin.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.rent.admin.domain.CommonCodeVO;
import com.kh.rent.admin.domain.MenuVO;

public interface CodeService {
	
	public List<CommonCodeVO> getTopCode();
	
	public List<CommonCodeVO> getSubCodeAll();

	public List<CommonCodeVO> getSubCode(@Param("parent_code_id") String parent_code_id);
	
	public int addCode(CommonCodeVO commonCodeVO);
//
//	public MenuVO getOneMenu(String menu_id);
//	
	public int modifyCode(CommonCodeVO CommonCodeVO);
//	
	public int delete(String code_id);
	
}