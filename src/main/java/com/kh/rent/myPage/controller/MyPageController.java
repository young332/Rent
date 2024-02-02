package com.kh.rent.myPage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.rent.login.domain.LoginDTO;
import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.myPage.domain.PWchangeDTO;
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
	public void myPage(HttpSession session, LoginDTO loginDTO, Model model) {
		log.info("myPageGet..");
		log.info("loginDTO:" + loginDTO);
	}
	
	@GetMapping("/myPageInfo")
	public void myPageInfo() {
		log.info("myPageInfo Get..");
	}
	
	@GetMapping("/myPageInfo_modify")
	public void myPageInfo_modifyGet() {
		log.info("myPageInfo_modify Get..");
	}
	
	@Transactional
	@PostMapping("/memberModify_submit")
	public String myPageInfo_modifyPost(HttpSession session, HttpServletRequest request,
										MemberVO updateVO, RedirectAttributes rttr) {
		log.info("updateVO:" + updateVO);
		int result = myPageService.updateMember(updateVO);
		rttr.addFlashAttribute("modifyResult", result);
		// 변경 결과에 따라 응답 반환
	    if (result == 1) {
	    	request.getSession().setAttribute("loginInfo", updateVO);
	    	return "redirect:/myPage/myPageInfo";
	    } else {
	        return "fail";
	    }
	}
	
	
	// 비밀번호 변경
	@Transactional
	@PutMapping("/pwdChange")
	public ResponseEntity<String> pwdChange(HttpSession session, @RequestBody PWchangeDTO pwChangeDTO) {
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
	    // 비밀번호 변경 로직 수행
	    int result = myPageService.changePassword(pwChangeDTO);

	    // 변경 결과에 따라 응답 반환
	    if (result == 1) {
	    	loginInfo.setMem_pw(pwChangeDTO.getNewPassword());
	        return ResponseEntity.ok("success");
	    } else {
	        return ResponseEntity.ok("fail");
	    }
	}
	
	
	// 회원탈퇴
	@DeleteMapping("/delete/{mem_id}")
	@ResponseBody
	@Transactional
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
