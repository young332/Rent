<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	  						<form action="#" class="request-form ftco-animate bg-primary">
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
					              <buttom type="submit" class="btn btn-secondary py-3 px-4" ><a href="/reserve/reserve">차량 조회하고 예약하기</a></buttom>
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
					        <p><a href="/reserve/reserve" class="btn btn-primary py-3 px-4">완벅한 자동차를 예약하세요.</a></p>
	  						</div>
	  					</div>
	  				</div>
				</div>
  		</div>
    </section>

<%@ include file="/WEB-INF/views/include/bottom.jsp" %>
   
    
  

 
    
  </body>
</html>