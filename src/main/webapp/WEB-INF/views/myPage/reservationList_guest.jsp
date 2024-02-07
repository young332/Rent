<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ include file="/WEB-INF/views/include/top.jsp" %>

<!-- 테이블 CSS -->
<%@ include file="/WEB-INF/views/include/reservationListStyle.jsp" %>

<script>
// 금액 자릿수 표시하기(콤마)
function formatNumberWithCommas(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// 예약취소 버튼 - 예약취소 페이지 이동
function res_cancel(reservationId) {
	console.log("reservationId:" + reservationId);
    var confirmflag = confirm("예약취소 하시겠습니까?");
    if(confirmflag){
		console.log("예약취소:" + confirmflag);
		$.ajax({
			method: "DELETE",
			url: "/myPage/res_cancel/" + reservationId,
			success: function(rData) {
				console.log("rData:", rData);
				if (rData == "success") {
					alert("예약취소 했습니다.");
					location.href = "/myPage/reservationList";
				} else {
					alert("예약취소 불가");
				}
			}
		});
    }
}

$(document).ready(function() {
	$(".totalpay").each(function() {
	    var totalpay = $(this).text();
	    if (totalpay) {
	        $(this).text(formatNumberWithCommas(totalpay));
	    }
   	});
	
	$(".carName").each(function(i) {
		var carNamesArray = '${carNames}'.slice(1, -1).split(',');
        $(this).text(carNamesArray[i]);
    });
	
});

</script>

    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/resources/carbook-master/images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>예약확인 <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-3 bread">예약확인 - 비회원</h1>
          </div>
        </div>
      </div>
    </section>
${nonMember}
<%-- ${reserveList} --%>
<%-- ${carNames} --%>
<%-- ${reserveList} --%>
    <section class="ftco-section ftco-cart">
			<div class="container">
				<div class="row">
    			<div class="col-md-12 ftco-animate">
    				<div style="display: flex; align-items: flex-end;">
						<h3>
							${nonMember.non_name}님의 예약내역
						</h3>
							<c:set var="firstReservation" value="${nonMember[0]}" />
							<p>(${firstReservation.res_license_type}, ${firstReservation.res_license_num})</p>
					</div>
		          <%-- 예약내역이 있는 경우 --%>
					<div>
			            <table>
			              <thead>
						  <tr>
						    <th rowspan="2">예약번호</th>
						    <th colspan="2">대여기간</th>
						    <th rowspan="2">차종</th>
						    <th rowspan="2">결제금액</th>
						    <th rowspan="2">예약상태</th>
						    <th rowspan="2">취소</th>
						  </tr>
						  <tr>
						    <th>대여시작일</th>
						    <th>대여종료일</th>
						  </tr>
						</thead>
			              <tbody>
			                <%-- 예약 목록을 반복하여 출력 --%>
			                <c:forEach var="reservation" items="${nonMember}">
			                  <tr>
			                    <td class="non_rid">${reservation.non_rid}</td>
			                    <td>${reservation.non_rental_date}</td>
			                    <td class="res_return_date">${reservation.non_return_date}</td>
			                    <td class="carName"></td>
			                    <td class="totalpay">${reservation.non_totalpay}</td>
								<td>${reservation.non_status}</td>
								<td><button onclick="non_res_cancel(${reservation.non_rid})">예약취소</button>
			                    </td>
			                  </tr>
			                </c:forEach>
			              </tbody>
			            </table>
		        	</div>
			      </div>
			    </div>
			  </div>
			</section>

<%@ include file="/WEB-INF/views/include/bottom.jsp" %>