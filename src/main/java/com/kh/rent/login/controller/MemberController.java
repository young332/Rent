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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.rent.login.domain.FindIdDTO;
import com.kh.rent.login.domain.LoginDTO;
import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.login.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/login")
@Log4j
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;

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
		session.setAttribute("memberVO", memberVO);
		if(memberVO == null) {
			return;
		}
		model.addAttribute("loginInfo", memberVO);
		model.addAttribute("useCookie", loginDTO.getUseCookie());
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
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
		boolean result = memberService.registerPost(memberVO);
		log.info("result:" + result);
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
	public String resetPassword(String mem_id, String mem_email) {
		log.info("mem_email:" + mem_email);
		String uuid = UUID.randomUUID().toString();
		String mem_pw = uuid.substring(0,uuid.indexOf("-"));
		log.info("newPassword : " + mem_pw);
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				log.info("mimeMessage:" + mimeMessage);
				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage,
						false,
						"utf-8"
						);
				helper.setFrom("tgk3732@gmail.com");
				
				helper.setTo(mem_email);
				log.info("helper:" + helper);
				helper.setSubject("비밀번호 재설정");
				helper.setText("변경된 비밀번호 : " + mem_pw);
			}
		};
		mailSender.send(preparator);
		log.info("메일전송 완료");
		memberService.changePassword(LoginDTO.builder()
				.mem_id(mem_id)
				.mem_pw(mem_pw)
				.build());
		return"redirect:/login/login";
	}
	
	@GetMapping("/findId")
	public void findId() {
	}
	
	//아이디 찾기
	@PostMapping(value = "/findIdRun", consumes = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public String findIdRun(@RequestBody FindIdDTO findIdDTO) {
		System.out.println("findIdDTO:" + findIdDTO);
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
		log.info("count:" + count);
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
	
	
	
}