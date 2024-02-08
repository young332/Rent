<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/top.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 네이버로 로그인 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<!-- 카카오톡 로그인 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>


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
		
		
		$("#btn-Non-member").click(function(){
			console.log("클릭");
			$("#modal-Non-member").modal("show");
		});
	
		//모달 유효성
		$("#frmLoginbtn").submit(function(e){
			e.preventDefault();
			var name = $("#non_name").val();
			var tel = $("#non_tel").val();
			
			if(name == "" || tel == ""){
				alert("이름과 전화번호를 모두 입력해주세요");
				return false;
			}
			
			var telRegex = /^(01[016789]{1})[0-9]{3,4}[0-9]{4}$/;
			if(tel.length != 11 || !telRegex.test(tel)){
				alert("전화번호는 숫자, 11자리 입력해주세요");
				return false;
			}
			
			this.submit();
		
		});
		
	$(function(){
		var nonLoginResult = "${nonLoginResult}";
		if(nonLoginResult == "fail"){
			alert("이름과 전화번호를 다시 확인해주세요");
			$("#non_name").focus();
			
			}
	});	
		

});	
</script>
<!-- top -->
    
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/resources/carbook-master/images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="/">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>로그인 <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-3 bread">로그인</h1>
<!--             <button type="button" id="btn_logout">로그아웃</button> -->
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
						<input type="text" id="mem_id" name="mem_id" class="form-control" placeholder="아이디를 입력해주세요."> 
						<input type="hidden" id="idmessage" class="idmessage" value="아이디 입력해주세요" readonly>
					</div>
					<div class="form-group">
						<label>비밀번호</label> <input type="password" name="mem_pw" id="mem_pw" class="form-control" placeholder="비밀번호를 입력해주세요."> 
							<input type="hidden" id="pwmessage" class="pwmessage" value="최소 8자 이상 입력해주세요." readonly>
					</div>
					<div class="form-group">
						<div class="custom-control custom-checkbox small">
							<input type="checkbox" class="custom-control-input" id="useCookie" name="useCookie"> 
							<label class="custom-control-label" for="useCookie">아이디 저장</label>
						</div>
					</div>
					<div class="row d-flex mb-5 contact-info" style="justify-content: center; align-items: center;">
					<div class="form-group" style="display: flex;">
						<button type="submit" class="btn btn-primary py-3 px-5">로그인</button>
					</div>
					</div>
					<div class="row d-flex mb-5 contact-info" style="justify-content: center; align-items: center;">
					<div class="loginBtns" style="display: flex;">
						<a href="/login/signUp" style="margin-right: 80px;">회원가입</a>
						<a href="/login/findId" style="margin-right: 20px;">아이디찾기</a> 
						<a href="/login/findPw">비밀번호찾기</a>
					</div>
					</div>
				</form>
			</c:if>
			</div>
			<!-- 왼쪽 -->
			<div class="col-md-6 block-9 mb-md-5">
			<c:if test="${nonMemberLoginDTO == null}">
				<form action="#" class="bg-light p-5 contact-form">
					<div class="form-group">
						<p style="font-size: 30px; margin-bottom: 20px;">비회원으로 예약하셨나요?</p>
					</div>
					<div class="form-group">
						<p style="margin-bottom: 150px;">이름과 전화번호로 예약내역을 확인해 보세요.</p>
						<div class="form-group">
							<button type="button" id="btn-Non-member"class="btn btn-primary py-3 px-5">비회원 예약확인</button>
						</div>
						<!-- 예약번호,이름,휴대폰번호 비회원예약확인 -->
					</div>
				</form>
				</c:if>
			</div>
			<div class="col-md-12 block-9 mb-md-5">
				<p>---------------------간편로그인---------------------</p>
				<br>
				<form action="/login/naverLoginPost" method="post">
				<div class="form-group">
					<div id="naverIdLogin">
					<button type="submit" class="btn"  style="width: 80px; height: 60px;">
					<img src="/resources/carbook-master/images/btn_naver.png" style="width: 100%; height: 100%;" alt="Naver Login">
					</button>
					</div>
					<button type="button" class="btn"  style="width: 80px; height: 70px;">
					<img src="/resources/carbook-master/images/btn_kakao.png" style="width: 100%; height: 100%;" >
					</button>
					
					<button type="button" class="btn"  style="width: 80px; height: 70px;" onclick='location.href="'><img src="/resources/carbook-master/images/web_neutral_rd_na@1x.png" style="width: 100%; height: 100%;" ></button>
				</div>
			</form>
			</div>
		</div>
	</div>
<!-- 카카오 로그인 -->
<script>
Kakao.init('ad0e9d2b12012c07c7790d43080005cc'); // 사용하려는 앱의 JavaScript 키 입력
</script>
<!-- //카카오 -->	
<!-- 네이버 로그인 test -->
<script type="text/javascript">
        var naverLogin = new naver.LoginWithNaverId({
            clientId: "PX8yklCfbTPCekEdyMrO",
            callbackUrl: "http://localhost",
            isPopup: false, /* 팝업을 통한 연동처리 여부 */
            loginButton: {color: "green", type: 1, height: 50} /* 로그인 버튼의 타입을 지정 */
        }); /* 설정정보를 초기화하고 연동을 준비 */
        
//콜백
var naverLoginCallback = new naver.LoginWithNaverId({
            clientId: "PX8yklCfbTPCekEdyMrO", // 내꺼
            callbackUrl: "http://localhost",
            isPopup: true,
            callbackHandle: true
            /* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
        });

    /* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
   
    naverLoginCallback.init();
        
    /* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
    window.addEventListener('load', function () {
    	naverLogin.init();
    	console.log("Window loaded");
        naverLogin.getLoginStatus(function (status) {
        	console.log("Login Status:", status);
            if (status) {
                /* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */

                // 유저 아이디, 이메일 주소, 이름을 Session에 저장하였습니다.
                sessionStorage.setItem("user_info",naverLogin.user.id);
                sessionStorage.setItem("naver_email", naverLogin.user.getEmail());
                sessionStorage.setItem("naver_name", naverLogin.user.getName());
                console.log("User ID:", naverLogin.user.id);
                console.log("User Email:", naverLogin.user.getEmail());
                console.log("User Name:", naverLogin.user.getName());

                // 네이버 로그인과 카카오 로그인을 구분하기 위해 별도의 세션을 저장합니다.
                sessionStorage.setItem("kinds","naver");

                // 회원가입 혹은 로그인 시 처리하기 위한 페이지 입니다. 예를 들어 DB
                /* 인증이 완료된후 /sample/main.html 페이지로 이동하라는것이다. 본인 페이로 수정해야한다. */
                location.href = "/myPage/myPage";
                } else {
                console.log("callback 처리에 실패하였습니다.");
            }
        });
    });
    console.log("End of script");
    function logout() {
    	  sessionStorage.clear();

    	  naverLoginCallback.logout();

    	  location.href = "/"; 
    	}

//     	var logoutButton = document.getElementById('btn_logout');
//     	logoutButton.addEventListener('click', function () {
//     	  logout();
//     	});    
</script>	
<!-- //네이버 -->	
<!--// 로그인 -->
<!-- 비회원 모달 -->
	<div class="row">
		<div class="col-md-12">
			<div class="modal fade" id="modal-Non-member" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">비회원 예약조회</h5>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
							
						</div>
						<form  id="frmLoginbtn" class="user" action="/login/NonLoginPost" method="post"  >
							<div class="modal-body">
								<label>이름</label>
								<input type="text" class="form-control" id="non_name"  name="non_name"/>
							</div>
							<div class="modal-body">
								<label>전화번호</label>
								<input type="text" class="form-control" id="non_tel" name="non_tel" placeholder="'-'없이 입력해주세요."/>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary" id="frmLogin">예약조회</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">닫기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //모달 -->

</section>
	
<!-- bottom -->
<%@ include file="/WEB-INF/views/include/bottom.jsp" %>