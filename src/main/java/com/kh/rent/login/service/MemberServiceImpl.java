package com.kh.rent.login.service;


import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.rent.login.domain.FindIdDTO;
import com.kh.rent.login.domain.LoginDTO;
import com.kh.rent.login.domain.MemberVO;
import com.kh.rent.login.mapper.MemberMapper;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public MemberVO login(LoginDTO loginDTO) {
		MemberVO memberVO = memberMapper.login(loginDTO);
		return memberVO;
	}

	@Override
	public boolean registerPost(MemberVO memberVO) {
		int count = memberMapper.registerPost(memberVO);
		if(count == 1) {
			return true;
		}
		return false;
	}

	@Override
	public String findMemberId(FindIdDTO findIdDTO) {
		String mem_id = memberMapper.findMemberId(findIdDTO);
		return mem_id;
	}

	@Override
	public void changePassword(LoginDTO loginDTO) {
		memberMapper.changePassword(loginDTO);
		
	}

	@Override //아이디 중복체크
	public int checkId(String mem_id) {
		int count = memberMapper.checkId(mem_id);
		return count;
	}

	@Override //문자인증
	public void checkSend(String mem_phone, int randomNumber) {
		String api_key = "NCSDWNNWYLA0BTWD";
	    String api_secret = "1LXFECAPZ4LFPUUIU9CRYSDHAQCUGPAN";
	   Message coolsms = new Message(api_key, api_secret);
	
	   HashMap<String, String> params = new HashMap<>();
	   //수신전화전호
	   params.put("To", mem_phone);  // 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	   //발신전화번호
	   params.put("from", "01089179442");
	   params.put("type", "SMS");
	   //문자 내용 입력
	   params.put("text", "렌트차 인증번호는 [" + randomNumber + "] 입니다.");
	   params.put("app_version", "test app 1.2"); //확인필요
	   try {
		   JSONObject obj = (JSONObject)coolsms.send(params);
		   
	   } catch(CoolsmsException e) {
		   
	   }
		
	}

	@Override
	public int checkPhone(String mem_phone) {
		int count = memberMapper.checkPhone(mem_phone);
		return count;
	}
	
	

}
