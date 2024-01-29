<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/top.jsp" %>

<!-- 주소찾기 -->
  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.min.js" /></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<!-- /주소찾기 -->
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
	
	
}); 
</script>

    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/resources/carbook-master/images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs">
          	<span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> 
          	<span class="mr-2"><a href="/myPage/myPage">마이페이지 <i class="ion-ios-arrow-forward"></i></a></span> 
          	<span class="mr-2">내 정보 관리 <i class="ion-ios-arrow-forward"></i></span> 
          	</p>
            <h1 class="mb-3 bread">내 정보 관리</h1>
          </div>
        </div>
      </div>
    </section>
<%-- ${loginInfo} --%>
    <section class="ftco-section">
		<div class="container">
			<div class="row">
   				<div class="col-md-8">
    				<h3>
						내 정보 - 수정
					</h3>
					<br>
					<div class="container">
					  <form action="/action_page.php">
					    <div class="form-group">
					      <label for="id">아이디</label>
					      <input type="text" class="form-control" id="id" name="id" value="${loginInfo.mem_id}" readonly>
					    </div>
					    <div class="form-group">
					      <label for="pwd">비밀번호</label>
					   	  <div style="display: flex; align-items: center;">
					      	<input type="password" class="form-control" id="password" name="password" 
					      		   value="${loginInfo.mem_pw}" style="margin-right: 10px;" readonly>
					     	<button type="button" id="pwdChange" class="btn btn-primary" style="flex-shrink: 0;">비밀번호 변경</button>
					      </div>
					    </div>
					    <div class="form-group">
					      <label for="name">이름</label>
					      <input type="text" class="form-control" id="name" name="name" value="${loginInfo.mem_name}" readonly>
					    </div>
					    <div class="form-group">
					      <label for="birthDay">생년월일</label>
					      <input type="date" class="form-control" id="birthDay" name="birthDay" value="${loginInfo.mem_birth}">
					    </div>
					    <div class="form-group">
					      <label for="phoneNumber">휴대폰 번호</label>
					      <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="${loginInfo.mem_phone}">
					    </div>
					    <div class="form-group">
					      <label for="email">이메일</label>
					      <input type="email" class="form-control" id="email" name="email" value="${loginInfo.mem_email}">
					    </div>
					    <div class="form-group">
			              <small>주소</small>
			              <div class="input-group" style="align-items: center;">
			              	<input type="text"  class="form-control"  id="mem_zip_code" name="mem_zip_code" 
			              		   value="${loginInfo.mem_zip_code}" style="margin-right: 10px;" readonly>
							<span class="input-group-btn">
							<input type="button"  onclick="openZipSearch();" value="우편번호 찾기" class="btn btn-secondary" >
							</span>
							</div>
							<input type="text" class="form-control" id="mem_addr" name="mem_addr" readonly="readonly" value="${loginInfo.mem_addr}">
			              </div>
					  </form>
					</div>
					<hr>
					<button id="btn-updateInfo" class="btn btn-primary">수정완료</button>
			  	
				</div>
   			</div>
   		</div>
	</section>

<!-- 회원탈퇴 버튼 클릭시 보여질 Modal -->
    <div class="modal fade" id="modal-delForm">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">회원탈퇴</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <form action="" method="post">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div align="center">
                            탈퇴 후 복구가 불가능합니다. <br>
                            정말로 탈퇴 하시겠습니까? <br>
                        </div>
                        <br>
                            <label for="userPwd" class="mr-sm-2">비밀번호 : </label>
                            <input type="password" class="form-control mb-2 mr-sm-2" placeholder="비밀번호 입력" id="userPwd" name="userPwd"> <br>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                        <button type="button" class="btn btn-danger" id="btn-delete-save">탈퇴하기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
	<!-- 비밀번호 변경 모달창 -->
	<div class="row">
	<div class="col-md-12">
		<div class="modal fade" id="modal-reply" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
						<label for="pwd">변경 비밀번호</label>
						<input type="password" class="form-control" id="pwd_change">
						<label for="pwd">변경 비밀번호 확인</label>
						<input type="password" class="form-control" id="pwd_check">
					</div>
					<div class="modal-footer">
						 
						<button type="button" class="btn btn-primary" id="btn-reply-save">
							저장
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
<!-- // 비밀번호 변경 모달창 -->


<%@ include file="/WEB-INF/views/include/bottom.jsp" %>