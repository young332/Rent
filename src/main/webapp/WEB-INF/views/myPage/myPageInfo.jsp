<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/top.jsp" %>
<script src="/resources/js/myscript.js"></script>
    
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/resources/carbook-master/images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>마이페이지 <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-3 bread">마이페이지</h1>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section">
		<div class="container">
			<div class="row">
   				<div class="col-md-12 ftco-animate">
    				<h3>
						내 정보 관리
					</h3><br>
					<div class="container">
					  <form action="/action_page.php">
					    <div class="form-group">
					      <label for="id">아이디</label>
					      <input type="text" class="form-control" id="id" name="id" value="Hong" readonly>
					    </div>
					    <div class="form-group">
					      <label for="pwd">비밀번호</label>
					      <input type="password" class="form-control" id="password" name="password" value="1234" readonly>
					    </div>
					    <div class="form-group">
					      <label for="name">이름</label>
					      <input type="text" class="form-control" id="name" name="name" value="홍길동" readonly>
					    </div>
					    <div class="form-group">
					      <label for="usr">생년월일</label>
					      <input type="date" class="form-control" id="birthDay" name="birthDay" value="2000-01-01">
					    </div>
					    <div class="form-group">
					      <label for="usr">휴대폰 번호</label>
					      <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="010-1234-5678" readonly>
					    </div>
					    <div class="form-group">
					      <label for="email">이메일</label>
					      <input type="email" class="form-control" id="email" name="email" value="rent001@naver.com" readonly>
					    </div>
					  </form>
					</div>
					<hr>
					<button type="button" class="btn btn-primary">수정하기</button>
					<button type="button" class="btn btn-danger">회원탈퇴</button>
			  	
				</div>
   			</div>
   		</div>
	</section>


<%@ include file="/WEB-INF/views/include/bottom.jsp" %>