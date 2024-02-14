package com.kh.rent.admin.controller;


import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.rent.admin.service.AdBoardService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/board/*")
public class AdBoardController {
	
	@Autowired
	private AdBoardService boardService;

    @PostMapping("/deleteCheckedBoard")
    @ResponseBody
    public String deleteCheckedBoard(@RequestBody Map<String, Object> requestBody) {
        try {
            @SuppressWarnings("unchecked")
			List<Integer> boardNumbers = (List<Integer>) requestBody.get("boardNumbers");
            if (boardNumbers != null) {
                log.info("boardNumbers: " + boardNumbers);

                // boardNumbers 파라미터가 올바르게 전달되었는지 로깅합니다.
                int count = boardService.deleteCheckedBoard(boardNumbers);
                log.info("count"+count);
                if (count > 0) {
                    return "success";
                } else {
                    return "fail";
                }
                
            } else {
                return "Error";
            }
        } catch (Exception e) {
            log.error("Error occurred:", e);
            return "Error";
        }
    }

	
}
