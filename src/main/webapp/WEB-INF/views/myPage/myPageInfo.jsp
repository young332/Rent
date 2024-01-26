<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/top.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
$(function() {
	// 회원정보 수정버튼
// 	$("#btn-updateInfo").click(function() {
// 		action = "/myPage/myPageInfo_modify";
// 		method = "post";
// 	});
	
	
	// 회원탈퇴 모달
	$("#btn-deleteInfo").click(function() {
		$("#modal-delForm").modal("show");
	});
	
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
					<div style="display: flex; justify-content: space-between; align-items: center;">
    				<h3>
						내 정보
					</h3>
					<a href="/myPage/myPageInfo_modify" class="btn btn-primary">회원정보 수정하기</a>
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
					  </form>
					</div>
					<hr>
					<button id="btn-deleteInfo" class="btn btn-danger">회원탈퇴</button>
			  	
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
                            <label for="userPwd" class="mr-sm-2">Password : </label>
                            <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter Password" id="userPwd" name=""> <br>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                        <button type="submit" class="btn btn-danger">탈퇴하기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


<%@ include file="/WEB-INF/views/include/bottom.jsp" %>