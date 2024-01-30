package com.kh.rent.login.controller;

import java.io.IOException;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
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

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kh.rent.login.domain.FindIdDTO;
import com.kh.rent.login.domain.LoginDTO;
import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.login.domain.NaverLoginBO;
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
	
	//naverLoginBO
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
			
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
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
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
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
	
//	//네이버 로그인
//	@RequestMapping("/naverLogin")
//	public String naverLogin() {
//		log.info("naverLogin");
//		return "/login/login";
//	}
		
	//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/naverLoginPost", method = {RequestMethod.GET, RequestMethod.POST})
	public String login(Model model, HttpSession session) {
		//네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출
		String naverAuthUrl = naverLoginBO.getAuthourizationUrl(session);
		//인증요청문 확인
		log.info("네이버:" + naverAuthUrl);
		//객체 바인딩
		model.addAttribute("urlNaver",naverAuthUrl);
		log.info("model:" + model);
			
		//생성한 인증 url을 view로 전달
		return "/login/login";
		}
		
		//네이버 로그인 성공시 callback호출 메소드
		@RequestMapping(value = "/callbackNaver", method = {RequestMethod.GET , RequestMethod.POST})
		public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws ParseException , IOException {
			log.info("로그인 성공 callbackNaver");
			OAuth2AccessToken oauthToken;
			oauthToken = naverLoginBO.getAccessToken(session, code, state);
			//로그인 사용자 정보를 읽어온다.
			apiResult = naverLoginBO.getUserProfile(oauthToken);
			
			/** apiResult json 구조		
			 * {"resultcode":"00",		
			 *  "message":"success",	
			 *  "response":{"id":"네이버아이디","nickname":"닉네임",
			 *  "email":"이메일","name":"이름"}}		
			 *  **/		
			
			//2. String형식인 apiResult를 json형태로 바꿈		
			JSONParser jsonParser = new JSONParser();		
			JSONObject jsonObj;
			
			jsonObj = (JSONObject) jsonParser.parse(apiResult);
			JSONObject response_obj = (JSONObject)jsonObj.get("response");
			
			//프로필조회
			String email = (String)response_obj.get("email");
			String name = (String)response_obj.get("name");
			
			//세션에 사용자 정보등록
			session.setAttribute("signIn", apiResult);
			session.setAttribute("email", email);
			session.setAttribute("name", name);
			
			return "redirect:/login/login";
		}
	
}