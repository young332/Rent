<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/top.jsp" %>
    
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
<%-- ${loginInfo} --%>
    <section class="ftco-section">
		<div class="container">
			<div class="row">
   				<div class="col-md-12">
   					<div>
	    				<h3>
							${loginInfo.mem_name}님 안녕하세요!
						</h3>
						<a href="/myPage/myPageInfo">내정보 보러가기</a>
   					</div>
					<hr>
			  	
				<h3>
					나의 포인트
				</h3>
				<div class="jumbotron card card-block">
					<p>
						내 포인트
					</p>
					<h2>
						${loginInfo.mem_point} P
					</h2>
					<a href="/checkout/point">포인트 상세보기</a>
				</div>
				</div>
   			</div>
   		</div>
	</section>


<%@ include file="/WEB-INF/views/include/bottom.jsp" %>