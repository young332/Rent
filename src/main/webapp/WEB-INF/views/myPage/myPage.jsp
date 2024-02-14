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
</style>
<script>
//등록일 날짜변환
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

//금액 자릿수 표시하기(콤마)
function formatNumberWithCommas(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
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
    	
		$("#pointInModal").modal("show");
	});
	
	// 포인트 충전 모달저장
	$("#btn-point-save").click(function() {
        // 입력된 값을 가져와서 mem_point input의 value로 설정
        var memPointValue = $("#in_point").val();
        $("#point_cost").val(memPointValue);
        console.log("memPointValue:", memPointValue);
        var confirmed = confirm(memPointValue + "P 를 충전하시겠습니까?");
		
        if (confirmed) {
            $("#frmpointIn").submit();
        }
    });
	
	var addResult = '${addResult}';
	if (addResult == 1) {
		alert("포인트충전 완료되었습니다.");
		return;
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
			<div style="padding-top: 50px; padding-bottom: 20px;">
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
								<td>${point.point_code_name}</td>
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
	<div class="row">
		<div class="col-md-12" style="padding-top: 50px; padding-bottom: 50px;">
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
	</div>
</section>

<!-- 포인트 충전 모달창 -->
<div class="modal fade" id="pointInModal" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm" role="document">
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


<%@ include file="/WEB-INF/views/include/bottom.jsp" %>