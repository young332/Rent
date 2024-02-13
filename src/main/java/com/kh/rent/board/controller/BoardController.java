package com.kh.rent.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.rent.board.domain.BoardVO;
import com.kh.rent.board.service.BoardService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board")
@Log4j
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	// 글 목록 가져오기
	@GetMapping("/list")
	public void list(HttpSession session, Model model) {
		log.info("list");
		
		List<BoardVO> noticeList = boardService.getNotice();
		List<BoardVO> boardList = boardService.getList();
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("boardList", boardList);
		
	}
	
	// 글 등록 페이지
	@GetMapping("/register")
	public void register() {
		log.info("register");
	}
	
	// 글 등록하기
	@PostMapping("/register")
	public String registerPost(BoardVO boardVO,RedirectAttributes rttr) {
		log.info("registerPost");
	 	int board_no = boardService.register(boardVO);
	 	rttr.addFlashAttribute("registerResult",board_no);
	 	log.info("board_no"+board_no);
		
		return "redirect:/board/list";
	}
	
	// 글 하나 가져오기
	@GetMapping("/get")
	public void get(Long board_no, Model model) {
		log.info("boardGet...");
		
		BoardVO boardVO = boardService.get(board_no);
		
		model.addAttribute("boardVO",boardVO);
		log.info("boardVO:" + boardVO);
	}
	
	// 조회수 업데이트
	@GetMapping("/readCount")
	public String readCount(@RequestParam Long board_no) {
		log.info("readCount");
		boardService.readCount(board_no);
		return "조회수 증가";
	}
	
	// 글 수정 페이지
	@GetMapping("/modify")
	public String showModifyForm(Long board_no, Model model) {
	    log.info("showModifyForm");
	    BoardVO boardVO = boardService.get(board_no);
	    model.addAttribute("boardVO", boardVO);
	    log.info("boardVOget: " + boardVO);
	    return "/board/modify"; // 수정 폼 페이지 경로 반환
	}
	
	// 글 수정하기
	@PostMapping("/modify")
	public String modify(BoardVO boardVO,RedirectAttributes rttr) {
		log.info("modifypost");
		log.info("updateboardVO :" + boardVO);
		int result = boardService.modify(boardVO);
		log.info("result : " + result);
		if (result == 1) {
			rttr.addFlashAttribute("modifyResult",result);
			rttr.addAttribute("board_no", boardVO.getBoard_no());
	    	return "redirect:/board/get";
	    } else {
	        return "fail";
	    }
	}
	
	// 글 삭제하기
	@PostMapping("/remove")
	public String remove(Long board_no, RedirectAttributes rttr) {
		log.info("remove");
		int result = boardService.remove(board_no);
		rttr.addFlashAttribute("removeResult" , result);
		return "redirect:/board/list";
	}
	

	// 답글페이지
	@GetMapping("/answer")
	public String answer(Long board_no, Model model) {
	    log.info("showModifyForm");
	    BoardVO boardVO = boardService.get(board_no);
	    model.addAttribute("boardVO", boardVO);
	    log.info("boardVOget: " + boardVO);
	    return "/board/answer"; // 수정 폼 페이지 경로 반환
	}
	

	//검색기능
	@GetMapping(value = "/search", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<BoardVO> search(@RequestParam("type") String type, @RequestParam("keyword") String keyword){
		log.info("search");
		List<BoardVO> list = boardService.search(type, keyword);
		log.info("list_search:" + list);
		return list;
	}
	
}
