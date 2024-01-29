package com.kh.rent.admin.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

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
        
		String menu_id = request.getParameter("menu_id");
		log.info("menu_id:"+ menu_id);
		
		List<MenuVO> topMenuList = menuService.getTopMenu();
        List<MenuVO> subMenuList = menuService.getSubMenu(menu_id);
        
        HttpSession session = request.getSession();
		List<MenuVO> MenuList = (List<MenuVO>)session.getAttribute("topMenuList");
        
		session.setAttribute("topMenuList", topMenuList);
		session.setAttribute("subMenuList", subMenuList);
        
        log.info("topMenuList:"+topMenuList);
        log.info("subMenuList:"+subMenuList);

        
        request.setAttribute("topMenuList", topMenuList);
        request.setAttribute("subMenuList", subMenuList);
		
        return true;
	}
}
