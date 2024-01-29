package com.kh.rent.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.rent.admin.domain.CommonCodeVO;
import com.kh.rent.admin.domain.MenuVO;

public interface CodeMapper {

	public List<CommonCodeVO> getTopCode();
	
	public List<CommonCodeVO> getSubCodeAll();

	public List<CommonCodeVO> getSubCode(@Param("parent_code_id") String parent_code_id);
	
//	public MenuVO getOneMenu(String menu_id);

	public int insertCode(CommonCodeVO commonCodeVO);
	
	public int updateCode(CommonCodeVO CommonCodeVO);
	
	public int delete(String code_id);

}
