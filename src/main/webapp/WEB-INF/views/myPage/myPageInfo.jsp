<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/top.jsp" %>
<script src="/resources/js/myscript.js"></script>

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
function openZipSearch() {
    new daum.Postcode({
    	oncomplete: function(data) {    
		var addr = '';
		if (data.userSelectedType == 'R') {
			addr = data.roadAddress;
		} else {
			addr = data.jibunAddress;
		}

		$("#zip_code").val(data.zonecode);
		$("#addr").val(addr);
		$("#addr_dtl").val("");
		$("#addr_dtl").focus();
        }
    }).open();
}
</script>
   
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
   				<div class="col-md-8 ftco-animate">
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
					      <label for="birthDay">생년월일</label>
					      <input type="date" class="form-control" id="birthDay" name="birthDay" value="2000-01-01">
					    </div>
					    <div class="form-group">
					      <label for="phoneNumber">휴대폰 번호</label>
					      <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="010-1234-5678" readonly>
					    </div>
					    <div class="form-group">
					      <label for="email">이메일</label>
					      <input type="email" class="form-control" id="email" name="email" value="rent001@naver.com" readonly>
					    </div>
					    <div class="form-group">
		      	          <label for="address">주소</label>
	               	 	      <div class="input-group" >
						         <input type="text" class="form-control" id="zip_code" name="zip_code" readonly="readonly" placeholder="우편번호">
						         <span class="input-group-btn">
						            <input type="button" onclick="openZipSearch();" value="우편번호 찾기" class="btn btn-secondary">
							     </span>
							  </div>
						  <input type="text" class="form-control" id="addr" name="addr" onclick="openZipSearch();" readonly="readonly" placeholder="기본주소">
						  <input type="text" class="form-control" id="addr_dtl" name="addr_dtl" placeholder="상세주소">
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