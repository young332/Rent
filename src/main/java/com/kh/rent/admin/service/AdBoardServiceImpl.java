package com.kh.rent.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.rent.admin.mapper.AdBoardMapper;

@Service
public class AdBoardServiceImpl implements AdBoardService {
	
	@Autowired
	private AdBoardMapper boardMapper;

	@Override
	public int deleteCheckedBoard(List<Integer> boardNumbers) {
		int count = boardMapper.deleteCheckedBoard(boardNumbers);
		return count;
	}
	
}
