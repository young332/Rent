package com.kh.rent.admin.interceptor;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.kh.rent.admin.domain.MenuVO;
import com.kh.rent.admin.service.MenuService;
import com.kh.rent.login.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@Log4j
public class MenuInterceptor implements HandlerInterceptor{
	
	@Autowired
	private MenuService menuService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
        
//		String menu_id = request.getParameter("menu_id");
//		log.info("menu_id:"+ menu_id);
//		
//		List<MenuVO> topMenuList = menuService.getTopMenu();
//        List<MenuVO> subMenuList = menuService.getSubMenu(menu_id);
//        
//        log.info("IntertopMenuList:"+topMenuList);
//        log.info("IntersubMenuList:"+subMenuList);
//   
//        request.setAttribute("topMenuList", topMenuList);
//        request.setAttribute("subMenuList", subMenuList);
		
        return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		log.info("postHandle...");
		String path = request.getRequestURI();
		
		log.info("path:"+ path);
		String command = path.substring("/admin/".length());
		
		log.info("command:"+ command);
		String query = request.getQueryString();
		
		log.info("query:"+ query);
		String menu_id = "MENU001";
		if (query != null && !query.equals("")) {
			menu_id = query.split("=")[1];
		}
		log.info("menu_id:"+ menu_id);
		
//		String menu_id = (String)request.getAttribute("menu_id");
		
		Map<String,	Object> map = modelAndView.getModel();
		
		List<MenuVO> topMenuList = menuService.getTopMenu();
        List<MenuVO> subMenuList = menuService.getSubMenu(menu_id);
        
        
        log.info("IntertopMenuList:"+topMenuList);
        log.info("IntersubMenuList:"+subMenuList);
   
        map.put("topMenuList", topMenuList);
        map.put("subMenuList", subMenuList);

	}
}