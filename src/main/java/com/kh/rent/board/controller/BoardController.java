package com.kh.rent.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.rent.board.domain.BoardVO;
import com.kh.rent.board.domain.Criteria;
import com.kh.rent.board.domain.PageDTO;
import com.kh.rent.board.service.BoardService;
import com.kh.rent.point.domain.PointVO;
import com.kh.rent.point.service.PointService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board")
@Log4j
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private PointService pointService;
	
	// 글 목록 가져오기
	@SuppressWarnings("unchecked")
	@GetMapping("/list")
	public void list(HttpSession session, Model model ,Criteria cri) {
		log.info("list");

		List<BoardVO> noticeList = boardService.getNotice();
		Map<String, Object> boardMap = boardService.getList(cri);
		log.info("boardMap:" + boardMap);
		List<BoardVO> boardList = (List<BoardVO>) boardMap.get("boardList");
		int total = (Integer)boardMap.get("total");
		PageDTO pageDTO = new PageDTO(cri, total);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageDTO", pageDTO);
		
		log.info("boardList:" + boardList);;

		
	}
	
	// 글 등록 페이지
	@GetMapping("/register")
	public void register() {
		log.info("register");
	}
	
	// 글 등록하기
	@PostMapping("/register")
	public String registerPost(BoardVO boardVO,RedirectAttributes rttr) {
		log.info("registerPost...");
	 	int result = boardService.register(boardVO);
	 	rttr.addFlashAttribute("registerResult",result);
	 	log.info("result" + result);
	 	
	 	// 글등록 포인트 기록 추가
 		PointVO pointVO = PointVO.builder()
 				.point_user_id(boardVO.getBoard_mem_id())
 				.point_code("POINT_B")
 				.point_cost(30000)
 				.build();
 		if (result == 1) {
 			pointService.addPointTable(pointVO);
 		}
		
		return "redirect:/board/list";
	}
	
	// 글 하나 가져오기
	@GetMapping("/get")
	public void get(Long board_no, Model model, Criteria cri) {
		log.info("boardGet...");
		
		BoardVO boardVO = boardService.get(board_no);
		
		PageDTO pageDTO = new PageDTO();
		pageDTO.setCriteria(cri);
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("boardVO",boardVO);
		log.info("boardVO:" + boardVO);
	}
	
	// 조회수 업데이트
	@GetMapping("/readCount")
	public String readCount(@RequestParam Long board_no) {
		log.info("readCount...");
		boardService.readCount(board_no);
		return "조회수 증가";
	}
	
	// 글 수정 페이지
	@GetMapping("/modify")
	public String showModifyForm(Long board_no, Model model) {
	    log.info("showModifyForm...");
	    BoardVO boardVO = boardService.get(board_no);
	   
	    model.addAttribute("boardVO", boardVO);
	    log.info("boardVOget: " + boardVO);
	    return "/board/modify"; // 수정 폼 페이지 경로 반환
	}
	
	// 글 수정하기
	@PostMapping("/modify")
	public String modify(BoardVO boardVO,RedirectAttributes rttr, Criteria cri) {
		log.info("modifypost...");
		log.info("updateboardVO :" + boardVO);
		int result = boardService.modify(boardVO);
		log.info("result : " + result);
		if (result == 1) {
			rttr.addFlashAttribute("pageNum",cri.getPageNum());
			rttr.addFlashAttribute("modifyResult",result);
			rttr.addAttribute("amount",cri.getAmount());
			rttr.addAttribute("type",cri.getType());
			rttr.addAttribute("keyword",cri.getKeyword());
			rttr.addAttribute("board_no", boardVO.getBoard_no());
	    	return "redirect:/board/get";
	    } else {
	        return "fail";
	    }
	}
	
	// 글 삭제하기
	@PostMapping("/remove")
	public String remove(Long board_no, RedirectAttributes rttr,Criteria cri) {
		log.info("remove...");
		BoardVO boardVO = boardService.get(board_no);
		int board_group = boardVO.getBoard_group();
		int board_seq = boardVO.getBoard_seq();
		String board_mem_id = boardVO.getBoard_mem_id();
		
		int result = boardService.remove(board_no, board_group, board_seq);
		
		// 글삭제 포인트 기록 추가
 		PointVO pointVO = PointVO.builder()
 				.point_user_id(board_mem_id)
 				.point_code("POINT_D")
 				.point_cost(-30000)
 				.build();
 		if (result == 1) {
 			pointService.addPointTable(pointVO);
 		}
		 		
		rttr.addFlashAttribute("removeResult" , result);
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		return "redirect:/board/list";
	}
	

	// 답글등록 페이지
	@GetMapping("/answer")
	public String answer(Long board_no, Model model) {
	    log.info("showAnswerGet...");
	    BoardVO parent = boardService.get(board_no);
	    model.addAttribute("parent", parent);
	    log.info("parent: " + parent);
	    return "/board/answer"; // 수정 폼 페이지 경로 반환
	}
	
	// 답글 등록하기
	@PostMapping("/answer.do")
	public String answerDo(BoardVO replyVO, Model model) {
		log.info("showAnswerPost...");
		log.info("replyVO:" + replyVO);
		// 1.부모글 정보 가져오기
		BoardVO parent = boardService.get(replyVO.getBoard_no());
		// 2.같은 board_group에 있는 글 중에서 부모글의 board_seq보다 큰 값들을 모두 +1해줌
		boardService.replySeqUpdate(parent);
		// 3.부모글의 board_seq을 꺼내와서 답글의 board_seq에 +1해서 넣어줌
		replyVO.setBoard_seq(parent.getBoard_seq()+1);
		// 4.부모글의 board_level을 꺼내와서 답글의 board_level에 +1해서 넣어줌
		replyVO.setBoard_level(parent.getBoard_level()+1);
		// 5.부모글의 board_group을 꺼내와서 답글(replyVO)의 board_group에 넣어줌
		replyVO.setBoard_group(parent.getBoard_group());
		// 6.답글을 테이블에 저장
		boardService.replyInsert(replyVO);
		log.info("replyVO:" + replyVO);
		
		return "redirect:/board/list";
	}
	

	//검색기능
//	@GetMapping(value = "/search", produces = MediaType.APPLICATION_JSON_VALUE)
//	@ResponseBody
//	public List<BoardVO> search(@RequestParam("type") String type, @RequestParam("keyword") String keyword){
//		log.info("search");
//		List<BoardVO> list = boardService.search(type, keyword);
//		log.info("list_search:" + list);
//		return list;
//	}
	
}
