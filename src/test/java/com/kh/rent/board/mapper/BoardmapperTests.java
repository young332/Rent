package com.kh.rent.board.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.rent.board.domain.BoardVO;
import com.kh.rent.board.domain.Criteria;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@Log4j
@WebAppConfiguration
public class BoardmapperTests {
	
	@Autowired
	private BoardMapper boardMapper;

	// 글 등록
	@Test
	public void testInsert() {
		BoardVO boardVO = BoardVO.builder()
				.board_title("테스트 ㅇㅇ")
				.board_content("테스트 ㅇㅇ")
				.board_mem_id("MEMBER05")
				.board_privateYN("N")
				.board_noticeYN("N")
				.build();
		boardMapper.insert(boardVO);
		log.info("resultVO:" + boardVO);
	}
	
	// 답글 등록
	@Test
	public void replyInsert() {
		BoardVO boardVO = BoardVO.builder()
				.board_title("제목15의 답글22")
				.board_content("답글내용")
				.board_mem_id("MEMBER05")
				.board_privateYN("N")
				.board_group(300)
				.board_seq(1)
				.board_level(1)
				.build();
		boardMapper.replyInsert(boardVO);
		boardMapper.replyInsert(boardVO);
		log.info("resultVO:" + boardVO);
	}
	
	// 게시글 시퀀스 수정
	@Test
	public void testReplySeqUpdate() {
		BoardVO boardVO = BoardVO.builder()
				.board_group(300)
				.board_seq(0)
				.build();
		int result = boardMapper.replySeqUpdate(boardVO);
		log.info("result:" + result);
	}
	
	// 공지사항 목록
	@Test
	public void testNotice() {
		List<BoardVO> noticeList = boardMapper.notice();
		log.info("noticeList:" + noticeList);
	}
	
//	// 글 목록
	@Test
	public void testList() {
		Criteria criteria = new Criteria();
		List<BoardVO> list = boardMapper.selectList(criteria);
		log.info("list:" + list);
	}
	
	
	// 글 수정
	@Test
	public void testupdate() {
		BoardVO boardVO = BoardVO.builder()
				.board_title("테스트 원글")
				.board_content("테스트 테스트")
				.board_privateYN("N")
				.board_noticeYN("N")
				.board_no(550L)
				.build();
		int result = boardMapper.update(boardVO);
		log.info("result:" + result );
	}
	
	// 글 삭제
	@Test
	public void testdelete() {
		Long board_no = 12L;
		int result = boardMapper.delete(board_no);
		log.info("result:" + result);
	}
	
	// 글 하나 가져오기
	@Test
	public void testSelectByNo() {
		Long board_no = 11L;
		BoardVO boardVO = boardMapper.selectByNo(board_no);
		log.info("boardVO:" + boardVO);
	}
	

//	@Test
//	public void testSearch() {
//		String type = "TC";
//		String keyword = "예약";
//		List<BoardVO> list = boardMapper.search(type, keyword);
//		log.info("list:" + list);
//	}

	// 조회수 업데이트
	@Test
	public void testReadCount() {
		Long board_no = 1L;
		int count = boardMapper.readCountUpdate(board_no);
		log.info("count:"+ count);
	}
	
	// 답글 갯수
	@Test
	public void testReplyCount() {
		int board_group = 66;
		int result = boardMapper.replyCount(board_group);
		log.info("result:" + result);
	}
	
	// 답글있는 원글 삭제처리
	@Test
	public void testIsReplyDelete() {
		Long board_no = 579L; 
		int result = boardMapper.isReplyDelete(board_no);
		log.info("result:" + result);
	}
	

}
