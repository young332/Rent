package com.kh.rent.board.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	

	@GetMapping("/register")
	public void register() {
		log.info("register");
	}
	
	@PostMapping("/register")
	public String registerPost(BoardVO boardVO,RedirectAttributes rttr) {
		log.info("registerPost");
	 	int board_no = boardService.register(boardVO);
	 	rttr.addFlashAttribute("registerResult",board_no);
	 	log.info("board_no"+board_no);
		
		return "redirect:/board/list";
	}

	@GetMapping("/list")
	public String list(Model model) {
		log.info("list");
		List<BoardVO> list = boardService.getList();
		log.info(list);
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String formattedDateTime = now.format(formatter);
		model.addAttribute("dateTime",formattedDateTime);
		model.addAttribute("boardVO", list);
		log.info("model:" +  model);
		
		return "/board/list";
	}
	
	@GetMapping("/get")
	public void get(Long board_no,Model model) {
		log.info("modify");
		BoardVO boardVO = boardService.get(board_no);
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String formattedDateTime = now.format(formatter);
		model.addAttribute("dateTime",formattedDateTime);
		model.addAttribute("boardVO",boardVO);
		log.info("boardVO:" + boardVO);
	}
	
	@GetMapping("/readCount")
	public String readCount(@RequestParam Long board_no) {
		log.info("readCount");
		boardService.readCount(board_no);
		return "조회수 증가";
	}
	
	@GetMapping("/modify")
	public String showModifyForm(Long board_no, Model model) {
	    log.info("showModifyForm");
	    BoardVO boardVO = boardService.get(board_no);
	    model.addAttribute("boardVO", boardVO);
	    log.info("boardVOget: " + boardVO);
	    return "/board/modify"; // 수정 폼 페이지 경로 반환
	}
	
	
	@PostMapping("/modify")
	public String modify(BoardVO boardVO,RedirectAttributes rttr) {
		log.info("modifypost");
		log.info("updateboardVO :" + boardVO);
		int result = boardService.modify(boardVO);
		log.info("result : " + result);
		rttr.addFlashAttribute("modifyResult",result);
		
		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	public String remove(Long board_no, RedirectAttributes rttr) {
		log.info("remove");
		int result = boardService.remove(board_no);
		rttr.addFlashAttribute("removeResult" , result);
		return "redirect:/board/list";
	}
	
	
}
