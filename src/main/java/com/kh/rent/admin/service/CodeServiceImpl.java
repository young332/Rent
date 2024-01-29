package com.kh.rent.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.rent.admin.domain.CommonCodeVO;
import com.kh.rent.admin.mapper.CodeMapper;

@Service
public class CodeServiceImpl implements CodeService {
	
	@Autowired
	private CodeMapper codeMapper;

	@Override
	public List<CommonCodeVO> getTopCode() {
		List<CommonCodeVO> topCodeList = codeMapper.getTopCode();
		return topCodeList;
	}

	@Override
	public List<CommonCodeVO> getSubCodeAll() {
		List<CommonCodeVO> subCodeList = codeMapper.getSubCodeAll();
		return subCodeList;
	}

}
