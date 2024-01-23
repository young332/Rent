<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>자동차 예약하기 사이트</title>
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
	      <a class="navbar-brand" href="index.html">씽씽<span>렌트카</span></a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item active"><a href="#" class="nav-link">메인</a></li>
	          <li class="nav-item"><a href="/resources/carbook-master/about.html" class="nav-link">About</a></li>
	          <li class="nav-item"><a href="/resources/carbook-master/services.html" class="nav-link">Services</a></li>
	          <li class="nav-item"><a href="/resources/carbook-master/pricing.html" class="nav-link">Pricing</a></li>
	          <li class="nav-item"><a href="/resources/carbook-master/car.html" class="nav-link">Cars</a></li>
	          <li class="nav-item"><a href="/resources/carbook-master/blog.html" class="nav-link">Blog</a></li>
	          <li class="nav-item"><a href="/resources/carbook-master/contact.html" class="nav-link">Contact</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->
    
    <div class="hero-wrap ftco-degree-bg" style="background-image: url('/resources/carbook-master/images/volvo.png');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text justify-content-start align-items-center justify-content-center">
          <div class="col-lg-8 ftco-animate">
          	<div class="text w-100 text-center mb-md-5 pb-md-5">
	            <h1 class="mb-4"> 신속하고 &amp; 쉬운 자동차 렌트</h1>
	            <p style="font-size: 18px;">설명</p>
	            
            </div>
          </div>
        </div>
      </div>
    </div>

     <section class="ftco-section ftco-no-pt bg-light">
    	<div class="container">
    		<div class="row no-gutters">
    			<div class="col-md-12	featured-top">
    				<div class="row no-gutters">
	  					<div class="col-md-4 d-flex align-items-center">
	  						<form action="#" class="request-form ftco-animate bg-primary">
		          				<h2>자동차 렌트 예약</h2>
								<div class="form-group">
									<label for="" class="label">대여 장소</label> 
									<input type="text"
										class="form-control" placeholder="울산역" disabled>
								</div>
							
								<div class="d-flex">
									<div class="form-group mr-1">
										<label for="" class="label">대여일을 선택해주세요.</label> 
										<input
											type="datetime-local" class="form-control" id="book_pick_date"
											placeholder="대여 날짜">
									</div>

								</div>
								<div class="d-flex2">
									<div class="form-group ml-2">
										<label for="" class="label">반납일을 선택해주세요.</label> 
										<input
											type="datetime-local" class="form-control" id="book_off_date"
											placeholder="반납 날짜">
									</div>
								</div>
<!-- 								<div class="form-group"> -->
<!-- 									<label for="" class="label">차종<br> -->
<!-- 									<input type="checkbox"  name="cartype" value="소형">소형 -->
<!-- 									<input type="checkbox"  name="cartype" value="중형">중형  -->
<!-- 									<input type="checkbox"  name="cartype" value="대형">대형  -->
<!-- 									<input type="checkbox"  name="cartype" value="전기차">전기차 -->
<!-- 									</label> -->
<!-- 								</div> -->
<!-- 								<div class="form-group"> -->
<!-- 									<label for="" class="label">연료<br>  -->
<!-- 										<input type="checkbox"  name="fuel" value="가솔린">가솔린 -->
<!-- 										<input type="checkbox"  name="fuel" value="디젤">디젤 -->
<!-- 										<input type="checkbox"  name="fuel" value="하이브리드">하이브리드 -->
<!-- 										</label> -->
<!-- 								</div> -->
<!-- 								<div class="form-group"> -->
<!-- 									<label for="" class="label">제조사<br> -->
<!-- 										<input type="checkbox"  name="carcompany" value="현대">현대 -->
<!-- 										<input type="checkbox"  name="carcompany" value="기아">기아 -->
<!-- 									</label>   -->
									
<!-- 								</div> -->
								
<!-- 								<div class="form-group"> -->
<!-- 									<label for="" class="label">기타옵션<br>  -->
<!-- 										<input type="checkbox"  name="otheroptions" value="후방카메라">후방카메라 -->
<!-- 										<input type="checkbox"  name="otheroptions" value="블루투스">블루투스 -->
<!-- 										<input type="checkbox"  name="otheroptions" value="내비게이션">내비게이션 -->
<!-- 										<input type="checkbox"  name="otheroptions" value="유아카시트">유아카시트 -->
<!-- 									</label>  -->
									
<!-- 								</div> -->
								<div class="form-group">
									<button type="submit" id="btn-reservation"
										class="btn btn-secondary py-3 px-4"><a href="/resources/carbook-master/car.html">차량조회하고예약하기</a></button>
								</div>
								<div class="form-group">
<!-- 									<button type="submit" id="btn-reset" -->
<!-- 										class="btn btn-secondary py-3 px-4">초기화하기</button> -->
									<button type="submit" class="btn" id="btn-reset" style="background-color: white;">초기화하기</button>

								</div>
							</form>
	  					</div>
	  					<div class="col-md-8 d-flex align-items-center">
	  						<div class="services-wrap rounded-right w-100">
	  							<h3 class="heading-section mb-4"> 자동차를 렌트하는 더 나은 방법</h3>
	  							<div class="row d-flex mb-4">
					          <div class="col-md-4 d-flex align-self-stretch ftco-animate">
					            <div class="services w-100 text-center">
				              	<div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-route"></span></div>
				              	<div class="text w-100">
					                <h3 class="heading mb-2">픽업 위치를 선택하세요</h3>
				                </div>
					            </div>      
					          </div>
					          <div class="col-md-4 d-flex align-self-stretch ftco-animate">
					            <div class="services w-100 text-center">
				              	<div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-handshake"></span></div>
				              	<div class="text w-100">
					                <h3 class="heading mb-2">최고의 거래를 선택하세요</h3>
					              </div>
					            </div>      
					          </div>
					          <div class="col-md-4 d-flex align-self-stretch ftco-animate">
					            <div class="services w-100 text-center">
				              	<div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-rent"></span></div>
				              	<div class="text w-100">
					                <h3 class="heading mb-2">렌트카 예약하기</h3>
					              </div>
					            </div>      
					          </div>
					        </div>
					        <p><a href="/resources/carbook-master/car.html" class="btn btn-primary py-3 px-4">완벅한 자동차를 예약하세요.</a></p>
	  						</div>
	  					</div>
	  				</div>
				</div>
  		</div>
    </section>


    <section class="ftco-section ftco-no-pt bg-light">
    	<div class="container">
    		<div class="row justify-content-center">
          <div class="col-md-12 heading-section text-center ftco-animate mb-5">
          	<span class="subheading">우리가 제공하는</span>
            <h2 class="mb-2">주요 차량들</h2>
          </div>
        </div>
    		<div class="row">
    			<div class="col-md-12">
    				<div class="carousel-car owl-carousel">
    					<div class="item">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="img rounded d-flex align-items-end" style="background-image: url(/resources/carbook-master/images/hyun1.jpg);">
		    					</div>
		    					<div class="text">
		    						<h2 class="mb-0"><a href="#">엑스터</a></h2>
		    						<div class="d-flex mb-3">
			    						<span class="cat">현대자동차</span>
			    						<p class="price ml-auto">500000 <span>/day</span></p>
		    						</div>
		    						<p class="d-flex mb-0 d-block"><a href="#" class="btn btn-primary py-2 mr-1">예약하기</a> <a href="#" class="btn btn-secondary py-2 ml-1">세부사항</a></p>
		    					</div>
		    				</div>
    					</div>
    					<div class="item">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="img rounded d-flex align-items-end" style="background-image: url(/resources/carbook-master/images/hyun2.jpg);">
		    					</div>
		    					<div class="text">
		    						<h2 class="mb-0"><a href="#">그랜져</a></h2>
		    						<div class="d-flex mb-3">
			    						<span class="cat">현대자동차</span>
			    						<p class="price ml-auto">500 <span>/day</span></p>
		    						</div>
		    						<p class="d-flex mb-0 d-block"><a href="#" class="btn btn-primary py-2 mr-1">예약하기</a> <a href="#" class="btn btn-secondary py-2 ml-1">세부사항</a></p>
		    					</div>
		    				</div>
    					</div>
    					<div class="item">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="img rounded d-flex align-items-end" style="background-image: url(/resources/carbook-master/images/kia1.jpg);">
		    					</div>
		    					<div class="text">
		    						<h2 class="mb-0"><a href="#">스포티지</a></h2>
		    						<div class="d-flex mb-3">
			    						<span class="cat">KIA</span>
			    						<p class="price ml-auto">500 <span>/day</span></p>
		    						</div>
		    						<p class="d-flex mb-0 d-block"><a href="#" class="btn btn-primary py-2 mr-1">예약하기</a> <a href="#" class="btn btn-secondary py-2 ml-1">세부사항</a></p>
		    					</div>
		    				</div>
    					</div>
    					<div class="item">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="img rounded d-flex align-items-end" style="background-image: url(/resources/carbook-master/images/kia2.jpg);">
		    					</div>
		    					<div class="text">
		    						<h2 class="mb-0"><a href="#">쏘렌토</a></h2>
		    						<div class="d-flex mb-3">
			    						<span class="cat">KIA</span>
			    						<p class="price ml-auto">500 <span>/day</span></p>
		    						</div>
		    						<p class="d-flex mb-0 d-block"><a href="#" class="btn btn-primary py-2 mr-1">예약하기</a> <a href="#" class="btn btn-secondary py-2 ml-1">세부사항</a></p>
		    					</div>
		    				</div>
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
    </section>

    
  

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
<!--   <script src="/resources/js/bootstrap-datepicker.js"></script> -->
<!--   <script src="/resources/js/jquery.timepicker.min.js"></script> -->
  <script src="/resources/carbook-master/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="/resources/carbook-master/js/google-map.js"></script>
  <script src="/resources/carbook-master/js/main.js"></script>
    
  </body>
</html>