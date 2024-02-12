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
	//예약.변경
	$("#reservationTitle").click(function(){
		console.log("클릭");
		$("#reservationTitle-hidden").toggle();
		$("#breakdown-hidden, #insurance-hidden, #gascost-hidden, #etc-hidden").hide();
	});
	//고장.사고
	$("#breakdown").click(function(){
		console.log("클릭");
		$("#breakdown-hidden").toggle();
		$("#reservationTitle-hidden, #insurance-hidden, #gascost-hidden, #etc-hidden").hide();
	});
	//보험
	$("#insurance").click(function(){
		console.log("클릭");
		$("#insurance-hidden").toggle();
		$("#reservationTitle-hidden, #breakdown-hidden, #gascost-hidden, #etc-hidden").hide();
	});
	//유류비
	$("#gascost").click(function(){
		console.log("클릭");
		$("#gascost-hidden").toggle();
		 $("#reservationTitle-hidden, #breakdown-hidden, #insurance-hidden, #etc-hidden").hide();
	});
	//기타
	$("#etc").click(function(){
		console.log("클릭");
		$("#etc-hidden").toggle();
		$("#reservationTitle-hidden, #breakdown-hidden, #insurance-hidden, #gascost-hidden").hide();
	});
	
// 	$("#newyearPoint").click(function(){
// 		console.log("클릭");
// 		$("#modal-point-event").modal("show");
// 	});

	//이벤트3개 모달창 설정
	 $('.item-eventbox').click(function() {
        var itemId = $(this).attr('id');
        
        switch(itemId) {
            case 'newyearPoint':
                $("#modal-point-event").find('.modal-title').text('포인트 응모 이벤트');
                $("#modal-point-event").find('.modal-body').html('<img src="/resources/carbook-master/img/winning4.jpg" alt="Point Event Image">');
                break;
            case 'firstPoint':
                $("#modal-point-event").find('.modal-title').text('선착순 포인트 적립');
                $("#modal-point-event").find('.modal-body').html('<img src="/resources/carbook-master/img/winning5.png" alt="Point Event Image">');
                break;
            case 'joopPoint':
                $("#modal-point-event").find('.modal-title').text('포인트 줍줍 이벤트');
                $("#modal-point-event").find('.modal-body').html('<img src="/resources/carbook-master/img/winningg.png" alt="Point Event Image">');
                break;
        }
        
        $('#modal-point-event').modal('show');
    });

	//회원만 이벤트 참여
     var isLoggedIn = ${not empty loginInfo};
	
    $("#newyearPoint, #firstPoint, #joopPoint").click(function(){
        if (!isLoggedIn) {
            alert("이벤트는 회원 전용입니다. 로그인 후 이용해주세요.");
            window.location.href = "/login/login";
            return;
        }


    });
    //회원가입 적립이벤트
    $(function(){
        $(".item-joinevent").click(function(){
            var isLoggedIn = ${not empty loginInfo};
            if (isLoggedIn) {
                
                alert("이벤트는 비회원 전용입니다.");
                return false; 
            } else {
                
                alert("회원가입 시 포인트를 적립받을 수 있습니다.");
                window.location.href = "/login/signUp"; 
            }
        });
    });

	
});
</script>     
    
     <section class="ftco-section ftco-no-pt bg-light">
     </section>
  <section class="ftco-section ftco-no-pt bg-light">
    	<div class="container">
    		<div class="row justify-content-center">
          <div class="col-md-12 heading-section text-center ftco-animate mb-5">
          <span class="subheading" style="font-size:14pt">HAKA렌트카 고객센터입니다.</span>
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
		    						<h2 class="mb-0 custom-cursor" id="breakdown">고장 · 사고</h2>
		    					</div>
		    				</div>
    					</div>
    					<div class="form-group" style="margin-right: 20px;">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="text">
		    						<h2 class="mb-0 custom-cursor" id="insurance">보험</h2>
		    					</div>
		    				</div>
    					</div>
    					<div class="form-group" style="margin-right: 20px;">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="text">
		    						<h2 class="mb-0 custom-cursor" id="gascost">유류비</h2>
		    					</div>
		    				</div>
    					</div>
    					<div class="form-group">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="text">
		    						<h2 class="mb-0 custom-cursor" id="etc">기타</h2>
		    					</div>
		    				</div>
    					</div>
    				</div>
    			</div>
    		</div>
     <div class="container hidden-content" id="reservationTitle-hidden">
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
    	 <div class="container hidden-content" id="breakdown-hidden">
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
		    						<h2 class="mb-0">긴급출동은 어떤 서비스를 제공하나요?</h2>
		    					</div>
		    					<div class="text">
		    						<span class="mb-0">타이어펑크,배터리방전,연료부족,자동차키분실 시 긴급출동으로 접수해 주세요.</span>
		    						<span class="mb-0">긴급출동은 고객센터로 전화주세요.</span>
		    					</div>
		    				</div>
    					</div>
    					<div class="form-group">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="text">
		    						<h2 class="mb-0">사고접수는 어떻게 하나요?</h2>
		    					</div>
		    					<div class="text">
		    						<span class="mb-0">HAKA렌터카는 24시간 사고접수가 가능한 고객센터를 운영 중입니다.</span>
		    					</div>
		    				</div>
    					</div>
    					<div class="form-group">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="text">
		    						<h2 class="mb-0">사고 시 면책금은 얼마인가요?</h2>
		    					</div>
		    					<div class="text">
		    						<span class="mb-0">HAKA렌터카는 모든 차량이 자동차 종합보험에 가입되어 있어요.</span>
		    					</div>
		    				</div>
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
    	 <div class="container hidden-content" id="insurance-hidden">
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
		    						<h2 class="mb-0">차량손해 면책제도에 대해 알고 싶어요.</h2>
		    					</div>
		    					<div class="text">
		    						<span class="mb-0">HAKA렌트카는 모든 차량이 자동차 종합보험에 가입되어 있어요</span>
		    						<span class="mb-0">완전자차 선택 시 고객부담금이 면제돼요.</span>
		    					</div>
		    				</div>
    					</div>
    					<div class="form-group">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="text">
		    						<h2 class="mb-0">휴차보상료에 대해 알고 싶어요.</h2>
		    					</div>
		    					<div class="text">
		    						<span class="mb-0">사고로 인해 차량이 휴차할 경우, 수리 기간 동안 표준대여료(24시간 기준)의 50%에 해당하는
		    						휴차보상료가 청구되며, 이는 임차인이 배상해야 해요.</span>
		    					</div>
		    				</div>
    					</div>
    					<div class="form-group">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="text">
		    						<h2 class="mb-0">사고 시 면책금은 얼마인가요?</h2>
		    					</div>
		    					<div class="text">
		    						<span class="mb-0">HAKA렌터카는 모든 차량이 자동차 종합보험에 가입되어 있어요.</span>
		    					</div>
		    				</div>
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
    		 <div class="container hidden-content" id="gascost-hidden">
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
		    						<h2 class="mb-0">유류비 정산 기준은 어떻게 되나요?</h2>
		    					</div>
		    					<div class="text">
		    						<span class="mb-0">광역시도별 평균 단가로 산정해요.</span>
		    					</div>
		    				</div>
    					</div>
    					<div class="form-group">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="text">
		    						<h2 class="mb-0">차량 반납 시 주유해야하나요?</h2>
		    					</div>
		    					<div class="text">
		    						<span class="mb-0">차량 반납 전 인수 시 채워져 있던 기름만큼(FULL TANK) 주유 후 반납해 주세요.</span>
		    					</div>
		    				</div>
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
    	 <div class="container hidden-content" id="etc-hidden">
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
		    						<h2 class="mb-0">대여시 인수/반납 규정이 궁금해요.</h2>
		    					</div>
		    					<div class="text">
		    						<span class="mb-0">예약자의 운전면허증 지참 후 인수 및 반납이 가능합니다.</span>
		    					</div>
		    				</div>
    					</div>
    					<div class="form-group">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="text">
		    						<h2 class="mb-0">반려동물과 동승이 가능한가요?</h2>
		    					</div>
		    					<div class="text">
		    						<span class="mb-0">다음 이용 고객에게 불편(알레르기 등)을 끼칠 우려가 있어 반려동물의 동승을 허용하지 않아요.</span>
		    					</div>
		    				</div>
    					</div>
    					<div class="form-group">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="text">
		    						<h2 class="mb-0">분실물 발생 시 어떻게 하나요?</h2>
		    					</div>
		    					<div class="text">
		    						<span class="mb-0">고객센터로 즉시 연락하여 확인요청해 주세요.</span>
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
    					<div class="item-eventbox" id="newyearPoint">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="img rounded d-flex align-items-end" id="newyearPoint" style="background-image: url('/resources/carbook-master/img/point.jpg'); cursor: pointer;">
		    					</div>
		    					<div class="text">
		    						<h2 class="mb-0"><a href="#">포인트 응모 이벤트</a></h2>
		    						<div class="d-flex mb-3">
			    						<p class="price ml-auto"><span>최대&nbsp;</span>500,000<span>/포인트</span></p>
		    						</div>
		    					</div>
		    				</div>
    					</div>
    					<div class="item-joinevent" style="cursor: pointer;">
    						<a href="/login/signUp">
	    						<div class="car-wrap rounded ftco-animate" id="signupCarWrap">
			    					<div class="img rounded d-flex align-items-end" style="background-image: url('/resources/carbook-master/img/joinpoint.png'); cursor: pointer;"></div>
			    					<div class="text">
			    						<h2 class="mb-0">회원가입 시 포인트 적립</h2>
			    						<div class="d-flex mb-3">
				    						<p class="price ml-auto">100,000<span>/포인트</span></p>
			    						</div>
			    					</div>
			    				</div>
		    				</a>
    					</div>
    					<div class="item-eventbox" id="firstPoint">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="img rounded d-flex align-items-end" id="firstPoint" style="background-image: url('/resources/carbook-master/img/firstpoint.jpg');cursor: pointer;">
		    					</div>
		    					<div class="text">
		    						<h2 class="mb-0"><a href="#">선착순 포인트 이벤트</a></h2>
		    						<div class="d-flex mb-3">
			    						<p class="price ml-auto">100,000<span>/포인트</span></p>
		    						</div>
		    					</div>
		    				</div>
    					</div>
    					<div class="item-eventbox" id="joopPoint">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="img rounded d-flex align-items-end" id="joopPoint" style="background-image: url('/resources/carbook-master/img/clickpoint.jpg');cursor: pointer;">
		    					</div>
		    					<div class="text">
		    						<h2 class="mb-0"><a href="#">포인트 줍줍 이벤트</a></h2>
		    						<div class="d-flex mb-3">
			    						<p class="price ml-auto">100,000<span>/포인트</span></p>
		    						</div>
		    					</div>
		    				</div>
    					</div>

    				</div>
    			</div>
    		</div>
    	</div>
    	<!-- 이벤트 모달창 -->
    	<div class="row">
		<div class="col-md-12">
			<div class="modal fade" id="modal-point-event" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<input type="radio" name="100,000point" id="100,000point"> 
						</div>
						<div class="modal-footer">
							 
							<button type="button" class="btn btn-primary">
								확인
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
    	<!-- //이벤트 모달창 끝 -->
    </section>

<%@ include file="/WEB-INF/views/include/bottom.jsp" %>