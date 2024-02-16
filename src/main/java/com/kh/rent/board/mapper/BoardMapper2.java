package com.kh.rent.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.rent.board.domain.BoardVO;

public interface BoardMapper {

	// 글 등록
	public int insert(BoardVO boardVO);
	
	// 공지사항 목록
	public List<BoardVO> notice();
	
	// 글 목록
	public List<BoardVO> selectList();
	
	// 글 수정
	public int update(BoardVO boardVO);
	
	// 글 삭제
	public int delete(Long board_no);
	
	// 글 하나 가져오기
	public BoardVO selectByNo(Long board_no);
	
	// 조회수 업데이트
	public int readCountUpdate(Long board_no);
	

	// 검색 기능
	public List<BoardVO> search(@Param("type")String type,
			@Param("keyword")String keyword);

}
