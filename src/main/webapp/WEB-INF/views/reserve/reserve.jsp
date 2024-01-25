<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/top.jsp" %>
<script src="/resources/js/myscript.js"></script>
<style>
       #details-box { 
         width:25%; 
         height: 1000px; 
         margin-right: 5px;
        
/*         border: 1px solid #003458;  */
       } 
      div.left-box {
/*         width: 80%; */
        float: left;
         box-sizing: border-box; 
         
       
      }

   
	  #cars-box { 
         width:70%; 
         height: 1000px; 

       } 
       
    </style>
    
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/resources/carbook-master/images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="/">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>예약하기 <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-3 bread">예약하기</h1>
          </div>
        </div>
      </div>
    </section>
	 <section class="ftco-section ftco-cart">
			<div class="container">
				<div class="row">
		   			<div id="details-box" class="jumbotron card card-block" style="background-color:white;">
		   			<section>
						<div class="left-box">
							<h6>상세검색&nbsp;&nbsp;&nbsp;<button type="reset" class="reset_btn btn-info">검색초기화</button></h6>
							<hr>
							<div class="form-group">
								<label for="" class="label" >차종<br>
									<input type="checkbox" name="cartype" value="전체" >전체
									<input type="checkbox"  name="cartype" value="소형">소형
									<input type="checkbox"  name="cartype" value="중형">중형<br>
									<input type="checkbox"  name="cartype" value="대형">대형 
									<input type="checkbox"  name="cartype" value="전기차">전기차
								</label>
							</div>
							<hr>
							<div class="form-group">
								<label for="" class="label" >연료<br> 
									<input type="checkbox" name="fuel" value="전체">전체
									<input type="checkbox"  name="fuel" value="가솔린">가솔린
									<input type="checkbox"  name="fuel" value="디젤">디젤<br>
									<input type="checkbox"  name="fuel" value="하이브리드">하이브리드
									</label>
							</div>
							<hr>
							<div class="form-group">
								<label for="" class="label">제조사<br>
									<input type="checkbox" name="carcompany" value="전체">전체
									<input type="checkbox"  name="carcompany" value="현대">현대
									<input type="checkbox"  name="carcompany" value="기아">기아
								</label>  
								
							</div>
							<hr>
							<div class="form-group">
								<label for="" class="label">기타옵션<br> 
									<input type="checkbox" name="otheroptions" value="전체">전체
									<input type="checkbox"  name="otheroptions" value="후방카메라">후방카메라<br>
									<input type="checkbox"  name="otheroptions" value="블루투스">블루투스
									<input type="checkbox"  name="otheroptions" value="내비게이션">내비게이션
									<input type="checkbox"  name="otheroptions" value="유아카시트">유아카시트
								</label> 
								
							</div>
							<hr>
							
						</div>
						</section>
					
		   			</div>
		   			
		   			<div id="cars-box" class="jumbotron card card-block" style="background-color:white;">
	    				<div class="right-box">
								<div class="row">
				    			<div class="col-md-12">
<!-- 				    				<div class="carousel-car owl-carousel"> -->
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
						    						<p class="d-flex mb-0 d-block"><a href="/reserve/licenseinfo" class="btn btn-primary py-2 mr-1">예약하기</a> <a href="#" class="btn btn-secondary py-2 ml-1">세부사항</a></p>
						    					</div>
						    				</div>
				    					</div>
				    					<hr>
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
						    						<p class="d-flex mb-0 d-block"><a href="/reserve/licenseinfo" class="btn btn-primary py-2 mr-1">예약하기</a> <a href="#" class="btn btn-secondary py-2 ml-1">세부사항</a></p>
						    					</div>
						    				</div>
				    					</div>
				    					<hr>
<!-- 				    					<div class="item"> -->
<!-- 				    						<div class="car-wrap rounded ftco-animate"> -->
<!-- 						    					<div class="img rounded d-flex align-items-end" style="background-image: url(/resources/carbook-master/images/kia1.jpg);"> -->
<!-- 						    					</div> -->
<!-- 						    					<div class="text"> -->
<!-- 						    						<h2 class="mb-0"><a href="#">스포티지</a></h2> -->
<!-- 						    						<div class="d-flex mb-3"> -->
<!-- 							    						<span class="cat">KIA</span> -->
<!-- 							    						<p class="price ml-auto">500 <span>/day</span></p> -->
<!-- 						    						</div> -->
<!-- 						    						<p class="d-flex mb-0 d-block"><a href="/reserve/licenseinfo" class="btn btn-primary py-2 mr-1">예약하기</a> <a href="#" class="btn btn-secondary py-2 ml-1">세부사항</a></p> -->
<!-- 						    					</div> -->
<!-- 						    				</div> -->
<!-- 				    					</div> -->
<!-- 				    					<hr> -->
<!-- 				    					<div class="item"> -->
<!-- 				    						<div class="car-wrap rounded ftco-animate"> -->
<!-- 						    					<div class="img rounded d-flex align-items-end" style="background-image: url(/resources/carbook-master/images/kia2.jpg);"> -->
<!-- 						    					</div> -->
<!-- 						    					<div class="text"> -->
<!-- 						    						<h2 class="mb-0"><a href="#">쏘렌토</a></h2> -->
<!-- 						    						<div class="d-flex mb-3"> -->
<!-- 							    						<span class="cat">KIA</span> -->
<!-- 							    						<p class="price ml-auto">500 <span>/day</span></p> -->
<!-- 						    						</div> -->
<!-- 						    						<p class="d-flex mb-0 d-block"><a href="/reserve/licenseinfo" class="btn btn-primary py-2 mr-1">예약하기</a> <a href="#" class="btn btn-secondary py-2 ml-1">세부사항</a></p> -->
<!-- 						    					</div> -->
<!-- 						    				</div> -->
<!-- 				    					</div> -->
				    					<hr>
				    				</div>
				    			</div>
				    		</div>
						</div>
					</div>
    		</div>
			</div>
		</section>
     

<%@ include file="/WEB-INF/views/include/bottom.jsp" %>