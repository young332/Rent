<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<!-- 주소찾기 -->
  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.min.js" /></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 
<!-- /주소찾기 -->

<!-- 비밀번호 암호화 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.1.1/crypto-js.min.js"></script>

<!-- 비밀번호변경 유효성 검사 스크립트 include -->
<%@ include file="/WEB-INF/views/include/check_pw.jsp" %>

<script>
//주소 검색
function openZipSearch() {
    new daum.Postcode({
    	oncomplete: function(data) {     
		var addr = ''; 
		if (data.userSelectedType === 'R') { 
			addr = data.roadAddress;
		} else {
			addr = data.jibunAddress;
		}

		$("#mem_zip_code").val(data.zonecode);
		$("#mem_addr").val(addr);
		$("#mem_addr").focus();
        }
    }).open();
}

$(function() {
	
	// 비밀번호변경 모달열기
	$("#pwdChange").click(function() {
		$("#password1").val("");
		$("#newPassword").val("");
		$("#confirmPassword").val("");
		$("#invalid-message1").text("비밀번호는 영문 대/소문자, 숫자, 특수문자를 1개 이상 포함한 8~16자입니다.");
		$("#invalid-message2").hide();
		$("#modal-pwdChangeForm").modal("show");
	});
	
	// 비밀번호변경 처리
	$("#btn-pwdChange-save").click(function(e) {
// 		var password1 = $("#password1").val();
// 		console.log("password1:", password1);
		e.preventDefault();
		if ($("#invalid-message1").text() == "사용가능한 비밀번호입니다.") {
	        validatePasswordChangeForm(); // 폼 유효성 검사 실행
	    } else {
	    	alert("비밀번호 형식을 다시 확인해주세요.");
	    }
	});
	
}); 

</script>

<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/resources/carbook-master/img/top2.jpg'); background-size: cover; background-position: bottom center; height: 100vh; position: relative;">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs">
          	<span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> 
          	<span class="mr-2"><a href="/myPage/myPage">마이페이지 <i class="ion-ios-arrow-forward"></i></a></span> 
          	<span class="mr-2"><a href="/myPage/myPageInfo">내 정보 관리 <i class="ion-ios-arrow-forward"></i></a></span> 
          	<span class="mr-2">개인정보 수정 <i class="ion-ios-arrow-forward"></i></span> 
          	</p>
            <h1 class="mb-3 bread">개인정보 수정</h1>
          </div>
        </div>
      </div>
    </section>
<%-- ${loginInfo} --%>
    <section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-md-2">
				</div>
   				<div class="col-md-8">
    				<h3>
						내 정보 수정
					</h3>
					<br>
					<div class="container">
					  <form id="formModify" action="/myPage/memberModify_submit" method="post">
					    <div class="form-group">
					      <label for="id">아이디</label>
					      <input type="text" class="form-control" id="mem_id" name="mem_id" value="${loginInfo.mem_id}" readonly>
					    </div>
					    <div class="form-group">
						    <label for="pwd">비밀번호</label>
						    <div style="display: flex; align-items: center;">
					      	<input type="password" class="form-control" id="mem_pw" name="mem_pw" 
					      		   value="${loginInfo.mem_pw}" style="margin-right: 10px;" readonly>
					     	<button type="button" id="pwdChange" class="btn btn-primary" style="flex-shrink: 0;">변경</button>
					      </div>
						</div>
					    
					    <div class="form-group">
					      <label for="name">이름</label>
					      <input type="text" class="form-control" id="mem_name" name="mem_name" value="${loginInfo.mem_name}" readonly>
					    </div>
					    <div class="form-group">
					      <label for="birthDay">생년월일</label>
					      <input type="date" class="form-control" id="mem_birth" name="mem_birth" value="${loginInfo.mem_birth}" required>
					    </div>
					    <div class="form-group">
					      <label for="phoneNumber">휴대폰 번호</label>
					      <input type="text" class="form-control" id="mem_phone" name="mem_phone" value="${loginInfo.mem_phone}" required>
					    </div>
					    <div class="form-group">
					      <label for="email">이메일</label>
					      <input type="email" class="form-control" id="mem_email" name="mem_email" value="${loginInfo.mem_email}" required>
					    </div>
					    <div class="form-group">
			              <small>주소</small>
			              <div class="input-group" style="display: flex; align-items: center;">
			              	<input type="text"  class="form-control"  id="mem_zip_code" name="mem_zip_code" 
			              		   value="${loginInfo.mem_zip_code}" style="margin-right: 10px;" readonly>
							<span class="input-group-btn">
							<input type="button"  onclick="openZipSearch();" value="우편번호 찾기" class="btn btn-secondary">
							</span>
							</div>
							<input type="text" class="form-control" id="mem_addr" name="mem_addr" readonly="readonly" value="${loginInfo.mem_addr}">
			              </div>
						<hr>
						<button type="submit" class="btn btn-primary">수정완료</button>
					  </form>
					</div>
				</div>
				<div class="col-md-2">
				</div>
   			</div>
   		</div>
	</section>
	
	<!-- 비밀번호 변경 모달창 -->
		<div class="modal fade" id="modal-pwdChangeForm" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">
							비밀번호 변경
						</h5> 
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
						</div>
						<div class="modal-body">
							<label for="pwd">현재 비밀번호</label>
							<input type="password" class="form-control" id="password1">
						</div>
						<div class="modal-body">
							<label for="pwd">새 비밀번호</label>
							<input type="password" class="form-control" id="newPassword">
							<div id="invalid-message1"></div>
						</div>
						<div class="modal-body">
							<label for="pwd">새 비밀번호 확인</label>
							<input type="password" class="form-control" id="confirmPassword">
							<div id="invalid-message2">비밀번호가 일치하지 않습니다.</div>
	          		        <div id="invalid-message3">비밀번호를 입력하세요.</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary" id="btn-pwdChange-save">
								저장
							</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">
								닫기
							</button>
						</div>
				  </div>
			</div>
		</div>
	<!-- // 비밀번호 변경 모달창 -->

<%@ include file="/WEB-INF/views/include/bottom.jsp" %>