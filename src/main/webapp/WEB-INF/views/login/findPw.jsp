<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<!-- top -->
<script>
$(function(){
    var isValidEmail = false;

    $("#mem_email").blur(function(){
        var email = $(this).val().trim();
        console.log("email:", email);

        // 이메일 유효성 검사
        var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

        if (email === "" || !regExp.test(email)) {
            $("#dup-email").text("유효하지 않는 이메일 주소입니다.").css("color", "red");
            isValidEmail = false;
        } else {
            $("#dup-email").text("");
            isValidEmail = true;
        }
    });

    $("#frmFw").submit(function(){
//         e.preventDefault(); // 폼이 제출되는 것을 막음
        var inputId = $("#mem_id").val();
        var inputEmail = $("#mem_email").val();

        if (inputId.trim() == "") {
            alert("아이디를 입력해 주세요.");
            $("#mem_id").focus();
            return false;
        }
        if (inputEmail.length == 0) {
            alert("이메일을 입력해 주세요.");
            $("#mem_email").focus();
            return false;
        }

        // 아이디와 이메일이 모두 입력되었을 때 비밀번호 재설정 함수 호출
//         resetPassword(inputId, inputEmail);
    });

    // 비밀번호 재설정 AJAX 요청 함수
//     function resetPassword(mem_id, mem_email) {
//     // AJAX 요청 보내는 부분
//     $.ajax({
//         type: "POST",
//         url: "/login/resetPassword",
//         data: {
//             mem_id: mem_id,
//             mem_email: mem_email
//         },
//         success: function(response) {
//             console.log("응답:", response);
//             if (response === "emailSend") {
//                 alert("이메일로 비밀번호가 전송되었습니다.");
                
//             } else if (response === "noIdAndEmail") {
//                 alert("아이디와 이메일이 일치하지 않습니다. 다시 확인해주세요.");
//             } else {
//                 alert("알 수 없는 응답이 돌아왔습니다.");
//             }
//         },
//         error: function(xhr, status, error) {
//             console.error("비밀번호 재설정 실패:", error);
//        	 }
//    	 });
// 	}

    
    // 아이디와 이메일이 일치하지 않는 경우 확인
    <c:if test="${noIdAndEmail eq 'fail'}">
        alert("아이디와 이메일을 다시 확인해보세요.");
    </c:if>
    
});
</script>	   
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
            <form class="user"  action="/login/resetPassword" method="post" class="bg-light p-5 contact-form" id="frmFw">
            <div class="form-group">
              <div class="form-group">
              <small>아이디</small>
                <input type="text" id="mem_id" name="mem_id" class="form-control" placeholder="아이디를 입력해주세요.">
              </div> 
              <div class="form-group">
              	<small>이메일</small>
                <input type="email" id="mem_email"  name="mem_email" class="form-control" placeholder="이메일을 입력해주세요.">
              </div>
               <span id="dup-email"></span>
              <div class="form-group">
                <button type="submit" class="btn btn-primary py-3 px-5" >비밀번호 찾기</button>
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