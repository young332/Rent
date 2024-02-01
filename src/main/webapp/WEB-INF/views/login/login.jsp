<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/top.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 네이버로 로그인 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script>
$(function(){
	var loginResult = "${loginFailure}";
	var registerResult = "${registerResult}";
	if(loginResult == "true"){
		alert("아이디와 비밀번호를 다시 확인해주세요");
		$("#mem_id").focus();
		}
	
		if(registerResult == "true"){
			alert("회원 가입 성공");
		} else if(registerResult == "false"){
			alert("회원 가입 실패");
		}

	//쿠키 아이디
	var cookie = document.cookie;
		console.log("cookie:",cookie);
		var cookies = cookie.split(";");
		console.log("cookies:" , cookies);
		for (var v = 0; v < cookies.length; v++) {
			var aCookie = cookies[v].split("=");
			if (aCookie[0].trim() == "savedId") {
				var savedId = aCookie[1];
				console.log("savedId:", savedId);
				$("#mem_id").val(savedId);
				$("#mem_pw").focus();
				break;
			}
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
			<c:if test="${signIn == null}">
				<form class=user action="/login/loginPost" method="post" class="bg-light p-5 contact-form">
					<div class="form-group">
						<label>아이디</label> 
						<input type="text" id="mem_id" name="mem_id" class="form-control" placeholder="아이디를 입력해주세요."> <input
							type="hidden" id="idmessage" class="idmessage" value="아이디 입력해주세요"
							readonly>
					</div>
					<div class="form-group">
						<label>비밀번호</label> <input type="password" name="mem_pw" id="mem_pw" class="form-control" placeholder="비밀번호를 입력해주세요."
							value="MEMBER01"> 
							<input type="hidden" id="pwmessage" class="pwmessage" value="최소 8자 이상 입력해주세요." readonly>
					</div>
					<div class="form-group">
						<div class="custom-control custom-checkbox small">
							<input type="checkbox" class="custom-control-input" id="useCookie" name="useCookie"> 
							<label class="custom-control-label" for="useCookie">아이디 저장</label>
						</div>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-primary py-3 px-5">로그인</button>
					</div>
					<div class="loginBtns">
						<a href="/login/findId" style="margin-right: 30px;">아이디찾기</a> 
						<a href="/login/findPw" style="margin-right: 30px;">비밀번호찾기</a>
						<a href="/login/signUp">회원가입</a>
					</div>
				</form>
			</c:if>
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
							<button type="button" id="btnclick"class="btn btn-primary py-3 px-5">비회원 예약확인</button>
						</div>
						<!-- 예약번호,이름,휴대폰번호 비회원예약확인 -->
					</div>
				</form>
			</div>
			<div class="col-md-12 block-9 mb-md-5">
				<p>---------------------간편로그인---------------------</p>
				<br>
				<form action="/login/naverLoginPost" method="post">
				<div class="form-group">
					<div id="naverIdLogin">
					<button type="button" class="btn"  style="width: 50x; height: 80px;" onclick='location.href="${urlNaver}"'><img src="/resources/carbook-master/images/btn_naver.png" style="width: 100%; height: 100%;" ></button>
					<button type="button" class="btn"  style="width: 50x; height: 80px;" onclick='location.href="'><img src="/resources/carbook-master/images/btn_kakao.png" style="width: 100%; height: 100%;" ></button>
					<button type="button" class="btn"  style="width: 50x; height: 80px;" onclick='location.href="'><img src="/resources/carbook-master/images/web_neutral_rd_na@1x.png" style="width: 100%; height: 100%;" ></button>
				  </div>
				</div>
			</form>
			</div>
		</div>
	</div>
<!--// 로그인 -->
<!-- 비회원 모달 -->
<div class="row">
		<div class="col-md-12">
			 <a id="modal-748842" href="#modal-container-748842" role="button" class="btn" data-toggle="modal">Launch demo modal</a>
			
			<div class="modal fade" id="modal-container-748842" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								비회원 예약조회
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
						<label>이름 : </label>
						<input type="text" id="non-members-name"/>
						</div>
						<div class="modal-body">
						<label>전화번호 : </label>
						<input type="text" id="non-members-phone"/>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary">
								예약조회
							</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">
								닫기
							</button>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>
<!-- //모달 -->

</section>
	
<!-- bottom -->
<%@ include file="/WEB-INF/views/include/bottom.jsp" %>