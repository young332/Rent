<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/top.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
$(function() {
	var registerResult = '${registerResult}';
	if (registerResult == 'true') {
		alert("회원 가입 성공");
	} else if(registerResult == "false"){
		alert("회원 가입 실패");
	}
		
});
</script>
<!-- top -->
    
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/resources/carbook-master/images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Contact <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-3 bread">로그인</h1>
          </div>
        </div>
      </div>
    </section>
<!-- 로그인 -->
    <section class="ftco-section contact-section">
      <div class="container">
		<div class="row d-flex mb-5 contact-info">

			<div class="col-md-6 block-9 mb-md-5">
				<form action="/login/loginPost" method="post"
					class="bg-light p-5 contact-form">
					<div class="form-group">
						<label>아이디</label> <input type="text" id="mem_id" name="mem_id"
							class="form-control" placeholder="아이디를 입력해주세요."> <input
							type="hidden" id="idmessage" class="idmessage" value="아이디 입력해주세요"
							readonly>
					</div>
					<div class="form-group">
						<label>비밀번호</label> <input type="password" name="mem_pw"
							id="mem_pw" class="form-control" placeholder="비밀번호를 입력해주세요."
							value="MEMBER01"> <input type="hidden" id="pwmessage"
							class="pwmessage" value="최소 8자 이상 입력해주세요." readonly>
					</div>
					<div class="form-group">
						<div class="custom-control custom-checkbox small">
							<input type="checkbox" class="custom-control-input"
								id="useCookie" name="useCookie"> <label
								class="custom-control-label" for="useCookie">아이디 저장</label>
						</div>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-primary py-3 px-5">로그인</button>
					</div>
					<div class="loginBtns">
						<a href="/login/findId" style="margin-right: 30px;">아이디찾기</a> <a
							href="/login/findPw" style="margin-right: 30px;">비밀번호찾기</a> <a
							href="/login/signUp">회원가입</a>
					</div>
				</form>
			</div>

			<!-- 왼쪽 -->
			<div class="col-md-6 block-9 mb-md-5">
				<form action="#" class="bg-light p-5 contact-form">
					<div class="form-group">
						<p style="font-size: 30px; margin-bottom: 20px;">비회원으로 예약하셨나요?</p>
					</div>
					<div class="form-group">
						<p style="margin-bottom: 150px;">발급된 예약번호로 예약내역을 확인해 보세요.</p>
						<div class="form-group">
							<button type="button" id="btnclick" onclick="showSwal();"
								class="btn btn-primary py-3 px-5">비회원 예약확인</button>
						</div>
						<!-- 예약번호,이름,휴대폰번호 비회원예약확인 -->
					</div>
				</form>
			</div>
			<div class="col-md-12 block-9 mb-md-5">
				<p>---------------------간편로그인---------------------</p>
				<br>
				<div class="form-group">
					<button type="button">
						<img alt="카카오로그인"
							src="/resources/carbook-master/images/btn_kakao.png"
							style="max-width: 100px; max-height: 50px;">
					</button>
					<button type="button">
						<img alt="네이버로그인"
							src="/resources/carbook-master/images/btn_naver.png"
							style="max-width: 100px; max-height: 50px;">
					</button>
				</div>
			</div>
		</div>
	</div>
		<!-- 로그인 -->
    </section>
	

    
<script>
$(function(){
	var loginResult = "${loginResult}";
	var registerResult = "${registerResult}";
	console.log("loginResult: " + loginResult);
	if(loginResult == "fail"){
		alert("아이디와 비밀번호를 다시 확인해주세요");
		$("#mid").focus();
	}
	
	//쿠키 아이디
	var cookie = document.cookie;
		console.log("cookie: ", cookie);
		var cookies = cookie.split(";");
		for (var v = 0; v < cookies.length; v++) {
			var aCookie = cookies[v].split("=");
			if (aCookie[0].trim() == "savedId") {
				var savedId = aCookie[1];
				console.log("savedId:", savedId);
				$("#mid").val(savedId);
				$("#mpw").focus();
				break;
			}
		}
	});
</script>    
    
<!-- bottom -->
<%@ include file="/WEB-INF/views/include/bottom.jsp" %>