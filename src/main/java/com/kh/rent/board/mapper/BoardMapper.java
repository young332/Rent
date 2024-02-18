package com.kh.rent.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kh.rent.board.domain.BoardVO;
import com.kh.rent.board.domain.Criteria;

public interface BoardMapper {

	// 글 등록
	public int insert(BoardVO boardVO);
	
	// 답글 등록
	public int replyInsert(BoardVO boardVO);
	
	// 답글 순서 업데이트
	public int replySeqUpdate(BoardVO boardVO);
	
	// 공지사항 목록
	public List<BoardVO> notice();
	
	// 일반글 목록
	public List<BoardVO> selectList(Criteria cri) ;
	
	// 글 수정
	public int update(BoardVO boardVO);
	
	// 글 삭제
	public int delete(Long board_no);
	
	// 글 하나 가져오기
	public BoardVO selectByNo(Long board_no);
	
	// 조회수 업데이트
	public int readCountUpdate(Long board_no);
	
	// 글 갯수
	public int getTotal(Criteria cri);
	
	// 답글 갯수
	public int replyCount(int board_group);
	
	// 답글있는 원글 삭제처리
	public int isReplyDelete(Long board_no);
	
	// 검색 기능
//	public List<BoardVO> search(@Param("type")String type,
//			@Param("keyword")String keyword);

}
