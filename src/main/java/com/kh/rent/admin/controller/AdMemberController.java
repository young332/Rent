package com.kh.rent.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.rent.admin.domain.PointDTO;
import com.kh.rent.admin.domain.Search;
import com.kh.rent.admin.service.AdMemberService;
import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.myPage.domain.PWchangeDTO;
import com.kh.rent.myPage.service.MyPageService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/member/*")
public class AdMemberController {
	
	@Autowired
	private AdMemberService adMemberService;
	
	
	@GetMapping(value = "/getMemberInfo", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
    public MemberVO getMemberInfo(@RequestParam String mem_id) {
		System.out.println("getMemberInfo mem_id: " + mem_id);
		MemberVO memberVO = adMemberService.selectMemberByid(mem_id);
        return memberVO;
    }
	
	@Transactional
	@PostMapping("/memberModify_submit")
	public String myPageInfo_modifyPost(HttpSession session, HttpServletRequest request,
										MemberVO updateVO, RedirectAttributes rttr) {
		log.info("updateVO:" + updateVO);
		int result = adMemberService.updateMember(updateVO);
		rttr.addFlashAttribute("modifyResult", result);
		// 변경 결과에 따라 응답 반환
	    if (result == 1) {
	    	
	    	return "redirect:/admin/member";
	    } else {
	        return "fail";
	    }
	}
	
	// 비밀번호 변경
	@Transactional
	@PutMapping("/pwdChange")
	public ResponseEntity<String> pwdChange(HttpSession session, @RequestBody PWchangeDTO pwChangeDTO) {
		//MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		log.info("mem_id:" + pwChangeDTO.getMem_id());
		log.info("password:" + pwChangeDTO.getPassword());
		log.info("newPassword:" + pwChangeDTO.getNewPassword());
	    // 비밀번호 변경 로직 수행
	    int result = adMemberService.changePassword(pwChangeDTO);
	    log.info("pwdChange result:" + result);
	    // 변경 결과에 따라 응답 반환
	    if (result == 1) {
	    	//로그인 한 회원 정보가 아닌 관리자가 수정하는 회원의 비밀번호 변경 
	    	pwChangeDTO.setPassword(pwChangeDTO.getNewPassword());
	        return ResponseEntity.ok("success");
	    } else {
	        return ResponseEntity.ok("fail");
	    }
	}
	
	//검색기능
	 @GetMapping(value = "/search", produces = MediaType.APPLICATION_JSON_VALUE)
	 @ResponseBody
	 public List<MemberVO> search(@RequestParam String type, @RequestParam String keyword) {
		 Search search = new Search(type, keyword);
		 search.setKeyword(keyword);
		 search.setType(type);
		 log.info("search:" +search);
		 List<MemberVO> MemberList = adMemberService.selectAllMember(search);
		 log.info("MemberList:"+MemberList);
		 return MemberList;
	 }
	 
	 //개별 포인트 내역
	 @GetMapping(value = "/getMemberPoint", produces = MediaType.APPLICATION_JSON_VALUE)
		@ResponseBody
	    public List<PointDTO> getMemberPoint(@RequestParam String mem_id) {
			System.out.println("getMemberPoint mem_id: " + mem_id);
			List<PointDTO> pointList = adMemberService.selectPointByid(mem_id);
	        return pointList;
	    }
	
	
	
	
}
