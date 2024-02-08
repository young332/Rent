<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<%@ include file="/WEB-INF/views/include/top.jsp" %>

<script>
//금액 자릿수 표시하기(콤마)
function formatNumberWithCommas(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$(document).ready(function() {
	var point = $("#myPoint").text();
	if (point.length > 0) {
		$("#myPoint").text(formatNumberWithCommas(point));
	}
	
});

</script>

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
			<div class="col-md-2">
			</div>
			<div class="col-md-8">
			<div class="row">
			<div class="col-md-12">
				<div style="display: flex; justify-content: space-between;">
					<h3>
						${loginInfo.mem_name}님 안녕하세요!
					</h3>
					<a href="/myPage/myPageInfo">내정보 보러가기
					<i class="fa fa-arrow-circle-right"></i>
					</a>
				</div>
				<div class="jumbotron card card-block">
					<p>
						내 포인트
					</p>
					<h2>
						<a href="/point/point" id="myPoint">${loginInfo.mem_point}</a>
						P
					</h2>
				</div>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-12">
				<div style="display: flex; justify-content: space-between;">
					<h3>
						최근 예약내역
					</h3>
					<a href="/myPage/reservationList">예약내역 상세보기
					<i class="fa fa-arrow-circle-right"></i>
					</a>
				</div>
<!-- 				<div class="jumbotron card card-block"> -->
					<div class="card">
						<h6 class="card-header">
							Card title
						</h6>
						<div class="card-body">
							<p class="card-text">
								Card content
							</p>
						</div>
						<div class="card-footer">
							
						</div>
					</div>
<!-- 				</div> -->
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-12">
				<div>
					<h3>
						1:1 문의사항 
					</h3>
					<a class="btn btn-primary btn-large" href="/myPage/inquery">문의내역 바로가기</a>
				</div>
			</div>
			</div>
			</div>
			<div class="col-md-2">
			</div>
		</div>
	</div>
	</section>


<%@ include file="/WEB-INF/views/include/bottom.jsp" %>