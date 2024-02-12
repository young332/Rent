package com.kh.rent.board.service;

import java.util.List;

import com.kh.rent.board.domain.BoardVO;

public interface BoardService {

	//글 목록 가져오기
	public List<BoardVO> getList();
	
	//글 등록
	public int register(BoardVO boardVO);
	
	//조회수 업데이트
	public int readCount(Long board_no);
	
	//글 하나 가져오기
	public BoardVO get(Long board_no);
	
	//글 수정
	public int modify(BoardVO boardVO);
	
	//글 삭제
	public int remove(Long board_no);
	
	//검색
	public List<BoardVO> search(String type, String keyword);
}
