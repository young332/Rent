package com.kh.rent.login.util;

import javax.servlet.http.HttpServletRequest;


public class LocationUtil {
	public static void saveTargetLocation(HttpServletRequest request) {
		String uri = request.getRequestURI();
		String query = request.getQueryString();
		String method = request.getMethod();
		if(method.equals("GET")) {
			if(query == null || query.equals("null")) {
				query = "";
			} else {
				query = "?" + query;
			}
			String targetLocation = uri + query;
			request.getSession().setAttribute("targetLocation", targetLocation);
		}
		
	}
}
