<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/top.jsp" %>
<script src="/resources/js/myscript.js"></script>
<style>
      div.row{
        width: 100%;
        height: 1000px;
        border: 1px solid #003458;
      }
      div.left-box {
        width: 30%;
        float: left;
/*         box-sizing: border-box; */
       
      }
      div.right-box {
        width: 70%;
        float: right;
        box-sizing: border-box;
        background: #ece6cc;
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
    			<div class="col-md-12 ftco-animate">
    			<section>
					<div class="left-box">
						<h5>상세검색<button type="submit" id="btn-reset">검색초기화</button></h5>
						<hr>
						<div class="form-group">
									<label for="" class="label">차종<br>
									<input type="checkbox"  name="cartype" value="소형">소형
									<input type="checkbox"  name="cartype" value="중형">중형 
									<input type="checkbox"  name="cartype" value="대형">대형 
									<input type="checkbox"  name="cartype" value="전기차">전기차
									</label>
								</div>
								<hr>
								<div class="form-group">
									<label for="" class="label">연료<br> 
										<input type="checkbox"  name="fuel" value="가솔린">가솔린
										<input type="checkbox"  name="fuel" value="디젤">디젤
										<input type="checkbox"  name="fuel" value="하이브리드">하이브리드
										</label>
								</div>
								<hr>
								<div class="form-group">
									<label for="" class="label">제조사<br>
										<input type="checkbox"  name="carcompany" value="현대">현대
										<input type="checkbox"  name="carcompany" value="기아">기아
									</label>  
									
								</div>
								<hr>
								<div class="form-group">
									<label for="" class="label">기타옵션<br> 
										<input type="checkbox"  name="otheroptions" value="후방카메라">후방카메라
										<input type="checkbox"  name="otheroptions" value="블루투스">블루투스
										<input type="checkbox"  name="otheroptions" value="내비게이션">내비게이션
										<input type="checkbox"  name="otheroptions" value="유아카시트">유아카시트
									</label> 
									
								</div>
								<hr>
								<div class="form-group">
									<button type="submit" id="btn-reservation"
										class="btn btn-secondary py-3 px-4">차량조회하고예약하기</button>
								</div>	
					</div>
					</section>
				
    			</div>
    			<div class="right-box">
							차량
					</div>
    		</div>
			</div>
		</section>
     

<%@ include file="/WEB-INF/views/include/bottom.jsp" %>