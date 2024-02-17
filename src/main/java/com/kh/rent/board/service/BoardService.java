package com.kh.rent.board.service;

import java.util.List;
import java.util.Map;

import com.kh.rent.board.domain.BoardVO;
import com.kh.rent.board.domain.Criteria;

public interface BoardService {

	// 글 등록
	public int register(BoardVO boardVO);
	
	// 답글 등록
	public int replyInsert(BoardVO boardVO);
	
	// 게시글 시퀀스 수정
	public int replySeqUpdate(BoardVO boardVO);
	
	// 공지사항 목록
	public List<BoardVO> getNotice();
	
	// 일반 글 목록
	public Map<String, Object> getList(Criteria cri);
	
	// 글 수정
	public int modify(BoardVO boardVO);
	
	// 글 삭제
	public int remove(Long board_no);

	// 글 하나 가져오기
	public BoardVO get(Long board_no);
	
	// 조회수 업데이트
	public int readCount(Long board_no);

	//검색
//	public List<BoardVO> search(String type, String keyword);
}
