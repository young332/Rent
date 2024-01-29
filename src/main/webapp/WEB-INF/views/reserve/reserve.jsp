<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<%@ include file="/WEB-INF/views/include/top.jsp" %>

<style>
#details-box {
	width: 25%;
	height: 1000px;
	margin-right: 5px;

	/*         border: 1px solid #003458;  */
}

div.left-box {
	/*         width: 80%; */
	float: left;
	box-sizing: border-box;
	
}

#cars-box {
	width: 70%;
	height: 1000px;
}



 .top-search-box { 
     width: 100%;
	height: 500px;
     display: flex; 
     flex-direction: row; 
     border : 2px solid ; 
 } 

.form-control {
    flex: 1 0 auto;
    border : 2px solid ;
}
.top-search-box{
	
}
.top-search-box input[type="datetime-local"] {
    width: 0%; /* 조절 가능한 너비로 설정 */
}
.top-search-box {
    position: relative;
    height:100px;
    margin-right:40px;
     border-radius: 5px;
     margin-bottom: 5px;
}

.top-search-box h6 {
    margin-bottom: 10px; /* 텍스트 아래 간격 조절 */
    font-size:18px;
    color:purple;
    margin-right:10px;
    margin-left:10px;
   
}

#top_book_pick_date {
    margin-top: 40px; /* 입력란 간격 조절 */
    margin-right:30px;
    margin-left:5px;
}

#top_book_off_date {
    margin-top: 40px; /* 입력란 간격 조절 */
    margin-right:30px;
}

.btntop {
    padding: 10px 20px; /* 버튼 내부 여백 조절 */
    font-size: 16px; /* 버튼 텍스트 크기 조절 */
    border-radius: 5px; /* 버튼 테두리 둥글게 만듭니다. */
   
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
					<div class="top-search-box" style="height: 63.2px;">
							<h6 style="border-top-width: 20px;padding-top: 20px;">렌트카001 빠른 검색</h6>
							<input type="datetime-local" class="form-control" id="top_book_pick_date" placeholder="대여 날짜" style="margin-top: 5px;"> 
							<input type="datetime-local" class="form-control" id="top_book_off_date" placeholder="반납 날짜" style="margin-top: 5px;">
							<button type="button" class="btntop btn-secondary" style="height: 50.2px; margin-top: 5px;">검색하기</button>
						</div>
		   			<div id="details-box" class="jumbotron card card-block" style="background-color:white;">
		   			<section>
		   				
						<div class="left-box">
							<h6>상세검색&nbsp;&nbsp;&nbsp;<button type="button" class="reset_btn btn-secondary" id="btnreset">검색초기화</button></h6>
							
							<hr>
							<div class="form-group">
								<label for="" class="label-cartype" >차종<br>
									<input type="checkbox" id="car_sizeAll" name="car_sizeAll" value="전체">전체
									<input type="checkbox" id="car_size_small" name="car_size" value="소형">소형
									<input type="checkbox" id="car_size_medium" name="car_size" value="중형">중형<br>
									<input type="checkbox" id="car_size_large" name="car_size" value="대형">대형 
									<input type="checkbox" id="car_size_electric" name="car_size" value="전기차">전기차
								</label>
							</div>
							<hr>
							<div class="form-group">
								<label for="" class="label-fuel" >연료<br> 
									<input type="checkbox" name="car_fuelAll" value="전체">전체
									<input type="checkbox"  name="car_fuel" id="car_fuel" value="휘발유">휘발유
									<input type="checkbox"  name="car_fuel" id="car_fuel" value="경유">경유<br>
									<input type="checkbox"  name="car_fuel" id="car_fuel" value="하이브리드">하이브리드
									</label>
							</div>
							<hr>
							<div class="form-group">
								<label for="" class="label-carcompany">제조사<br>
									<input type="checkbox" name="car_companyAll" value="전체" >전체
									<input type="checkbox"  name="car_company" id="car_company" value="현대">현대
									<input type="checkbox"  name="car_company" id="car_company"  value="기아">기아
								</label>  
								
							</div>
							<hr>
							<div class="form-group">
								<label for="" class="label-otheroptions">기타옵션<br> 
									<input type="checkbox" name="otheroptionsAll" value="전체" >전체
									<input type="checkbox"  name="otheroptions" id="op_cam" value="후방카메라">후방카메라<br>
									<input type="checkbox"  name="otheroptions" id="op_bt" value="블루투스">블루투스
									<input type="checkbox"  name="otheroptions" id="op_navi" value="내비게이션">내비게이션
									<input type="checkbox"  name="otheroptions" id="op_carseat" value="카시트">카시트
								</label> 
								
							</div>
							<hr>
							
						</div>
						</section>
					
		   			</div>
		   			
		   			<div id="cars-box" class="jumbotron card card-block" style="background-color:white;">
	    				<div class="right-box">
								<div class="row">
				    			<div class="col-md-12">
				    			<c:forEach items="${carlist}" var="reserveDTO">
				    			
				    					<div class="item">
				    						<div class="car-wrap rounded ftco-animate">
						    					<div class="img rounded d-flex align-items-end" style="background-image: url(/resources/carbook-master/images/hyun1.jpg);">
						    					</div>
						    					<div class="text">
						    						<h2 class="mb-0">${reserveDTO.car_name}</h2>
						    						<div class="d-flex mb-3">
							    						<span class="cat">${reserveDTO.car_company}</span>
							    						<span class="cat">${reserveDTO.car_size}</span>
							    						<span class="cat">${reserveDTO.car_fuel}</span>
							    						<c:if test="${reserveDTO.op_carseat eq 'Y' || reserveDTO.op_navi eq 'Y' || reserveDTO.op_bt eq 'Y' || reserveDTO.op_cam eq 'Y'}">
													    <c:if test="${reserveDTO.op_carseat eq 'Y'}">
													        <span class="cat">카시트</span>
													    </c:if>
													    <c:if test="${reserveDTO.op_navi eq 'Y'}">
													        <span class="cat">내비게이션</span>
													    </c:if>
													    <c:if test="${reserveDTO.op_bt eq 'Y'}">
													        <span class="cat">블루투스</span>
													    </c:if>
													    <c:if test="${reserveDTO.op_cam eq 'Y'}">
													        <span class="cat">후방 카메라</span>
													    </c:if>
													</c:if>

							    						<p class="price ml-auto">가격 <span>원</span></p>
						    						</div>
						    						<p class="d-flex mb-0 d-block" id="btn_reserve"><a href="/reserve/licenseinfo" class="btn btn-primary py-2 mr-1">예약하기</a></p>
						    					</div>
						    				</div>
				    					</div>
				    					</c:forEach>
				    				</div>
				    			</div>
				    		</div>
						</div>
						</div>
					</div>
    		
			
		</section>
     

<%@ include file="/WEB-INF/views/include/bottom.jsp" %>

<script>
$(function() {
	 $("#btnreset").click(function(){
		 $(":checkbox").prop("checked",false);
	        var CheckReset = $("#btnreset").val();
	        console.log("CheckReset");
	    });
	
	
	 $(document).ready(function() {
		    
		    function getParameterByName(name, url) {
		        if (!url) url = window.location.href;
		        name = name.replace(/[\[\]]/g, "\\$&");
		        var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
		            results = regex.exec(url);
		        if (!results) return null;
		        if (!results[2]) return '';
		        return decodeURIComponent(results[2].replace(/\+/g, " "));
		    }
		    var bookPickDate = getParameterByName('book_pick_date');
		    var bookOffDate = getParameterByName('book_off_date');
		    $("#top_book_pick_date").val(bookPickDate);
		    $("#top_book_off_date").val(bookOffDate);
		});
	 
	 $("input[type='checkbox']").change(function() {
		    var checkedValues = "";
		    var carSizeValues = "";
		    var carFuelValues = "";
		    var carCompanyValues = "";

		    // Iterate over car_size checkboxes
		    $("input[name='car_size']:checked").each(function() {
		        carSizeValues += $(this).val() + ",";
		    });

		    // Remove trailing comma
		    carSizeValues = carSizeValues.slice(0, -1);

		    $("input[name='car_fuel']:checked").each(function() {
		        carFuelValues += $(this).val() + ",";
		    });

		    // Remove trailing comma
		    carFuelValues = carFuelValues.slice(0, -1);

		    $("input[name='car_company']:checked").each(function() {
		        carCompanyValues += $(this).val() + ",";
		    });

		    // Remove trailing comma
		    carCompanyValues = carCompanyValues.slice(0, -1);

		    $("input[name='otheroptions']:checked").each(function() {
		        checkedValues += $(this).val() + ",";
		    });

		    // Remove trailing comma
		    checkedValues = checkedValues.slice(0, -1);

		    var sendData = {
		        "car_size": carSizeValues,
		        "car_fuel": carFuelValues,
		        "car_company": carCompanyValues,
		        "otherOptions": checkedValues
		    };

		    console.log('sendData =', sendData);

		    $.ajax({
		        url: '/reserve/reserveCheck',
		        type: 'GET',
		        contentType: "application/json:charset=utf-8",
		        data: sendData,
		        success: function(rData) {
		            console.log('success', rData); // JSON: {"":"", "":""} -> parsing
		            $("#cars-box").html(rData);
		            $.each(rData, function() {
		                var that = $(this);
		                var car_name = that.car_name;
		                $("#cars-box").append("<div>" + car_name + "</div>");
		            });
		        }
		    });
		});



	 
});


</script>



