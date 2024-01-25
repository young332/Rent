<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/top.jsp" %>
    
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/resources/carbook-master/images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>예약확인 <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-3 bread">예약확인</h1>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section ftco-cart">
			<div class="container">
				<div class="row">
    			<div class="col-md-12 ftco-animate">
					<h3>
						예약내역
					</h3>
					<div class="jumbotron card card-block">
						<p>
							예약내역이 없습니다.
						</p>
						<p>
							<a class="btn btn-primary btn-large" href="#">예약하러 가기</a>
						</p>
					</div>
					<h3>
						이용완료 및 예약취소
					</h3>
					<table class="table">
						<thead>
							<tr>
								<th>
									
								</th>
								<th>
									날짜
								</th>
								<th>
									차종
								</th>
								<th>
									처리상태
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									1
								</td>
								<td>
									2024-01-31 ~ 2024-02-10
								</td>
								<td>
									Ray
								</td>
								<td>
									예약취소완료
								</td>
							</tr>
						</tbody>
					</table>
    			</div>
    		</div>
			</div>
		</section>


<%@ include file="/WEB-INF/views/include/bottom.jsp" %>