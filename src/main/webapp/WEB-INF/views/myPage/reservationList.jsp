<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ include file="/WEB-INF/views/include/top.jsp" %>

<script>
//금액 자릿수 표시하기(콤마)
function formatNumberWithCommas(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$(document).ready(function() {
	$(".totalpay").each(function() {
	    var totalpay = $(this).text();
	    if (totalpay) {
	        $(this).text(formatNumberWithCommas(totalpay));
	    }
   	});
});
</script>

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
${reserveList}
    <section class="ftco-section ftco-cart">
			<div class="container">
				<div class="row">
    			<div class="col-md-12 ftco-animate">
    				<div style="display: flex; align-items: flex-end;">
						<h3>
							${loginInfo.mem_name}님의 예약내역
						</h3>
						<c:if test="${not empty reserveList}">
							<c:set var="firstReservation" value="${reserveList[0]}" />
								<p>(${firstReservation.res_license_type}, ${firstReservation.res_license_num})</p>
						</c:if>
					</div>
		          <%-- 예약내역이 없는 경우 --%>
		         	<c:if test="${empty reserveList}">
						<div class="jumbotron card card-block">
				            <p>예약내역이 없습니다.</p>
				            <p><a class="btn btn-primary btn-large" href="/reserve/reserve">예약하러 가기</a></p>
				        </div>
		          	</c:if>
		          <%-- 예약내역이 있는 경우 --%>
					<div>
						<c:if test="${not empty reserveList}">
				            <table class="table" style="text-align:center;">
				              <thead>
				                <tr>
				                  <th>예약번호</th>
				                  <th>이용기간</th>
				                  <th>차종</th>
				                  <th>금액</th>
				                  <th>예약상태</th>
				                </tr>
				              </thead>
				              <tbody>
				                <%-- 예약 목록을 반복하여 출력 --%>
				                <c:forEach var="reservation" items="${reserveList}">
				                  <tr>
				                    <td>${reservation.res_rid}</td>
				                    <td>${reservation.res_rental_date} ~ ${reservation.res_return_date}</td>
				                    <td>${reservation.res_license_type}(수정하기)</td>
				                    <td class="totalpay">${reservation.res_totalpay}</td>
				                    <td>${reservation.res_status}</td>
				                  </tr>
				                </c:forEach>
				              </tbody>
				            </table>
			          	</c:if>
		        	</div>
			      </div>
			    </div>
			  </div>
			</section>

<%@ include file="/WEB-INF/views/include/bottom.jsp" %>