<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/top.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/resources/carbook-master/images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="/">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>고객센터 <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-3 bread">고객센터</h1>
          </div>
        </div>
      </div>
    </section>
<style>
        .hidden-content {
            display: none;
        }
        .custom-cursor {
            cursor: pointer;
        }
    </style>    
<script>
$(function(){
	$("#reservationTitle").click(function(){
		console.log("클릭");
		$(".hidden-content").toggle();
	});
});
</script>     
    
     <section class="ftco-section ftco-no-pt bg-light">
     </section>
  <section class="ftco-section ftco-no-pt bg-light">
    	<div class="container">
    		<div class="row justify-content-center">
          <div class="col-md-12 heading-section text-center ftco-animate mb-5">
          <span class="subheading" style="font-size:14pt">렌트카001 고객센터입니다.</span>
            <h2 class="mb-2">무엇을 도와드릴까요?</h2>
          </div>
        </div>
    		<div class="row d-flex mb-5 contact-info" style="justify-content: center; align-items: center;">
    			<div style="display: flex;">
    					<div class="form-group" style="margin-right: 20px;">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="text">
		    						<h2 class="mb-0 custom-cursor" id="reservationTitle">예약 · 변경</h2>
		    					</div>
		    				</div>
    					</div>
    					<div class="form-group" style="margin-right: 20px;">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="text">
		    						<h2 class="mb-0"><a href="#">고장 · 사고</a></h2>
		    					</div>
		    				</div>
    					</div>
    					<div class="form-group" style="margin-right: 20px;">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="text">
		    						<h2 class="mb-0"><a href="#">보험</a></h2>
		    					</div>
		    				</div>
    					</div>
    					<div class="form-group" style="margin-right: 20px;">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="text">
		    						<h2 class="mb-0"><a href="#">유류비</a></h2>
		    					</div>
		    				</div>
    					</div>
    					<div class="form-group">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="text">
		    						<h2 class="mb-0"><a href="#">기타</a></h2>
		    					</div>
		    				</div>
    					</div>
    				</div>
    			</div>
    		</div>
     <div class="container hidden-content">
    		<div class="container">
    		<div class="row justify-content-center">
          <div class="col-md-12 heading-section text-center ftco-animate mb-5">
          <span class="subheading" style="font-size:14pt">자주 찾는 질문을 모아봤어요.</span>
          </div>
        </div>
    		<div class="row d-flex mb-5 contact-info" style="justify-content: center; align-items: center;">
    			<div >
    					<div class="form-group">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="text">
		    						<h2 class="mb-0">일정을 변경하고 싶어요.</h2>
		    					</div>
		    					<div class="text">
		    						<span class="mb-0">취소 후 다시 예약해주세요.</span>
		    					</div>
		    				</div>
    					</div>
    					<div class="form-group">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="text">
		    						<h2 class="mb-0">반납시간을 연장하고 싶어요.</h2>
		    					</div>
		    					<div class="text">
		    						<span class="mb-0">고객센터로 전화주세요.</span>
		    					</div>
		    				</div>
    					</div>
    					<div class="form-group">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="text">
		    						<h2 class="mb-0">예약확인 및 예약취소는 어떻게 하나요?</h2>
		    					</div>
		    					<div class="text">
		    						<span class="mb-0">메인 상담 '예약확인' 클릭
		    						(비회원일 경우  '로그인 → 비회원 예약학인' 클릭)</span>
		    					</div>
		    				</div>
    					</div>
    					<div class="form-group">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="text">
		    						<h2 class="mb-0">예약취소나 노쇼(No-show)시, 수수료는 얼마나 부과되나요?</h2>
		    					</div>
		    					<div class="text">
		    						<span class="mb-0">취소시간에 따라 수수료가 달라져요.</span>
		    					</div>
		    				</div>
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
            <h2 class="mb-2">이벤트</h2>
          </div>
        </div>
    		<div class="row">
    			<div class="col-md-12">
    				<div class="carousel-car owl-carousel">
    					<div class="item">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="img rounded d-flex align-items-end" style="background-image: url();">
		    					</div>
		    					<div class="text">
		    						<h2 class="mb-0"><a href="#">새해맞이 추가할인</a></h2>
		    						<div class="d-flex mb-3">
			    						<p class="price ml-auto">100,000<span>/포인트</span></p>
		    						</div>
		    					</div>
		    				</div>
    					</div>
    					<div class="item">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="img rounded d-flex align-items-end" style="background-image: url();">
		    					</div>
		    					<div class="text">
		    						<h2 class="mb-0"><a href="#">회원가입 시 포인트 무료충전</a></h2>
		    						<div class="d-flex mb-3">
			    						<p class="price ml-auto">100,000<span>/포인트</span></p>
		    						</div>
		    					</div>
		    				</div>
    					</div>
    					<div class="item">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="img rounded d-flex align-items-end" style="background-image: url();">
		    					</div>
		    					<div class="text">
		    						<h2 class="mb-0"><a href="#">2024년 설날 렌트카001와 함께</a></h2>
		    					</div>
		    				</div>
    					</div>
    					<div class="item">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="img rounded d-flex align-items-end" style="background-image: url();">
		    					</div>
		    					<div class="text">
		    						<h2 class="mb-0"><a href="#">쿠폰 룰렛 이벤트</a></h2>
		    						<div class="d-flex mb-3">
			    						<p class="price ml-auto">50,000<span>/포인트</span></p>
		    						</div>
		    					</div>
		    				</div>
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
    </section>

<%@ include file="/WEB-INF/views/include/bottom.jsp" %>