package com.kh.rent.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String registerPost() {
		log.info("registerPost");
		return null;
	}

	@GetMapping("/list")
	public void list(Model model) {
		log.info("list");
		
		List<BoardVO> list = boardService.getList();
		model.addAttribute("board", list);
		log.info("model:" +  model);
	}
	
	@GetMapping({"/get","/modify"})
	public void get(Long board_no,Model model) {
		log.info("modify");
		BoardVO boardVO = boardService.get(board_no);
		model.addAttribute("boardVO",boardVO);
	}
	
	@GetMapping("/readCount")
	public String readCount(@RequestParam Long board_no) {
		log.info("readCount");
		boardService.readCount(board_no);
		return "조회수 증가";
	}
	
	@PostMapping("/modify")
	public String modify() {
		log.info("modifyPost");
		return null;
	}
	
	@PostMapping("/remove")
	public String remove() {
		log.info("remove");
		return null;
	}
	
	
}
