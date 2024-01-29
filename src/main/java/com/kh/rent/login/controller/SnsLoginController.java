package com.kh.rent.login.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kh.rent.login.mapper.NaverLoginBO;

import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/sns")
@Log4j
public class SnsLoginController {

	
	//naverLoginBO
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@GetMapping("/login")
	public void login() {
		log.info("snsLogin");
		
	}
	
	//로그인 첫 화면 요청 메소드
	@PostMapping("/loginPost")
	public String login(Model model, HttpSession session) {
		//네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출
		String naverAuthUrl = naverLoginBO.getAuthourizationUrl(session);
		//인증요청문 확인
		log.info("네이버:" + naverAuthUrl);
		//객체 바인딩
		model.addAttribute("urlNaver",naverAuthUrl);
		
		//생성한 인증 url을 view로 전달
		return "/sns/login";
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
		
		//세션엥 사용자 정보등록
		session.setAttribute("singIn", apiResult);
		session.setAttribute("email", email);
		session.setAttribute("name", name);
		
		return "redirect:/login/login";
	}
}
