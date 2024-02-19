<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<%@ include file="/WEB-INF/views/include/top.jsp" %>

<style>
	#tbl_point tr, #tbl_point td, #tbl_point th {
		padding: 10px;
	}
	#tbl_point th:nth-child(1), #tbl_point td:nth-child(1) {
		width: 10%;
	}
	#tbl_point th:nth-child(2), #tbl_point td:nth-child(2) {
		width: 30%;
	}
	#tbl_point th:nth-child(3), #tbl_point td:nth-child(3) {
		width: 20%;
	}
	#tbl_point th:nth-child(4), #tbl_point td:nth-child(4) {
		width: 20%;
	}
	#tbl_point th:nth-child(5), #tbl_point td:nth-child(5) {
		width: 20%;
	}
	.modal-dialog {
		width: 500px;
	    max-width: 100%;
	    margin: 1.75rem auto;
	}
	
	ul {
    list-style-type: square;
}
</style>
<script>
// 등록일 날짜변환
function formattedDate(point_use_date) {
	if (!point_use_date) {
        return "";
    }
    
    var date = new Date(point_use_date);
    
    var year = date.getFullYear();
    var month = ("0" + (date.getMonth() + 1)).slice(-2);
    var day = ("0" + date.getDate()).slice(-2);
    var hours = ("0" + date.getHours()).slice(-2);
    var minutes = ("0" + date.getMinutes()).slice(-2);
    var seconds = ("0" + date.getSeconds()).slice(-2);
    
    return year + "-" + month + "-" + day + "   " + hours + ":" + minutes;
}

// 금액 자릿수 표시하기(콤마)
function formatNumberWithCommas(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// 예약 건 정보 가져오기
function getResInfo(res_rid) {
	$.ajax({
	    type: 'GET',
	    url: '/myPage/getResInfo',  
	    data: { res_rid: res_rid },
	    success: function (data) {
	    	console.log('Success:', data);
			var modalBody = $("#resModalBody");
			modalBody.empty();
			
	     	if (data.length == 0) {
	     		modalBody.text("예약건 정보없음");
	      	} else {
	    		$.each(data, function(index, resInfo) {
	    			var rental_date = formattedDate(resInfo.res_rental_date);
	    			var return_date = formattedDate(resInfo.res_return_date);
	    			var totalPay = formatNumberWithCommas(resInfo.res_totalpay);
	    			var op_carseat = resInfo.op_carseat == 'Y' ? 'O' : 'X';
	    			var op_navi = resInfo.op_navi == 'Y' ? 'O' : 'X';
	    			var op_bt = resInfo.op_bt == 'Y' ? 'O' : 'X';
	    			var op_cam = resInfo.op_cam == 'Y' ? 'O' : 'X';
	    			
	   	  			var row = $("<ul style='color: black;'>");
	    	  		row.append($("<li>").text("예약번호: " + resInfo.res_rid));
	    	  		row.append($("<li>").text("대여시작일: " + rental_date));
	    	  		row.append($("<li>").text("대여종료일: " + return_date));
	    	  		row.append($("<li>").text("차종: " + resInfo.car_company + "-" + resInfo.car_name + "(" + resInfo.car_fuel + ")"));
	    	  		row.append($("<li>").html("옵션 <br>	-카시트: " + op_carseat + 
	    	  								  "<br> -내비게이션: " + op_navi + 
	    	  								  "<br> -블루투스: " + op_bt + 
	    	  								  "<br> -후방카메라: " + op_cam));
	    	  		row.append($("<li>").text("금액: " + totalPay + " P"));
	    	  		if (resInfo.pay_status == null) {
		    	  		row.append($("<li>").text("예약상태: " + resInfo.res_status + "(결제 전)"));
	    	  		} else {
		    	  		row.append($("<li>").text("예약상태: " + resInfo.res_status));
	    	  		}
	    	  		row.append($("</ul>"));
	    	  		
	    	  		modalBody.append(row);
	            });
	
	            $("#reserveInModal").modal("show");
	         }
      },
      error: function(xhr, status, error) {
          console.log('Error:', error);
      }
	});
}

$(document).ready(function() {
	
	var myPoint = $("#myPoint").text();
	if (myPoint.length > 0) {
		$("#myPoint").text(formatNumberWithCommas(myPoint));
	}
	
	$(".point_cost").each(function() {
		var point_cost = $(this).text();
		if (point_cost.length > 0) {
			$(this).text(formatNumberWithCommas(point_cost));
		}
	});
	
	$(".point_use_date").each(function() {
		var point_use_date= $(this).text();
		if (point_use_date) {
			$(this).text(formattedDate(point_use_date));
		}
	});
	
	$(".card-header").each(function() {
		var cardDate= $(this).text();
		if (cardDate) {
			var date = new Date(cardDate);
			var year = date.getFullYear();
		    var month = ("0" + (date.getMonth() + 1)).slice(-2);
		    var day = ("0" + date.getDate()).slice(-2);
		    
		    var cDate = year + "-" + month + "-" + day;
		    
			$(this).text(cDate);
		}
	});
});

$(function() {
	
	var originalData = $("#tbl_point tbody").html();
	
	 // 전체 버튼 클릭
   $("#pointAll").click(function() {
	    var tbody = $("#tbl_point tbody");
	    tbody.html(originalData);
	    $("#tbl_point thead tr").removeClass().addClass("table-warning");
	    if (tbody.children().length == 0) {
	        tbody.html("<tr><td colspan='5'>포인트 내역이 없습니다.</td></tr>");
	    }
	});
   
   // 적립 버튼 클릭
   $("#plusPoint").click(function() {
	    var tbody = $("#tbl_point tbody");
	    tbody.html(originalData);
	    tbody.find("tr").hide();
	    var earnedRows = tbody.find("tr:contains('적립')");
	    earnedRows.show();
	    $("#tbl_point thead tr").removeClass().addClass("table-primary");
	    if (earnedRows.length == 0) {
	        tbody.html("<tr><td colspan='5'>적립포인트 내역이 없습니다.</td></tr>");
	    }
	});
   
   // 사용 버튼 클릭
	$("#minusPoint").click(function() {
	    var tbody = $("#tbl_point tbody");
	    tbody.html(originalData);
	    tbody.find("tr").hide();
	    var usedRows = tbody.find("tr:contains('사용')");
	    usedRows.show();
	    $("#tbl_point thead tr").removeClass().addClass("table-danger");
	    if (usedRows.length == 0) {
	        tbody.html("<tr><td colspan='5'>사용포인트 내역이 없습니다.</td></tr>");
	    }
	});
   
	// 포인트충전 모달열기
	$("#btnPoint").click(function() {
	var mem_id = "${loginInfo.mem_id}";
	   	console.log(mem_id);
	   	$("#point_mem_id").val(mem_id);
	   	$("#point_user_id").val(mem_id);
	    $("#in_point").text("");
		$("#pointInModal").modal("show");
	});
	
	// 포인트 충전 모달저장
	$("#btn-point-save").click(function() {
       // 입력된 값을 가져와서 mem_point input의 value로 설정
       var memPointValue = $("#in_point").val();
       var formatPoint = formatNumberWithCommas(memPointValue);
       if (!memPointValue) {
       	alert("충전금액을 입력하세요");
       } else {
	        $("#point_cost").val(memPointValue);
	        console.log("memPointValue:", formatPoint);
	        var confirmed = confirm(formatPoint + "P 를 충전하시겠습니까?");
			
	        if (confirmed) {
	            $("#frmpointIn").submit();
	        }
       }
   });
	
	var addResult = '${addResult}';
	if (addResult == 1) {
		alert("포인트충전 완료되었습니다.");
		return;
	}

	var msg = "${msg}";
	if (msg == "fail") {
		alert("이벤트 실패");
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
<%-- ${pointList} --%>
<section class="ftco-section">
<div class="container">
	<div class="row">
		<div class="col-md-12" >
			<div style="display: flex; justify-content: space-between; align-items: center;">
				<h2>
					${loginInfo.mem_name}님 안녕하세요!
				</h2>
				<a href="/myPage/myPageInfo">내정보 보러가기
				<i class="fa fa-arrow-circle-right"></i>
				</a>
			</div>
			<hr>
			<div style="padding-top: 30px; padding-bottom: 50px;">
				<div style="display: flex; align-items: center;">
					<h3 style="margin-right:20px;">나의 포인트 : <a id="myPoint" style="margin-left:10px;">${loginInfo.mem_point}</a>P </h3>
					<button class="btn btn-primary" id="btnPoint">포인트 충전하기</button>
				</div>
				<div class="btn-group" role="group" style="padding-top: 20px; padding-bottom: 5px;">
					<button type="button" class="btn btn-outline-dark" id="pointAll">전체</button>
					<button type="button" class="btn btn-outline-dark" id="plusPoint">적립</button>
					<button type="button" class="btn btn-outline-dark" id="minusPoint">사용</button>
				</div>
				<%-- 포인트내역이 없는 경우 --%>
				<table id="tbl_point" class="table table-hover table-sm" style="text-align: center;">
					<thead>
						<tr class="table-warning">
							<th>#</th>
							<th>날짜(최근순)</th>
							<th>사유</th>
							<th>포인트</th>
							<th>구분</th>
						</tr>
					</thead>
					<tbody>
		         	<c:if test="${empty pointList}">
	          			<tr>
							<td colspan='5'>포인트 내역이 없습니다.</td>
						</tr>
		          	</c:if>
					<c:if test="${not empty pointList}">
						<c:forEach var="point" items="${pointList}">
							<tr>
								<td>${point.rowNum}</td>
								<td class="point_use_date">${point.point_use_date}</td>
								<td>${point.code_name}</td>
								<td class="point_cost">${point.point_cost} P</td>
								<td>${point.point_section}</td>
							</tr>
						</c:forEach>
					</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<hr>
	<div class="row">
		<div class="col-md-12" style="padding-top: 30px; padding-bottom: 30px;">
			<div style="display: flex; justify-content: space-between;" style="padding-bottom: 50px;">
				<h3>
					다가오는 예약
				</h3>
				<a href="/myPage/reservationList">전체 예약내역
				<i class="fa fa-arrow-circle-right"></i>
				</a>
			</div>
			<%-- 예약내역이 없는 경우 --%>
         	<c:if test="${empty reserveList}">
				<div class="jumbotron card card-block">
		            <p>예약 건이 없습니다.</p>
		            <p><a class="btn btn-primary btn-large" href="/reserve/reserve">예약하러 가기</a></p>
		        </div>
          	</c:if>
          	<%-- 예약내역이 있는 경우 --%>
          	<c:if test="${not empty reserveList}">
	          	<div class="row">
	          		<c:forEach var="myReserve" items="${reserveList}">
						<div class="reserveDiv col-md-4" onclick="getResInfo(${myReserve.res_rid})" style="padding-bottom: 30px;">
							<div class="card" style="height: 100%;">
								<h6 class="card-header" style="background-color: #f07039; color:#fff;
															   display: flex; justify-content: center;
															   align-items: center;">
									${myReserve.res_rental_date}
								</h6>
								<div class="card-body" style="height: 250px; 
															  background-image: url(/resources/upload/${myReserve.unique_file_nm}); 
															  background-size: cover; 
															  background-position: center;">
							    </div>
								<div class="card-footer" style="background-color: #f07039;
																display: flex; justify-content: center; 
																align-items: center;">
									<h4 style="color:#fff;">${myReserve.car_name}</h4>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:if>
		</div>
	</div>
	<hr>
</div>
</section>

<!-- 포인트 충전 모달창 -->
<div class="modal fade" id="pointInModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myModalLabel">포인트 충전</h5>
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<form action="/point/pointIn" method="post"id="frmpointIn">
				<input type="hidden" name="point_code" value="POINT_C">
				<input type="hidden" name="mem_id" id="point_mem_id" value="">
				<input type="hidden" name="point_user_id" id="point_user_id" value="">
				<input type="hidden" name="point_cost" id="point_cost" value="">
				
				<div class="modal-body" style="display: flex; align-items: center;">
				    <label style="margin-right: 10px;">충전금액:</label>
				    <input class="form-control" type="number" name="mem_point" id="in_point" style="width: 65%;">원		    
				</div>
	
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btn-point-save">확인</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- // 포인트 충전 모달창 -->

<!-- 예약내역 모달창 -->
<div class="modal fade" id="reserveInModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header" style="background-color: #f07039;">
				<h5 class="modal-title" id="myModalLabel" style="color: #fff;">예약 정보</h5>
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body" id="resModalBody">
			
			</div>
			<div class="modal-footer" style="justify-content: center;">
				<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>
<!-- // 예약내역 모달창 -->


<%@ include file="/WEB-INF/views/include/bottom.jsp" %>