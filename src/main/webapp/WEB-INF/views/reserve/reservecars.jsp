<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="right-box">
	<div class="row">
		<div class="col-md-12">
		<c:forEach var="vo" items="${checkcarlist}">
			<div class="item">
				<div class="car-wrap rounded ftco-animate fadeInUp ftco-animated">
					<div class="img rounded d-flex align-items-end"
						style="background-image: url(/resources/upload/${vo.unique_file_nm});">
					</div>
					<div class="text">
						<h2 class="mb-0" style="font-weight: bold; font-size: 30px;">${vo.car_name}</h2>
						<div class="d-flex mb-3">
							<input type="text" class="cat car_index" value="${vo.car_index}" style="display: none;">
							<span class="cat" style="color: black;">${vo.car_company}</span>|
							 <span class="cat" style="color: black;">${vo.car_size}</span> |
							 <span class="cat" style="color: black;">${vo.car_fuel}</span> |
							<c:if test="${vo.op_carseat eq 'Y' || vo.op_navi eq 'Y' || vo.op_bt eq 'Y' || vo.op_cam eq 'Y'}">
						    <c:if test="${vo.op_carseat eq 'Y'}">
						        <span class="cat" style="color: black;">카시트</span>|
						    </c:if>
						    <c:if test="${vo.op_navi eq 'Y'}">
						        <span class="cat" style="color: black;">내비게이션</span>|
						    </c:if>
						    <c:if test="${vo.op_bt eq 'Y'}">
						        <span class="cat" style="color: black;">블루투스</span>|
						    </c:if>
						    <c:if test="${vo.op_cam eq 'Y'}">
						        <span class="cat" style="color: black;">후방 카메라</span>
						    </c:if>
						</c:if>
						
						<p class="price ml-auto hourPay hourPay"><span id="hourPay" style="display: none;">${vo.car_cost}</span></p>
						<p class="price ml-auto">총요금<span class="totalPay" style="color: red; font-weight: bold; font-size: 20px;"></span>원</p>

						
						</div>

							<p class="d-flex mb-0 d-block btn_reserve" id="btn_reserve">
								<button type="button" data-url="/reserve/licenseinfo" class="btn btn-primary py-2 mr-1 btn_reserve">예약하기</button>
							</p>

						</div>
				</div>
			</div>

		</c:forEach>

		</div>
	</div>
</div>
<script>
	$(document).ready(function () {
	    function calculateTotalCost() {
	        $(".item").each(function () {
	            var hourlyRate = parseFloat($(this).find(".hourPay").text());
	            var pickDate = new Date($("#top_book_pick_date").val());
	            var offDate = new Date($("#top_book_off_date").val());
	            var timeDiff = offDate - pickDate;
	
	            var hours = Math.floor(timeDiff / (1000 * 60 * 60));
	            var minutes = Math.floor((timeDiff % (1000 * 60 * 60)) / (1000 * 60));
				
	         // NaN 체크하여 0으로 대체
	            hours = isNaN(hours) ? 0 : hours;
	            minutes = isNaN(minutes) ? 0 : minutes;
	            
	            var totalCost = hours * hourlyRate + (minutes / 60) * hourlyRate;
	
	            var roundedTotalCost = Math.round(totalCost);
	            var formattedTotalCost = roundedTotalCost.toLocaleString('en-US', { minimumFractionDigits: 0 });
	
	            $(this).find(".totalPay").text(formattedTotalCost);
	        });
	
	        // Asynchronous update
	        updateTotalCostOnServer();
	    }
	
	    $("#top_book_pick_date, #top_book_off_date").change(function () {
	        calculateTotalCost();
	    });
	
	    calculateTotalCost();
	});
	
	  $(".btn_reserve").click(function() {
	    	console.log("reserver button");
	    	var url = $(this).attr("data-url");
	    	
	    	var topBookPickDate = $("#top_book_pick_date").val();
			var topBookOffDate = $("#top_book_off_date").val();
			
			// 대여일과 반납일 입력 값이 없는 경우
	        if (!topBookPickDate || !topBookOffDate) {
	            alert("날짜를 입력하세요.");
	            return;
	        }
				
			
			var carIndex = $(this).parent().find(".car_index").val();
			var totalPay = $(this).parent().find(".totalPay").text(); 
			
	    	
			console.log("topBookPickDate:",topBookPickDate);
			console.log("topBookOffDate:",topBookOffDate);
			console.log("carIndex:",carIndex);
			console.log("totalPay:",totalPay);
			
			var frmReserve = $("#frmReserve");
			frmReserve.find("input[name=top_book_pick_date]").val(topBookPickDate.replace('T', ' '));
			frmReserve.find("input[name=top_book_off_date]").val(topBookOffDate.replace('T', ' '));
			frmReserve.find("input[name=car_index]").val(carIndex);
			frmReserve.find("input[name=totalPay]").val(totalPay);
			
			
			frmReserve.submit();
	    	//sendDataToServer();
	    	//return false;
	    });
	//메인페이지에서 선택한 차 만 보이게 하기

</script>

