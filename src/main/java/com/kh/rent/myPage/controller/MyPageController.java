package com.kh.rent.myPage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.login.domain.NonMemberLoginDTO;
import com.kh.rent.myPage.domain.GetCarNameDTO;
import com.kh.rent.myPage.domain.GetStatusDTO;
import com.kh.rent.myPage.domain.PWchangeDTO;
import com.kh.rent.myPage.service.MyPageService;
import com.kh.rent.point.domain.PointDTO;
import com.kh.rent.point.service.PointService;
import com.kh.rent.reserve.domain.NonMemberVO;

import edu.emory.mathcs.backport.java.util.Arrays;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/myPage/*")
@Log4j
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private PointService pointService;
	
	// 예약확인 페이지
	@GetMapping("/reservationList")
	public void reservation(HttpSession session, Model model) {
		log.info("reservationListGet..");
		
		// 예약내역
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		String mem_id = loginInfo.getMem_id();
		myPageService.updateTBLReserve(mem_id);
		List<GetStatusDTO> reserveList = myPageService.getReserveList(mem_id);
		
		// 차종
		String[] carNames = new String[reserveList.size()];
		for (int i = 0; i < reserveList.size(); i++) {
			int rid = reserveList.get(i).getRes_rid();
			String car_id = reserveList.get(i).getRes_car_id();
			GetCarNameDTO getCarNameDTO = GetCarNameDTO.builder()
					.res_rid(rid)
					.res_car_id(car_id)
					.build();
			String car_name = myPageService.getCarName(getCarNameDTO);
			carNames[i] = car_name.toString();
		} 
		String carNamesToString = Arrays.toString(carNames);
		
		// 결제상태
		model.addAttribute("reserveList", reserveList);
		model.addAttribute("carNames", carNamesToString);
		
//		log.info("reserveList" + reserveList);
//		log.info("carNamesToString" + carNamesToString);
	}
	
	// 마이페이지
	@GetMapping("/myPage")
	public void myPage(HttpSession session, Model model) {
		log.info("myPageGet..");
		
		MemberVO loginInfo = (MemberVO)session.getAttribute("loginInfo");
		String mem_id = loginInfo.getMem_id();
		
		// 포인트 내역
		List<PointDTO> pointList = pointService.getPointList(mem_id);
//		log.info("pointList:" + pointList);
		
		// 예약내역
		myPageService.updateTBLReserve(mem_id);
		List<GetStatusDTO> reserveList = myPageService.getMyReserveList(mem_id);
		
		model.addAttribute("pointList", pointList);
		model.addAttribute("reserveList", reserveList);
	}
	
	// 내 정보관리 페이지
	@GetMapping("/myPageInfo")
	public void myPageInfo() {
		log.info("myPageInfo Get..");
	}
	
	// 내 정보 수정 페이지
	@GetMapping("/myPageInfo_modify")
	public void myPageInfo_modifyGet() {
		log.info("myPageInfo_modify Get..");
	}
	
	// 정보수정완료
	@Transactional
	@PostMapping("/memberModify_submit")
	public String myPageInfo_modifyPost(HttpSession session, MemberVO updateVO, RedirectAttributes rttr) {
		log.info("updateVO:" + updateVO);
		int result = myPageService.updateMember(updateVO);
		rttr.addFlashAttribute("modifyResult", result);
		// 변경 결과에 따라 응답 반환
	    if (result == 1) {
	    	session.setAttribute("loginInfo", updateVO);
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
		log.info("mem_id:" + pwChangeDTO.getMem_id());
		log.info("password:" + pwChangeDTO.getPassword());
		log.info("newPassword:" + pwChangeDTO.getNewPassword());
	    // 비밀번호 변경 로직 수행
	    int result = myPageService.changePassword(pwChangeDTO);
	    log.info("pwdChange result:" + result);
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
	
	// 예약취소
	@DeleteMapping("/res_cancel/{res_rid}")
	@ResponseBody
	@Transactional
	public String cancelReservation(@PathVariable("res_rid") int res_rid) {
		log.info("cancelReservation...");
		int count = myPageService.cancelReservation(res_rid);
		if (count == 1) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 비회원 예약페이지
	@GetMapping("/reservationList_guest")
	public void reservation_guest(HttpSession session, Model model) {
		log.info("reservation_guest...");
		
		NonMemberLoginDTO nonMemberLoginDTO = (NonMemberLoginDTO)session.getAttribute("nonMemberLoginDTO");
		myPageService.updateNonMember(nonMemberLoginDTO);
		List<NonMemberVO> nonMember = myPageService.getMemberList_non(nonMemberLoginDTO);
		log.info("nonMember:" + nonMember);
		
		// 차종
		String[] carNames = new String[nonMember.size()];
		for (int i = 0; i < nonMember.size(); i++) {
			int rid = nonMember.get(i).getNon_rid();
			String car_id = nonMember.get(i).getNon_car_id();
			GetCarNameDTO getCarNameDTO = GetCarNameDTO.builder()
					.res_rid(rid)
					.res_car_id(car_id)
					.build();
			String car_name = myPageService.getCarName_non(getCarNameDTO);
			carNames[i] = car_name.toString();
		} 
		String carNamesToString = Arrays.toString(carNames);
		
		model.addAttribute("nonMember", nonMember);
		model.addAttribute("carNames", carNamesToString);
	}
	
	// 예약취소(비회원)
	@DeleteMapping("/res_cancel_non/{non_rid}")
	@ResponseBody
	@Transactional
	public String cancelReservation_non(@PathVariable("non_rid") int non_rid) {
		log.info("cancelReservation_non...");
		int count = myPageService.cancelReservation_non(non_rid);
		if (count == 1) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 예약 건별 정보
	@GetMapping(value = "/getResInfo", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
    public List<GetStatusDTO> getResInfo(@RequestParam int res_rid) {
		System.out.println("get_res_rid: " + res_rid);
		List<GetStatusDTO> reserveList = myPageService.getMyResInfo(res_rid);
        return reserveList;
    }
	
}