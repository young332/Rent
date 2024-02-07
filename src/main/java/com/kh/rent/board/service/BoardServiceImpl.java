package com.kh.rent.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.rent.board.domain.BoardVO;
import com.kh.rent.board.mapper.BoardMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardMapper boardMapper;
	
	
	@Override
	public List<BoardVO> getList() {
		List<BoardVO> list = boardMapper.selectList();
		return list;
	}

	@Override
	public int register(BoardVO boardVO) {
		int count = boardMapper.insert(boardVO);
		return count;
	}

	@Override
	public BoardVO get(Long board_no) {
		BoardVO boardVO = boardMapper.selectByNo(board_no);
		return boardVO;
	}

	@Override
	public int modify(BoardVO boardVO) {
		int count = boardMapper.update(boardVO);
		log.info("count : " + count);
		return count;
	}

	@Override
	public int remove(Long board_no) {
		int count = boardMapper.delete(board_no);
		return count;
	}

	//조회수 업데이트
	@Override
	public int readCount(Long board_no) {
		int count = boardMapper.readCountUpdate(board_no);
		return count;
	}

}
