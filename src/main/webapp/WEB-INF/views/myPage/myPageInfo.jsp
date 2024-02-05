<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/top.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
$(function() {
	// 회원탈퇴 모달
	$("#btn-deleteInfo").click(function() {
		$("#del_enter_pwd").val("");
		$("#modal-delForm").modal("show");
	});
	
	// 회원탈퇴 처리
	$("#btn-delete-save").click(function() {
		console.log("탈퇴하기 버튼");
		
		var mem_id = $("#id").val(); 
		var password = $("#password").val();
// 		console.log("password:", password);
		var del_enter_pwd = $("#del_enter_pwd").val();
// 		console.log("del_enter_pwd:", del_enter_pwd);

		if (del_enter_pwd.trim() == "") {
			alert("비밀번호를 입력하세요");
		} else if (password != del_enter_pwd) {
			alert("비밀번호가 맞지 않습니다.");
		} else if (password == del_enter_pwd) {
			console.log("비밀번호 일치확인")
			$.ajax({
	            method: "DELETE",
	            url: "/myPage/delete/" + mem_id,
	            success: function(rData) {
	                console.log("rData:", rData);
	                if (rData == "success") {
		                alert("회원탈퇴성공! 로그인 페이지로 이동합니다.");
		                $("#modal-delForm").modal("hide");
		                location.href = "/login/login";
	                } else if (rData == "fail") {
	                	alert("회원탈퇴실패!");
	                }
	                
	            },
	            error: function(xhr, status, error) {
                	alert("회원탈퇴실패!");
	                console.error("회원 삭제 실패:", error);
	            }
	        });
		}
	});
	
	var modifyResult = '${modifyResult}';
	if (modifyResult) {
		alert("회원정보 수정완료");
	}
	
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
				<div class="col-md-2">
				</div>
   				<div class="col-md-8">
					<div style="display: flex; justify-content: space-between; align-items: center;">
    				<h3>
						내 정보
					</h3>
					<a href="/myPage/myPageInfo_modify" class="btn btn-primary">회원정보 수정</a>
					</div>
					<br>
					<div class="container">
					  <form action="/action_page.php">
					    <div class="form-group">
					      <label for="id">아이디</label>
					      <input type="text" class="form-control" id="id" name="id" value="${loginInfo.mem_id}" readonly>
					    </div>
					    <div class="form-group">
					      <label for="pwd">비밀번호</label>
					      <input type="password" class="form-control" id="password" name="password" value="${loginInfo.mem_pw}" readonly>
					    </div>
					    <div class="form-group">
					      <label for="name">이름</label>
					      <input type="text" class="form-control" id="name" name="name" value="${loginInfo.mem_name}" readonly>
					    </div>
					    <div class="form-group">
					      <label for="birthDay">생년월일</label>
					      <input type="date" class="form-control" id="birthDay" name="birthDay" value="${loginInfo.mem_birth}" readonly>
					    </div>
					    <div class="form-group">
					      <label for="phoneNumber">휴대폰 번호</label>
					      <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="${loginInfo.mem_phone}" readonly>
					    </div>
					    <div class="form-group">
					      <label for="email">이메일</label>
					      <input type="email" class="form-control" id="email" name="email" value="${loginInfo.mem_email}" readonly>
					    </div>
					    <div class="form-group">
			              <small>주소</small>
			              	<div class="input-group">
			              	<input type="text"  class="form-control"  id="mem_zip_code" name="mem_zip_code" readonly="readonly" value="${loginInfo.mem_zip_code}" >
							</div>
							<input type="text" class="form-control" id="mem_addr" name="mem_addr" readonly="readonly" value="${loginInfo.mem_addr}">
		             	</div>
						<hr>
						<button type="button" id="btn-deleteInfo" class="btn btn-danger">회원탈퇴</button>
					  </form>
					</div>
			  	
				</div>
				<div class="col-md-2">
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
                            <input type="password" class="form-control mb-2 mr-sm-2" placeholder="비밀번호 입력" id="del_enter_pwd" name="del_enter_pwd"> <br>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                        <button type="button" class="btn btn-danger" id="btn-delete-save">탈퇴하기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


<%@ include file="/WEB-INF/views/include/bottom.jsp" %>