package com.kh.rent.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.rent.board.domain.BoardVO;
import com.kh.rent.board.domain.Criteria;
import com.kh.rent.board.mapper.BoardMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardMapper boardMapper;
	
	// 글 등록
	@Override
	public int register(BoardVO boardVO) {
		int count = boardMapper.insert(boardVO);
		return count;
	}
	
	// 답글 등록
	@Override
	public int replyInsert(BoardVO boardVO) {
		int count = boardMapper.replyInsert(boardVO);
		return count;
	}

	// 답글 순서 업데이트
	@Override
	public int replySeqUpdate(BoardVO boardVO) {
		int count = boardMapper.replySeqUpdate(boardVO);
		return count;
	}

	
	// 공지사항 목록
	@Override
	public List<BoardVO> getNotice() {
		List<BoardVO> noticeList = boardMapper.notice();
		return noticeList;
	}
	
	// 일반글 목록
	@Override
	public Map<String, Object> getList(Criteria cri) {
		
		List<BoardVO> list = boardMapper.selectList(cri);
		int total = boardMapper.getTotal(cri);
		Map<String, Object> map = new HashMap<>();
		map.put("boardList", list);
		map.put("total", total);
		
		return map;
	}

	// 글 수정
	@Override
	public int modify(BoardVO boardVO) {
		int count = boardMapper.update(boardVO);
		log.info("count : " + count);
		return count;
	}

	// 글 삭제
	@Override
	public int remove(Long board_no) {
		int count = boardMapper.delete(board_no);
		return count;
	}
	
	// 글 하나 가져오기
	@Override
	public BoardVO get(Long board_no) {
		BoardVO boardVO = boardMapper.selectByNo(board_no);
		return boardVO;
	}

	// 조회수 업데이트
	@Override
	public int readCount(Long board_no) {
		int count = boardMapper.readCountUpdate(board_no);
		return count;
	}
	
	// 검색
//	@Override
//	public List<BoardVO> search(String type, String keyword) {
//		List<BoardVO> list = boardMapper.search(type, keyword);
//		return list;
//	}


}
