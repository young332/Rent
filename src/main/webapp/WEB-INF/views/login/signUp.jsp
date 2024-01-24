<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>

  	<!-- 주소 -->
  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.min.js" /></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
  
    <title>singup</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/resources/carbook-master/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/resources/carbook-master/css/animate.css">
    
    <link rel="stylesheet" href="/resources/carbook-master/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/carbook-master/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/carbook-master/css/magnific-popup.css">

    <link rel="stylesheet" href="/resources/carbook-master/css/aos.css">

    <link rel="stylesheet" href="/resources/carbook-master/css/ionicons.min.css">

    <link rel="stylesheet" href="/resources/carbook-master/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/resources/carbook-master/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="/resources/carbook-master/css/flaticon.css">
    <link rel="stylesheet" href="/resources/carbook-master/css/icomoon.css">
    <link rel="stylesheet" href="/resources/carbook-master/css/style.css">
  </head>
  <body>
    
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="index.html">Car<span>Book</span></a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="index.html" class="nav-link">Home</a></li>
	          <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
	          <li class="nav-item"><a href="services.html" class="nav-link">Services</a></li>
	          <li class="nav-item"><a href="pricing.html" class="nav-link">Pricing</a></li>
	          <li class="nav-item"><a href="car.html" class="nav-link">Cars</a></li>
	          <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
	          <li class="nav-item active"><a href="/login/loginin" class="nav-link">로그인</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->
    
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
	
    <footer class="ftco-footer ftco-bg-dark ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2"><a href="#" class="logo">Car<span>book</span></a></h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-5">
              <h2 class="ftco-heading-2">Information</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">About</a></li>
                <li><a href="#" class="py-2 d-block">Services</a></li>
                <li><a href="#" class="py-2 d-block">Term and Conditions</a></li>
                <li><a href="#" class="py-2 d-block">Best Price Guarantee</a></li>
                <li><a href="#" class="py-2 d-block">Privacy &amp; Cookies Policy</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Customer Support</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">FAQ</a></li>
                <li><a href="#" class="py-2 d-block">Payment Option</a></li>
                <li><a href="#" class="py-2 d-block">Booking Tips</a></li>
                <li><a href="#" class="py-2 d-block">How it works</a></li>
                <li><a href="#" class="py-2 d-block">Contact Us</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
          </div>
        </div>
      </div>
    </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="/resources/carbook-master/js/jquery.min.js"></script>
  <script src="/resources/carbook-master/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/resources/carbook-master/js/popper.min.js"></script>
  <script src="/resources/carbook-master/js/bootstrap.min.js"></script>
  <script src="/resources/carbook-master/js/jquery.easing.1.3.js"></script>
  <script src="/resources/carbook-master/js/jquery.waypoints.min.js"></script>
  <script src="/resources/carbook-master/js/jquery.stellar.min.js"></script>
  <script src="/resources/carbook-master/js/owl.carousel.min.js"></script>
  <script src="/resources/carbook-master/js/jquery.magnific-popup.min.js"></script>
  <script src="/resources/carbook-master/js/aos.js"></script>
  <script src="/resources/carbook-master/js/jquery.animateNumber.min.js"></script>
  <script src="/resources/carbook-master/js/bootstrap-datepicker.js"></script>
  <script src="/resources/carbook-master/js/jquery.timepicker.min.js"></script>
  <script src="/resources/carbook-master/js/scrollax.min.js"></script>
  <script src="/resources/carbook-master/js/main.js"></script>
  
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
  </body>
</html>