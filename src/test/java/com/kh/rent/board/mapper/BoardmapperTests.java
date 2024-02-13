package com.kh.rent.board.mapper;

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
public class BoardmapperTests {
	
	@Autowired
	private BoardMapper boardMapper;

	// 글 등록
	@Test
	public void testInsert() {
		for(int i=1; i<=5; i++) {
			BoardVO boardVO = BoardVO.builder()
					.board_title("제목"+ i)
					.board_content("내용"+ i)
					.board_mem_id("MEMBER05")
					.board_privateYN("N")
					.board_noticeYN("N")
					.build();
			boardMapper.insert(boardVO);
		}
	}
	
	// 공지사항 목록
	@Test
	public void testNotice() {
		List<BoardVO> noticeList = boardMapper.notice();
		log.info("noticeList:" + noticeList);
	}
	
	// 글 목록
	@Test
	public void testList() {
		List<BoardVO> list = boardMapper.selectList();
		log.info("list:" + list);
	}
	
	
	// 글 수정
	@Test
	public void testupdate() {
		BoardVO boardVO = BoardVO.builder()
				.board_title("제목 수정")
				.board_content("내용 수정")
				.board_no(2L)
				.build();
		int result = boardMapper.update(boardVO);
		log.info("result: " + result );
	}
	
	// 글 삭제
	@Test
	public void testdelete() {
		Long board_no = 12L;
		int result = boardMapper.delete(board_no);
		log.info("result : " + result);
	}
	
	// 글 하나 가져오기
	@Test
	public void testSelectByNo() {
		Long board_no = 11L;
		BoardVO boardVO = boardMapper.selectByNo(board_no);
		log.info("boardVO: " + boardVO);
	}
	
	// 조회수 업데이트
	@Test
	public void testReadCount() {
		Long board_no = 1L;
		int count = boardMapper.readCountUpdate(board_no);
		log.info("count : "+ count);
	}
	
}
