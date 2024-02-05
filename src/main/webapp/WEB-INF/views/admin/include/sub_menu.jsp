<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 관리자 -->	   
                    <c:forEach var="topMenu" items="${topMenuList}" varStatus="status">
	                    <li 
	                    	<c:choose>
		                    	<c:when test="${param.menu_id eq topMenu.menu_id}">
		                    		class="sidenav-item open"
		                    	</c:when>
		                    	<c:otherwise>
		                    		class="sidenav-item"
		                    	</c:otherwise>
	                    		
	                    	</c:choose>
	                    >
	                        
							    <a href="${topMenu.menu_url}?menu_id=${topMenu.menu_id}" class="sidenav-link sidenav-toggle s-link">
							        <div>${topMenu.menu_name}</div>
							    </a>
							    <ul class="sidenav-menu">
		                        	<c:forEach var="subMenu" items="${subMenuList}" varStatus="sta">
			                            <c:if test="${subMenu.parent_menu_id eq topMenu.menu_id}"> 
						                    <li class="sidenav-item">
						                        <a href="${subMenu.menu_url}?menu_id=${subMenu.parent_menu_id}" class="sidenav-link">
						                            <div>${subMenu.menu_name}</div>
						                        </a>
						                    </li>
						                 </c:if> 
		                         	</c:forEach>
	                        	</ul>
	                    </li>
                    </c:forEach> 
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 관리자 -->	   
             <c:forEach var="topMenu" items="${topMenuList}" varStatus="status">
              <li 
              	<c:choose>
               	<c:when test="${param.menu_id eq topMenu.menu_id}">
               		class="sidenav-item open"
               	</c:when>
               	<c:otherwise>
               		class="sidenav-item"
               	</c:otherwise>
              		
              	</c:choose>
              >
                  
    <a href="${topMenu.menu_url}?menu_id=${topMenu.menu_id}" class="sidenav-link sidenav-toggle s-link">
        <div>${topMenu.menu_name}</div>
    </a>
    <ul class="sidenav-menu">
                   	<c:forEach var="subMenu" items="${subMenuList}" varStatus="sta">
                        <c:if test="${subMenu.parent_menu_id eq topMenu.menu_id}"> 
                   <li class="sidenav-item">
                       <a href="${subMenu.menu_url}?menu_id=${subMenu.parent_menu_id}" class="sidenav-link">
                           <div>${subMenu.menu_name}</div>
                       </a>
                   </li>
                </c:if> 
                    	</c:forEach>
                  	</ul>
              </li>
             </c:forEach> 
>>>>>>> 1acb91656b37999e32352432386f479c3f38ff84
