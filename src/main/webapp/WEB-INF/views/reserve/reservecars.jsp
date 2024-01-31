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
						style="background-image: url(/resources/carbook-master/images/hyun1.jpg);">
					</div>
					<div class="text">
						<h2 class="mb-0">${vo.car_name}</h2>
						<div class="d-flex mb-3">
							<span class="cat">${vo.car_company}</span>|
							 <span class="cat">${vo.car_size}</span> |
							 <span class="cat">${vo.car_fuel}</span> |
							<c:if test="${vo.op_carseat eq 'Y' || vo.op_navi eq 'Y' || vo.op_bt eq 'Y' || vo.op_cam eq 'Y'}">
						    <c:if test="${vo.op_carseat eq 'Y'}">
						        <span class="cat">카시트</span>|
						    </c:if>
						    <c:if test="${vo.op_navi eq 'Y'}">
						        <span class="cat">내비게이션</span>|
						    </c:if>
						    <c:if test="${vo.op_bt eq 'Y'}">
						        <span class="cat">블루투스</span>|
						    </c:if>
						    <c:if test="${vo.op_cam eq 'Y'}">
						        <span class="cat">후방 카메라</span>
						    </c:if>
						</c:if>
						
						<p class="price ml-auto">총요금 <span id="totalPay"></span></p>
						
						</div>
						<p class="d-flex mb-0 d-block" id="btn_reserve">
							<a href="/reserve/licenseinfo" class="btn btn-primary py-2 mr-1">예약하기</a>
						</p>
					</div>
				</div>
			</div>

		</c:forEach>

		</div>
	</div>
</div>

