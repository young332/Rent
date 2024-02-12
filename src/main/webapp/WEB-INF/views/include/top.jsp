<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>HAKA렌트카</title>
    
    <!-- 글리피콘 -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/resources/carbook-master/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/resources/carbook-master/css/animate.css">
    
    <link rel="stylesheet" href="/resources/carbook-master/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/carbook-master/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/carbook-master/css/magnific-popup.css">

    <link rel="stylesheet" href="/resources/carbook-master/css/aos.css">

    <link rel="stylesheet" href="/resources/carbook-master/css/ionicons.min.css">

    <link rel="stylesheet" href="/resources/carbook-master/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/resources/carbook-master/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="/resources/carbook-master/css/flaticon.css">
    <link rel="stylesheet" href="/resources/carbook-master/css/icomoon.css">
    <link rel="stylesheet" href="/resources/carbook-master/css/style.css">
  </head>
  <body>
    
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <!-- <a class="navbar-brand" href="/">렌트카<span>001</span></a> -->
	      <a class="navbar-brand" href="/"><img alt="logo" src="/resources/carbook-master/img/logo.png"></a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>
	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="/reserve/reserve" class="nav-link">예약</a></li>
	          <c:choose>
	          		<c:when test="${not empty nonMemberLoginDTO}">
	          			  <li class="nav-item"><a href="/myPage/reservationList_guest" class="nav-link">예약확인</a></li>
	          		</c:when>
	          		<c:otherwise>
	         			 <li class="nav-item"><a href="/myPage/reservationList" class="nav-link">예약확인</a></li>
	         		</c:otherwise>
	          </c:choose>
	          		<li class="nav-item"><a href="/board/list" class="nav-link">이용안내</a></li>
	          		<li class="nav-item"><a href="/customer.jsp" class="nav-link">고객센터</a></li>
			<c:choose>
				    <c:when test="${not empty nonMemberLoginDTO}">
				        <!-- 비회원으로 로그인한 경우 -->
				        <li class="nav-item"><a href="#" data-toggle="modal" data-target="#logoutmodal" class="nav-link">
				            <i class="fa fa-sign-out-alt"></i>
				        </a></li>
				    </c:when>
				    <c:when test="${not empty loginInfo}">
				        <!-- 회원으로 로그인한 경우 -->
				        <li class="nav-item"><a href="/myPage/myPage" class="nav-link">마이페이지</a></li>
				        <li class="nav-item"><a href="#" data-toggle="modal" data-target="#logoutmodal" class="nav-link">
				            <i class="fa fa-sign-out-alt"></i>
				        </a></li>
				    </c:when>
			    <c:otherwise>
			        <!-- 로그인 정보가 없는 경우 -->
			        <li class="nav-item"><a href="/login/login" class="nav-link">로그인</a></li>
			    </c:otherwise>
			</c:choose>
	       </ul>
	      </div>
	    </div>
	  </nav>
	  <!-- 로그아웃 모달 -->
	  	<div class="modal fade" id="logoutmodal" role="dialog"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="logoutModalLabel">로그아웃 하시겠어요?</h5> 
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">로그아웃시 로그인 페이지로 이동합니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button> 
							<a class="btn btn-primary"	href="/login/logout">로그아웃</a>
						</div>
					</div>
					
				</div>

			</div>
    <!-- END nav -->