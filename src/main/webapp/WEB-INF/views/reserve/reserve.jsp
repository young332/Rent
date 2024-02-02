<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<%@ include file="/WEB-INF/views/include/top.jsp" %>

<style>
#details-box {
	width: 25%;
	height: 700px;
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
	margin-left: 10px;
}

.top-search-box {
	width: 100%;
	height: 500px;
	display: flex;
	flex-direction: row;
	border: 2px solid;
}

.form-control {
	flex: 1 0 auto;
	border: 2px solid;
}

.top-search-box input[type="datetime-local"] {
	width: 0%; /* 조절 가능한 너비로 설정 */
}

.top-search-box {
	position: relative;
	height: 100px;
	margin-right: 40px;
	border-radius: 5px;
}

.top-search-box h6 {
	margin-bottom: 10px; /* 텍스트 아래 간격 조절 */
	font-size: 18px;
	color: purple;
	margin-right: 10px;
	margin-left: 10px;
}

#top_book_pick_date {
	margin-top: 40px; /* 입력란 간격 조절 */
	margin-right: 30px;
	margin-left: 5px;
}

#top_book_off_date {
	margin-top: 40px; /* 입력란 간격 조절 */
	margin-right: 30px;
}

.btntop {
	padding: 10px 20px; /* 버튼 내부 여백 조절 */
	font-size: 16px; /* 버튼 텍스트 크기 조절 */
	border-radius: 5px; /* 버튼 테두리 둥글게 만듭니다. */
}

.top-searchinput-box {
	width: 100%;
	height: 50px;
	display: flex;
	flex-direction: row;
	border: 2px solid;
	border-radius: 5px;
	margin-bottom: 5px;
}
.top-searchinput-box h6 {
	margin-bottom: 10px; /* 텍스트 아래 간격 조절 */
	font-size: 18px;
	color: black;
	margin-right: 10px;
	margin-left:50px;
	margin-top:10px;
	
}
.fa-arrow-circle-right{
	margin-top:15px;
	margin-left:20px;
    color: black;
}
#totalPay{
	color:red;
	font-size: 20px;
	font-weight: bold;
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
					<div class="top-search-box" style="height: 65px;">
							<h6 style="border-top-width: 20px;padding-top: 20px;">렌트카001 빠른 검색</h6>
							<input type="datetime-local" class="form-control" id="top_book_pick_date" placeholder="대여 날짜" style="margin-top: 5px;"> 
							<input type="datetime-local" class="form-control" id="top_book_off_date" placeholder="반납 날짜" style="margin-top: 5px;">
							
							<button type="button" class="btntop btn-secondary" name="btnSearch" id="btnSearch" style="height: 50.2px; margin-top: 5px;">검색하기</button>
							
						</div>
			<div class="container-fluid">
				<div class="row">
					<div class="top-searchinput-box" style="width: 1099px;">
						<h6>대여일&nbsp;&nbsp;:</h6>
						<input type="text" name="top_book_pick_date" readonly>
						<i class="fa fa-arrow-circle-right"style="height: 16px;"></i>
						<h6 style="margin-left: 25px;">반납일&nbsp;&nbsp;:</h6>
						<input type="text" name="top_book_off_date"  readonly>
						<h6>총&nbsp;&nbsp;: <span id="totalTimeSpan"></span> </h6>


					</div>
				</div>
			</div>

			<div id="details-box" class="jumbotron card card-block" style="background-color:white;">
		   			<section>
		   				
						<div class="left-box">
							<h6>상세검색&nbsp;&nbsp;&nbsp;<button type="button" class="reset_btn btn-secondary" id="btnreset">검색초기화</button></h6>
							
							<hr>
							<div class="form-group">
								<label for="" class="label-cartype" >차종<br>
									<input type="checkbox" id="car_size_small" name="car_size" value="소형">소형
									<input type="checkbox" id="car_size_medium" name="car_size" value="중형">중형
									<input type="checkbox" id="car_size_large" name="car_size" value="대형">대형 
									
								</label>
							</div>
							<hr>
							<div class="form-group">
								<label for="" class="label-fuel" >연료<br> 
									<input type="checkbox"  name="car_fuel" id="car_fuel" value="휘발유">휘발유
									<input type="checkbox"  name="car_fuel" id="car_fuel" value="경유">경유<br>
									<input type="checkbox"  name="car_fuel" id="car_fuel" value="하이브리드">하이브리드
									<input type="checkbox"  name="car_fuel" id="car_fuel" value="전기">전기
									</label>
							</div>
							<hr>
							<div class="form-group">
								<label for="" class="label-carcompany">제조사<br>
									<input type="checkbox"  name="car_company" id="car_company" value="현대">현대
									<input type="checkbox"  name="car_company" id="car_company"  value="기아">기아
								</label>  
								
							</div>
							<hr>
							<div class="form-group">
								<label for="" class="label-otheroptions">기타옵션<br> 
									<input type="checkbox" name="otheroptions" value="전체" >전체
									<input type="checkbox"  name="otheroptions" id="op_cam" value="후방카메라">후방카메라<br>
									<input type="checkbox"  name="otheroptions" id="op_bt" value="블루투스">블루투스
									<input type="checkbox"  name="otheroptions" id="op_navi" value="내비게이션">내비게이션<br>
									<input type="checkbox"  name="otheroptions" id="op_carseat" value="카시트">카시트
								</label> 
								
							</div>
							<hr>
							
						</div>
						</section>
					
		   			</div>
		   			
		   			<div id="cars-box" >
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
							    						<span class="cat">${reserveDTO.car_company}</span>|
							    						<span class="cat">${reserveDTO.car_size}</span>|
							    						<span class="cat">${reserveDTO.car_fuel}</span>|
							    						<c:if test="${reserveDTO.op_carseat eq 'Y' || reserveDTO.op_navi eq 'Y' || reserveDTO.op_bt eq 'Y' || reserveDTO.op_cam eq 'Y'}">
													    <c:if test="${reserveDTO.op_carseat eq 'Y'}">
													        <span class="cat">카시트</span>
													    </c:if>
													    <c:if test="${reserveDTO.op_navi eq 'Y'}">|
													        <span class="cat">내비게이션</span>
													    </c:if>
													    <c:if test="${reserveDTO.op_bt eq 'Y'}">|
													        <span class="cat">블루투스</span>
													    </c:if>
													    <c:if test="${reserveDTO.op_cam eq 'Y'}">|
													        <span class="cat">후방 카메라</span>
													    </c:if>
													</c:if>

							    						<p class="price ml-auto">총요금 <span id="totalPay" ></span>원</p>
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
	 $("#btnSearch").click(function() {
		    

		    
		    var selectedPickDate = $("#top_book_pick_date").val();
		    var selectedOffDate = $("#top_book_off_date").val();

		
		    var formattedPickDate = formatDateTime(selectedPickDate);
		    var formattedOffDate = formatDateTime(selectedOffDate);

		   
		    $("input[name='top_book_pick_date']").val(formattedPickDate);
		    $("input[name='top_book_off_date']").val(formattedOffDate);
		});

		
		function formatDateTime(dateTimeString) {
		    var options = {
		        year: 'numeric',
		        month: 'numeric',
		        day: 'numeric',
		        hour: 'numeric',
		        minute: 'numeric',
		        hour12: true,
		    };
		    return new Date(dateTimeString).toLocaleString('ko-KR', options);
		}
	
	//달력 입력값 받음
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

		    
		    function formatDateTime(dateTimeString) {
		        var options = {
		            year: 'numeric',
		            month: 'numeric',
		            day: 'numeric',
		            hour: 'numeric',
		            minute: 'numeric',
		            hour12: true,
		        };
		        return new Date(dateTimeString).toLocaleString('ko-KR', options);
		    }

		    
		    
		    $("input[name='top_book_pick_date']").val(formatDateTime(bookPickDate));
		    $("input[name='top_book_off_date']").val(formatDateTime(bookOffDate));
		    
		    
		});
	 
	 $(document).ready(function() {
		    function calculateTotalTime() {
		        var pickDate = new Date($("#top_book_pick_date").val());
		        var offDate = new Date($("#top_book_off_date").val());

		        // 대여일 및 반납일의 차이 계산
		        var timeDiff = offDate - pickDate;

		        // 차이를 시간과 분으로 분리
		        var hours = Math.floor(timeDiff / (1000 * 60 * 60));
		        var minutes = Math.floor((timeDiff % (1000 * 60 * 60)) / (1000 * 60));

		        // 결과를 화면에 표시
		        $("span[id='totalTimeSpan']").text(hours + "시간 " + minutes + "분");
		    }

		    // 대여일 및 반납일이 변경될 때마다 총 대여 시간 계산 함수 호출
		    $("#top_book_pick_date, #top_book_off_date").change(function() {
		        calculateTotalTime();
		        calculateTotalPay();
		        
		    });

		    // 초기 로딩 시에도 계산 함수 호출
		    calculateTotalTime();
		    calculateTotalPay();
		});

	 //총가격
	function calculateTotalPay() {
    var carCostPerHour = parseInt("${carlist[0].car_cost}"); // Assuming car_cost is the cost per hour

    var pickDate = new Date($("#top_book_pick_date").val());
    var offDate = new Date($("#top_book_off_date").val());

    var timeDiff = offDate - pickDate;
    var totalHours = Math.floor(timeDiff / (1000 * 60 * 60));

    var totalPay = totalHours * carCostPerHour;

    // Format totalPay with commas
    var formattedTotalPay = totalPay.toLocaleString('en-US');

    $("#totalPay").text(formattedTotalPay );
}
	 
	
	 
	 //체크박스 3개 하나씩 선택되게호ㅓ
	 $(document).ready(function() {
		    $("input[name='car_size'], input[name='car_fuel'], input[name='car_company']").change(function() {
		        var groupName = $(this).attr('name');

		        
		        $("input[name='" + groupName + "']").not(this).prop('checked', false);
		        
		    });
		});
	 
	 //비동기방식으로 체크박스 값보내서 체크된거만 화면에 보이게 하기
	 $(function() {
    

    
    function updateData() {
        var checkedValues = "";
        var carSizeValues = "";
        var carFuelValues = "";
        var carCompanyValues = "";

        $("input[name='car_size']:checked").each(function() {
            carSizeValues = $(this).val();
        });

        $("input[name='car_fuel']:checked").each(function() {
            carFuelValues = $(this).val();
        });

        $("input[name='car_company']:checked").each(function() {
            carCompanyValues = $(this).val();
        });

        $("input[name='otheroptions']:checked").each(function() {
            checkedValues += $(this).val() + ",";
        });

        carSizeValues = carSizeValues.replace(/,$/, "");
        carFuelValues = carFuelValues.replace(/,$/, "");
        carCompanyValues = carCompanyValues.replace(/,$/, "");
        checkedValues = checkedValues.replace(/,$/, "");

        var sendData = {
            "car_size": carSizeValues,
            "car_fuel": carFuelValues,
            "car_company": carCompanyValues,
            "op_cam": $("input[name='otheroptions'][value='후방카메라']").is(":checked") ? "Y" : "",
            "op_bt": $("input[name='otheroptions'][value='블루투스']").is(":checked") ? "Y" : "",
            "op_navi": $("input[name='otheroptions'][value='내비게이션']").is(":checked") ? "Y" : "",
            "op_carseat": $("input[name='otheroptions'][value='카시트']").is(":checked") ? "Y" : ""
        };

        console.log('var sendData =', sendData);

        $.ajax({
            url: '/reserve/reservecars',
            type: 'GET',
            contentType: "application/json",
            data: sendData,
            success: function(rData) {
                $("#cars-box").html(rData);
                setFooterTop();
            },
        });
    }

    
    $("input[type='checkbox']").change(function() {
        updateData();
       
    });

    
    $("#btnreset").click(function() {
        $(":checkbox").prop("checked", false);
        updateData();
       
    });

  
});



	function setFooterTop() {
		$("footer").css("position", "absolute");
		$("footer").css("width", "100%");
		var item = $(".right-box .item");
		var y = parseInt(item.css("height"));
        var top = ((y + 25) * (item.length)) + 1000;
		if (top < 1600) {
			top = 1600;
		}
        $("footer").css("top", top + "px");
	}
	
	setFooterTop();
	
	
	 
});


</script>