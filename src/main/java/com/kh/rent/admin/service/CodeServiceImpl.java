package com.kh.rent.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.rent.admin.domain.CommonCodeVO;
import com.kh.rent.admin.domain.MenuVO;
import com.kh.rent.admin.mapper.CodeMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class CodeServiceImpl implements CodeService {
	
	@Autowired
	private CodeMapper codeMapper;

	@Override
	public List<CommonCodeVO> getTopCode() {
		List<CommonCodeVO> topCodeList = codeMapper.getTopCode();
		log.info("CodeServiceImpl-topCodeList:"+topCodeList);
		return topCodeList;
	}

	@Override
	public List<CommonCodeVO> getSubCodeAll() {
		List<CommonCodeVO> subCodeList = codeMapper.getSubCodeAll();
		return subCodeList;
	}

	@Override
	public List<CommonCodeVO> getSubCode(String parent_code_id) {
		List<CommonCodeVO> subCodeList = codeMapper.getSubCode(parent_code_id);
	    return subCodeList;
	}

	@Override
	public int addCode(CommonCodeVO commonCodeVO) {
		int count = codeMapper.insertCode(commonCodeVO);
		return count;
	}

	@Override
	public int modifyCode(CommonCodeVO CommonCodeVO) {
		int count = codeMapper.updateCode(CommonCodeVO);
		return count;
	}

	@Override
	public int delete(String code_id) {
		int count = codeMapper.delete(code_id);
		return count;
	}

}
