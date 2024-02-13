package com.kh.rent.admin.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.rent.admin.service.AdBoardService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/board/")
public class AdBoardController {
	
	@Autowired
	private AdBoardService boardService;

    @PostMapping("/deleteCheckedBoard")
    @ResponseBody
    public String deleteCheckedBoard(@RequestParam List<Integer> boardNumbers) {
        try {
            int count = boardService.deleteCheckedBoard(boardNumbers);
            if (count == 1) {
                return "Success";
            } else {
                return "fail";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "Error";
        }
    }

	
}
