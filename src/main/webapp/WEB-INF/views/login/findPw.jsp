<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/top.jsp" %>
<!-- top -->
    
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/resources/carbook-master/images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="/">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>비밀번호 찾기 <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-3 bread">로그인</h1>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section contact-section">
      <div class="container">
        <div class="row d-flex mb-5 contact-info justify-content-center">
        	
          <div class="col-md-6 block-9 mb-md-5">
         <div class="form-group">
          		<p style="font-size:30px;">비밀번호 찾기</p>
            </div>
            <div class="form-group">
            	<p>렌트카의 가입된 정보를 입력해주세요.</p>
            </div>
            <form class="user"  action="/login/resetPassword" method="post" class="bg-light p-5 contact-form">
            <div class="form-group">
              <div class="form-group">
              <small>아이디</small>
                <input type="text" id="mem_id" name="mem_id" class="form-control" placeholder="아이디를 입력해주세요." value="MEMBER01">
              </div> 
              <div class="form-group">
              	<small>이메일</small>
                <input type="email" id="mem_email"  name="mem_email" class="form-control" placeholder="이메일을 입력해주세요." value="khproject2309@gmail.com">
              </div>
              <div class="form-group">
                <button type="submit" class="btn btn-primary py-3 px-5">비밀번호 찾기</button>
              </div>
				<div class="loginBtns">
					<a href="/login/signUp" style="margin-right: 310px;">회원가입</a>
					<a href="/login/login" >로그인</a>
				</div>
				</div>
			</form>
          </div>
		</div>
      </div>
    </section>
	
<!-- bottom -->
<%@ include file="/WEB-INF/views/include/bottom.jsp" %>