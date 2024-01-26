package com.kh.rent.login.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.rent.login.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@Log4j
public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
			log.info("preHandle..login");
			HttpSession session = request.getSession();
			MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
			if(memberVO != null) {
				session.removeAttribute("loginInfo");
			}
			return true;
		}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.info("postHandle..login");
		ModelMap map = (ModelMap)modelAndView.getModel();
		MemberVO memberVO = (MemberVO)map.get("loginInfo");
		Boolean useCookie =(Boolean)map.get("useCookie");
		modelAndView.setView(null);
		log.info("로그인 후 meberVO : " + memberVO);
		
		if(memberVO == null) { //로그인실패
			modelAndView.setViewName("redirect:/login/login");			
		} else { //로그인 성공
			HttpSession session = request.getSession();
			String targetLocation = (String)session.getAttribute("targetLocation");
			log.info("targetLocation:" + targetLocation);
			session.removeAttribute(targetLocation);
			
			if(targetLocation == null) {
				 
				modelAndView.setViewName("redirect:/");
			} else {
				modelAndView.setViewName("redirect:" + targetLocation);
				
			}
			request.getSession().setAttribute("loginInfo", memberVO);
			
			//아이디저장
			if(useCookie != null && useCookie == true) {
				Cookie cookie = new Cookie("saveId", memberVO.getMem_id());
				cookie.setMaxAge(60 * 60 * 24 * 7);
				response.addCookie(cookie);
			}
		}
	}
	
}
