package com.kh.rent.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.rent.board.domain.BoardVO;

public interface BoardMapper {

	public int insert(BoardVO boardVO);
	
	public List<BoardVO> selectList();
	
	public int update(BoardVO boardVO);
	
	public int delete(Long board_no);
	
	public BoardVO selectByNo(Long board_no);
	
	public int readCountUpdate(Long board_no);
	
	public List<BoardVO> search(@Param("type")String type,
								@Param("keyword")String keyword);
}
