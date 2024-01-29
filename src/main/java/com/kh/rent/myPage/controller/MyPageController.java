package com.kh.rent.myPage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.rent.login.domain.LoginDTO;
import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.myPage.domain.DeletedMemberVO;
import com.kh.rent.myPage.service.MyPageService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/myPage/*")
@Log4j
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;
	
	@GetMapping("/reservationList")
	public void reservation() {
		log.info("reservationListGet..");
	}
	
	@GetMapping("/myPage")
	public void myPage(LoginDTO loginDTO, Model model, HttpSession session) {
		log.info("myPageGet..");
		log.info("loginDTO:" + loginDTO);
	}
	
	@GetMapping("/myPageInfo")
	public void myPageInfo() {
		log.info("myPageInfo Get..");
	}
	
	@GetMapping("/myPageInfo_modify")
	public void myPageInfo_modify() {
		log.info("myPageInfo_modify get..");
	}
	
	@PostMapping("/modify")
	public void modifyInfo() {
		log.info("modifyInfo Post...");
	}
	
	// 회원탈퇴
	@DeleteMapping("/delete/{mem_id}")
	@ResponseBody
	public String deleteMember(HttpSession session, @PathVariable("mem_id") String mem_id) {
		log.info("deleteMember...");
		MemberVO deleteVO = myPageService.selectList(mem_id);
		log.info("deleteVO:" + deleteVO);
		myPageService.registerDelMember(deleteVO);
		log.info("deleteVO 등록완료");
		int count = myPageService.deleteMember(mem_id);
		if (count == 1) {
			session.invalidate();
			return "success";
		} else {
			return "fail";
		}
	}
}
