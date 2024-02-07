package com.kh.rent.admin.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.rent.login.domain.MemberVO;
import com.thoughtworks.qdox.model.Member;

import lombok.extern.log4j.Log4j;

@Log4j
public class AdAuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("preHandle.....preHandle");
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("loginInfo");
		if(memberVO == null) {
			saveTargetLocation(request);
			response.sendRedirect("/admin/login");
			return false;
		}
		return true;
	}
	
	private void saveTargetLocation(HttpServletRequest request) {
		String uri = request.getRequestURI();
		log.info("uri:" + uri);
		String query = request.getQueryString();
		log.info("query:" + query);
		String method = request.getMethod();
		log.info("method:" + method);
		if(method.equals("GET")) {
			if(query == null || query.equals("null")) {
				query = "";
			} else {
				query = "?" + query;
			}
			String targetLocation = uri + query;
			log.info("targetLocation:" + targetLocation);
			request.getSession().setAttribute("targetLocation", targetLocation);
		}
		
	}
}
