package com.kh.rent.login.controller;

import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.rent.login.domain.FindIdDTO;
import com.kh.rent.login.domain.FindPwDTO;
import com.kh.rent.login.domain.LoginDTO;
import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.login.domain.NonMemberLoginDTO;
import com.kh.rent.login.service.MemberService;
import com.kh.rent.login.service.Sha256;

import com.kh.rent.point.domain.PointVO;
import com.kh.rent.point.service.PointService;
import com.kh.rent.reserve.domain.NonMemberVO;

import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/login")
@Log4j
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private Sha256 sha256;
	
	@Autowired
	private PointService pointService;

	@GetMapping("/login")
	public void login() {
		log.info("login..");
	}
	
	//로그인
	@PostMapping("/loginPost")
	public void loginPost(LoginDTO loginDTO,Model model, HttpSession session) {
		log.info("loginDTO: " + loginDTO);
		MemberVO memberVO = memberService.login(loginDTO);
		log.info("memberVO: " + memberVO);
		session.setAttribute("loginInfo", memberVO);
		
		if(memberVO == null) {
			return;
		}
		model.addAttribute("loginInfo", memberVO);
		model.addAttribute("useCookie", loginDTO.getUseCookie());
		
	}
	//비회원조회
	@PostMapping("/NonLoginPost")
	public String NonMemberLogin(NonMemberLoginDTO nonMemberLoginDTO, HttpSession session, RedirectAttributes rttr) {
		log.info("nonMemberLoginDTO:" + nonMemberLoginDTO);
		int count  = memberService.NonMemberLogin(nonMemberLoginDTO);
		log.info("count:" + count);
		
		if(count > 0) {
			session.setAttribute("nonMemberLoginDTO", nonMemberLoginDTO);
			return "redirect:/myPage/reservationList_guest";
		}
		rttr.addFlashAttribute("nonLoginResult", "fail");
        return "redirect:/login/login";
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
//		session.removeAttribute("nonMemberVO");  // 세션에서 비회원 정보 제거
		session.invalidate();
		log.info("logout");
		return "redirect:/login/login";
	}
	
	@GetMapping("/signUp")
	public void signup() {
		log.info("signUp");
	}
	
	//회원가입
	@PostMapping("/signUpPost")
	public String singUpPost(MemberVO memberVO, RedirectAttributes rttr) {
		log.info("signUpPost...:");
		String encryptedPassword = sha256.encrypt(memberVO.getMem_pw());
		memberVO.setMem_pw(encryptedPassword);
		
		boolean result = memberService.registerPost(memberVO);
		log.info("result:" + result);
		
		// 회원가입 포인트 기록 추가
		PointVO pointVO = PointVO.builder()
				.point_user_id(memberVO.getMem_id())
				.point_code("POINT_J")
				.point_cost(100000)
				.build();
		if (result == true) {
			pointService.addPointTable(pointVO);
		}
		rttr.addFlashAttribute("registerResult", String.valueOf(true));
		return "redirect:/login/login";
	}
	
	@GetMapping("/findPw")
	public String findPw() {
		log.info("findpw");
		return "/login/findPw";
	}
	
	//비밀번호 재설정
	@PostMapping("/resetPassword")
	public String resetPassword(FindPwDTO findPwDTO,RedirectAttributes rttr) {
		log.info("mem_email:" + findPwDTO.getMem_email());
		
		int count = memberService.findByIdAndEmail(findPwDTO);
		
		 if (count > 0) { // 아이디와 이메일이 일치하는 경우
			 
			 String uuid = UUID.randomUUID().toString();
			 String mem_pw = uuid.substring(0,uuid.indexOf("-"));
			 log.info("newPassword : " + mem_pw);
			 
			 String encryptedPassword = sha256.encrypt(mem_pw); //암호화 저장
			 
			 
			 MimeMessagePreparator preparator = new MimeMessagePreparator() {
				 
				 @Override
				 public void prepare(MimeMessage mimeMessage) throws Exception {
					 log.info("mimeMessage:" + mimeMessage);
					 MimeMessageHelper helper = new MimeMessageHelper(mimeMessage,
							 false,
							 "utf-8"
							 );
					 helper.setFrom("khproject2309@gmail.com");
					 
					 helper.setTo(findPwDTO.getMem_email());
					 log.info("helper:" + helper);
					 helper.setSubject("비밀번호 재설정");
					 helper.setText("변경된 비밀번호 : " + mem_pw);
				 }
			 };
			 mailSender.send(preparator);
			 log.info("메일전송 완료");
			 memberService.changePassword(LoginDTO.builder()
					 .mem_id(findPwDTO.getMem_id())
					 .mem_pw(encryptedPassword)
					 .build());
			 
			 rttr.addFlashAttribute("emailSend" , true);
			 return"redirect:/login/login";
		 } else {
		 // 아이디와 이메일이 일치하지 않는 경우
	        rttr.addFlashAttribute("noIdAndEmail", "fail");
	        return"redirect:/login/findPw";
	    }
	}
	
	@GetMapping("/findId")
	public void findId() {
	}
	
	//아이디 찾기
	@PostMapping(value = "/findIdRun", consumes = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public String findIdRun(@RequestBody FindIdDTO findIdDTO) {
		log.info("findIdDTO:" + findIdDTO);
		String member_id = memberService.findMemberId(findIdDTO);
		return member_id;
	}
	
	//아이디 중복 체크
	@PostMapping(value = "/checkId")
	@ResponseBody
	public String checkId(@RequestBody String mem_id) {
		log.info("mem_id:" + mem_id);
		String checkRst;
		int idCnt = memberService.checkId(mem_id);
		log.info("idCnt:"+ idCnt);
		if(idCnt > 0) {
			checkRst = "F";
			log.info("checkRstF:"+ checkRst);
		}else {
			checkRst = "S";
			log.info("checkRstS:"+ checkRst);
		}
		return checkRst;
	}
	
	
	//휴대폰번호 중복 체크
	@ResponseBody
	@PostMapping(value = "/phoneCheck")
	public String checkPhone(@RequestBody String mem_phone) {
		log.info("mem_phone:" + mem_phone);
		int count = memberService.checkPhone(mem_phone);
		log.info("mem_phone_count:" + count);
		return Integer.toString(count);
	}
	
	//본인인증 문자
	@GetMapping("/phoneSend")
	@ResponseBody
	public String sendMS(String mem_phone) { //휴대폰 문자보내기
		
		int randomNumber = (int)((Math.random()*(9999-1000 + 1)) + 1000); //난수생성
		memberService.checkSend(mem_phone, randomNumber);
		log.info("mem_phone_send:" + mem_phone);
		log.info("randomNumber_send:" + randomNumber);
		return Integer.toString(randomNumber);
	}
	
	//이메일 중복체크
	@ResponseBody
	@PostMapping(value = "/emailCheck" )
	public String checkEmail(@RequestBody String mem_email) {
		log.info("mem_email:" + mem_email);
		int count = memberService.checkEmail(mem_email);
		log.info("email_count:" + count);
		return Integer.toString(count);
	}
	
	//카카오로그인
	@PostMapping("/kakaLogin")
	public String kakaLogin(MemberVO memberVO,Model model,HttpSession session) {
		log.info("kakaLogin");
		String mem_phoen = memberVO.getMem_phone();
		int result = memberService.checkPhone(mem_phoen);
		if(result == 0) {
			log.info("memberVO: " + memberVO);
			session.setAttribute("kakaoInfo", memberVO);
			return "redirect:/myPage/myPage";
		} else {
			MemberVO vo = memberService.getKakalInfo(memberVO);
			session.setAttribute("loginInfo", vo);
			return "redirect:/";
		}
		
	}
}