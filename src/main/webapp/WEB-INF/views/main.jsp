<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="/WEB-INF/views/include/top.jsp" %>
	
    <div class="hero-wrap ftco-degree-bg" style="background-image: url('/resources/carbook-master/images/volvo.png');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text justify-content-start align-items-center justify-content-center">
          <div class="col-lg-8 ftco-animate">
          	<div class="text w-100 text-center mb-md-5 pb-md-5">
<!-- 	            <h1 class="mb-4"> 신속하고 &amp; 쉬운 자동차 렌트</h1> -->
<!-- 	            <p style="font-size: 18px;">설명</p> -->
	            
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
	  						<form action="/reserve/reserve" method="get" class="request-form ftco-animate bg-primary">
		          				<h2>자동차 렌트 예약</h2>
								<div class="form-group">
									<label for="" class="label">대여&amp;반납 장소</label> 
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
								 <div class="form-group">
					              <buttom type="submit" class="btn btn-secondary py-3 px-4" id="bntSearch">
					              <a id="reservationLink" href="#">차량 조회하고 예약하기</a></buttom>
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
<!-- 					        <p><a href="/reserve/reserve" class="btn btn-primary py-3 px-4">완벅한 자동차를 예약하세요.</a></p> -->
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
    				<c:forEach items="${carinfolist}" var="vo">
    					<div class="item">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="img rounded d-flex align-items-end" style="background-image: url(/resources/upload/${vo.unique_file_nm});">
		    					</div>
		    					<div class="text">
		    						<h2 class="mb-0" ><a href="#" class="car-select" data-car-index="${vo.car_index}">${vo.car_name }</a></h2>
		    						<div class="d-flex mb-3">
		    						<input type="text" class="cat car_index" value="${vo.car_index}" style="display: none;">
			    						<span class="cat">${vo.car_company}</span>
			    						<p class="price ml-auto"> <span></span></p>
		    						</div>
<!-- 		    						<p class="d-flex mb-0 d-block"><a href="#" class="btn btn-primary py-2 mr-1">예약하기</a> <a href="#" class="btn btn-secondary py-2 ml-1">세부사항</a></p> -->
		    					</div>
		    				</div>
    					</div>
    					
    					</c:forEach>
    				</div>
    			</div>
    		</div>
    		
    	</div>
    	
    </section>

<%@ include file="/WEB-INF/views/include/bottom.jsp" %>
   
    
<script>
$(function() {
	$("#bntSearch").click(function() {
		var p = $("#book_pick_date").val();
		var o = $("#book_off_date").val();
		console.log("p:", p);
		console.log("o:", o);
	});
	$("#bntSearch").click(function() {
        var pickDate = $("#book_pick_date").val();
        var offDate = $("#book_off_date").val();
        
        if (!pickDate || !offDate) {
            alert("대여일과 반납일을 모두 선택해주세요.");
            return; 
        }

        var reservationURL = "/reserve/reserve?book_pick_date=" + pickDate + "&book_off_date=" + offDate;
        $("#reservationLink").attr("href", reservationURL);
    });

     $("input[type='datetime-local']").change(function() {
	    	
	        var selectedDateTime = $(this).val();

	        var selectedDate = new Date(selectedDateTime);

	        // 새벽 시간인지 확인 (새벽 시간은 00:00 ~ 05:59)
	        var isDawnTime = selectedDate.getHours() < 6;

	        // 새벽 시간인 경우 알림 띄우기
	        if (isDawnTime) {
	            alert("새벽 시간은 선택할 수 없습니다.");
	            $(this).val("");
	        }
	        var today = new Date();
	        today.setHours(0, 0, 0, 0); 

	        var selectedDateTime = $(this).val();

	        var selectedDate = new Date(selectedDateTime);

	        var isBeforeToday = selectedDate < today;

	        // 오늘 이전인 경우 알림 띄우기
	        if (isBeforeToday) {
	            alert("날짜를 다시 입력해주세요.");
	            $(this).val("");
	        }
	     // 대여일과 반납일을 비교하여 반납일이 대여일보다 전인 경우 알림 띄우기
	        var pickDateTime = $("#book_pick_date").val();
	        var pickDate = new Date(pickDateTime);
	        var offDateTime = $(this).val();
	        var offDate = new Date(offDateTime);

	        if (offDate < pickDate) {
	            alert("반납일을 다시 입력해주세요.");
	            $(this).val("");
	        }
	    });
     // 차량 이름을 클릭했을 때 인덕스값 넘김
     $(".car-select").click(function(e) {
         e.preventDefault(); 
         var carIndex = $(this).data("car-index");
         window.location.href = "/reserve/reserve?car_index=" + carIndex; 
     });
   
	    
});
</script> 
    
  </body>
</html>