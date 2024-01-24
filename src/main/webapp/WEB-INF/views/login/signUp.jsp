<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/top.jsp" %>
<!-- top -->
<!-- 주소 -->
  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.min.js" /></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">    
    
    
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
<script>
function openZipSearch() {
    new daum.Postcode({
    	oncomplete: function(data) {     
		var addr = ''; 
		if (data.userSelectedType === 'R') { 
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

    <section class="ftco-section contact-section">
      <div class="container">
        <div class="row d-flex mb-5 contact-info justify-content-center">
        	
          <div class="col-md-6 block-9 mb-md-5">
          <div class="form-group">
          		<p style="font-size:30px;">회원가입</p>
            </div>
            <form action="#" class="bg-light p-5 contact-form">
              <div class="form-group">
              <small>아이디</small>
                <input type="text" class="form-control">
              </div>  
                <div class="form-group">
                <button type="button" value="" class="btn btn-primary py-2 px-2">중복확인</button>
              </div>
              <div class="form-group">
              	<small>비밀번호</small>
                <input type="password" class="form-control" placeholder="영문 8~16이내">
                <p class="textErr" style="color: red;">입력하신 비밀번호는 올바른 형식이 아닙니다.</p>
              </div>
              <div class="form-group">
              	<small>비밀번호 확인</small>
                <input type="password" class="form-control" placeholder="확인을 위해 한번 더 입력해주세요.">
                <p class="textErr" style="color: red;">비밀번호가 서로 맞지 않습니다.</p>
              </div>
              <div class="form-group">
              <small>이름</small>
                <input type="text" class="form-control">
              </div>
              <div class="form-group">
              <small>생년월일</small>
             	 <input type="number" class="form-control" name="birthday">
             	 <p class="textErr" style="color: red;">'-'없이 숫자만 입력해주세요.</p>
              </div>
              <div class="form-group">
              <small>휴대폰</small>
                <input type="number" class="form-control">
              </div> 
              <div class="form-group">
              <small>이메일</small>
                <input type="email" class="form-control">
              </div>
              <div class="form-group">
              <small>주소</small>
              <br>
              	<input type="text"  id="zip_code" name="zip_code" readonly="readonly" placeholder="우편번호" style="width:320px;">
				<input type="button" onclick="openZipSearch();" value="우편번호 찾기">
				<input type="text"  id="addr" name="addr" onclick="openZipSearch();" readonly="readonly" placeholder="기본주소"  style="width:450px;">
				<input type="text"  id="addr_dtl" name="addr_dtl" placeholder="상세주소"  style="width:450px;">
              </div>
              
              <div class="form-group">
                <button type="button" value="" class="btn btn-primary py-3 px-5">완료</button>
              </div>
			</form>
          </div>
          </div>
		</div>
 
    </section>
	
<!-- bottom -->
<%@ include file="/WEB-INF/views/include/bottom.jsp" %>