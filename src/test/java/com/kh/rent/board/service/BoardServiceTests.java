package com.kh.rent.board.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.rent.board.domain.BoardVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@Log4j
@WebAppConfiguration
public class BoardServiceTests {

	@Autowired
	private BoardService boardService;
	
	// 글 등록
	@Test
	public void testInsert() {
		BoardVO boardVO = BoardVO.builder()
				.board_title("서비스테스트")
				.board_content("테스트")
				.readcount(1)
				.build();
		 boardService.register(boardVO);
	}
	
	// 공지사항 목록
	@Test
	public void testGetNotice() {
		List<BoardVO> noticeList = boardService.getNotice();
		log.info("noticeList:" + noticeList);
	}
	
	// 글 목록
	@Test
	public void testGetList() {
		List<BoardVO> list = boardService.getList();
		log.info(list);
	}
	
	// 글 수정
	@Test
	public void testModify() {
		BoardVO boardVO = BoardVO.builder()
				.board_title("서비스수정- 수정")
				.board_content("서비스 수정 내용 - 수정")
				.board_no(1L)
				.build();
		int count = boardService.modify(boardVO);
		log.info("count : "+ count);
	}
	
	// 글 삭제
	@Test
	public void testdelete() {
		Long board_no = 14L;
		int count = boardService.remove(board_no);
		log.info("count:" + count);
	}
	

	//검색
	@Test
	public void testSearch() {
		 String type = "TC";
		 String keyword = "운영";
		 List<BoardVO> list = boardService.search(type, keyword);
		 log.info("list:" + list);
		 
	}

	// 글 하나 가져오기
	@Test
	public void testSelectByNo() {
		Long board_no = 11L;
		BoardVO boardVO = boardService.get(board_no);
		log.info("boardVO:" + boardVO);
	}
	
	// 조회수 업데이트
	@Test
	public void testReadCount() {
		Long board_no = 1L;
		int count = boardService.readCount(board_no);
		log.info("count : " + count);

	}
	
}
