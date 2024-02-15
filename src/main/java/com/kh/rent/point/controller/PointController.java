package com.kh.rent.point.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.point.domain.PointVO;
import com.kh.rent.point.service.PointService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/point/*")
public class PointController {
	
	@Autowired
	private PointService pointService;
	
	//포인트 충전
	@Transactional
	@PostMapping("/pointIn")
	public String pointIn(HttpSession session, MemberVO memberVO, PointVO pointVO, RedirectAttributes rttr) {
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		log.info("memberVO:" + memberVO);
		log.info("pointVO:"+ pointVO);
		
		int result = pointService.addPoint(memberVO);
		pointService.addPointTable(pointVO);
		rttr.addFlashAttribute("addResult", result);
		
		// 변경 결과에 따라 응답 반환
	    if (result == 1) {
	    	String mem_id = pointVO.getPoint_user_id();
	    	int newMemPoint = pointService.getMemPoint(mem_id);
	    	loginInfo.setMem_point(newMemPoint);
	    	return "redirect:/myPage/myPage";
	    } else {
	        return "fail";
	    }
	}
}
