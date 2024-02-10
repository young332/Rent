<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   


<%@ include file="/WEB-INF/views/include/top.jsp" %>


    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/resources/carbook-master/images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="/reserve/licenseinfo">예약 <i class="ion-ios-arrow-forward"></i></a></span> <span>결제 <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-3 bread">결제</h1>
          </div>
        </div>
      </div>
    </section>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkout.jsp</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <title>결제 페이지</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/checkout/">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
  
    </style>
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
  
    <title>Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/resources/carbook-master/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/resources/carbook-master/css/animate.css">
    
    <link rel="stylesheet" href="/resources/carbook-master/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/carbook-master/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/carbook-master/css/magnific-popup.css">

    <link rel="stylesheet" href="/resources/carbook-master/css/aos.css">

    <link rel="stylesheet" href="/resources/carbook-master/css/ionicons.min.css">

    <link rel="stylesheet" href="/resources/carbook-master/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/resources/carbook-master/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="/resources/carbook-master/css/flaticon.css">
    <link rel="stylesheet" href="/resources/carbook-master/css/icomoon.css">
    <link rel="stylesheet" href="/resources/carbook-master/css/style.css">
 
  </head>
  
<body>
	
res_rid: ${res_rid}

<div class="container">
  <main>
    <div class="py-5 text-center">
<!-- 		로고 이미지 넣기  -->
	 	<img class="d-block mx-auto mb-4" src="" alt="" width="0" height="0">
      <h2>결제 페이지</h2>
      <p class="lead">예약 내용을 꼼꼼히 확인해주시고 결제를 진행해주세요</p>
    </div>

    <div class="row g-5">
      <div class="col-md-5 col-lg-4 order-md-last">
        <h4 class="d-flex justify-content-between align-items-center mb-3">
          <span class="text-primary">결제내역</span>
        </h4>
        <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">${loginInfo.mem_name}님의 여정</h6><br>
              <c:if test="${not empty reserveList}">
				<c:set var="firstReservation" value="${reserveList[0]}" />
              	<h6 class="my-0">울산지점</h6><br>
              	<h7>${firstReservation.res_rental_date} ~ ${firstReservation.res_return_date}</h7>
			  	<h7>(총시간 : <span id="hours">${hours}</span>시간 <span id="minutes">${minutes}</span>분)</h7>
			  </c:if>
            </div>
          </li>
        <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
		    <h6 class="my-0">운전자</h6>
		    <small class="text-muted">${loginInfo.mem_name}</small>
			</div>
          </li>
        <ul class="list-group mb-3" type="none">
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">표준가</h6>
            </div>
	            <span class="text-muted">
	            	<span class="bold txt_blue">
	            	${totalPay}원
	            	</span>
	            </span>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">보험료</h6>
              <small class="text-muted">결제 지점으로 연락주시면 상담 후 연락드립니다.</small>
            </div>
            <span class="text-muted"></span>
          </li>
<!--           <li class="list-group-item d-flex justify-content-between lh-sm"> -->
<!--             <div> -->
<!--               <h6 class="my-0">할인내역</h6> -->
<!--               <small class="text-muted">ㄴ상품권</small> -->
<!--                <span class="text-muted">0</span><br> -->
<!--               <small class="text-muted">ㄴ이벤트</small> -->
<!--               <span class="text-muted">0</span><br> -->
<!--             </div> -->
<!--             <span class="text-muted">0</span> -->
<!--           </li> -->
          <li class="list-group-item d-flex justify-content-between bg-light">
            <div class="text-success">
              <h6 class="my-0">포인트</h6>
              <small id="view_point_cost">0</small><br>
            </div><br>
          </li>  
          <li class="list-group-item d-flex justify-content-between bg-light">  
          <div class="point_class">
            <table class="tbl_edit01">
		  <colgroup>
		    <col width="90px"/>
		    <col width="*"   />
		  </colgroup>
		  <tbody>
		    <tr>
		      <th>결제금액</th>
		      <td><span class="bold txt_blue" id="totalPay" name="totalPay" value="${totalPay}">${totalPay}원</span></td>
		    </tr>
		    <tr>
		      <th> 포인트 </th>
		      <td>
		        사용가능 포인트 : <span name="left_pnt">${loginInfo.mem_point}</span>p <br><br> 
		        <c:choose>
		        	<c:when test="${loginInfo.mem_point < totalPay }">
		        		<span style="color:red;">결제 포인트가 부족합니다.</span>
		        	</c:when>
		        	<c:otherwise>
<%-- 		        		<span><input type="checkbox" id="chk_use" onclick="chkPoint(res_totalpay, ${memberVO.mem_point}, min)">포인트 사용</span> --%>
<%-- 		        <span style="float:right">포인트는 최소 <%=min%>p부터 <%=unit%>p단위로 사용 가능합니다.</span> --%>
		        	<span> <input type="number" name="point_cost" id="point_cost" min="5000" max="${totalPay}"></span> p <br><br>
		        	</c:otherwise>
		        </c:choose>
		        
		        
		      </td>
		    </tr>
		    
		    <tr>
		      <th>남은포인트</th>
<!-- 		      <td></td> -->
		      <td>
		      <c:if test="${loginInfo.mem_point > totalPay}">
		        
		        <span name="left_pnt" id="left_pnt">${memberVO.mem_point}</span><br>
		      </c:if>
		      </td>
		    </tr>
		    <tr>
		    	<th>총 결제금액</th><br>
<!-- 		      <td></td> -->
		      <td>
		      	<p class="bold txt_red"><span class="bold txt_red" id="result_pnt"></span></p>
		      </td>
		    </tr>
		  </tbody>
			</table>
			</div>
            <span class="text-success"></span>
          </li>
          <li class="list-group-item d-flex justify-content-between">
<!--             <span>최종 결제 금액</span> -->
            	<p class="bold txt_red"><span class="bold txt_red" id="result_pnt"></span></p>
<%--             <strong id="result_pnt">${totalPay}</strong> --%>
          </li>
          <li>
           <button id="btn_pay" class="w-100 btn btn-primary btn-lg" type="button"
           	style="display:none;">결제 하기</button>
           </li>
        </ul>

<!--         <form class="card p-2"> -->
<!--           <div class="input-group"> -->
<!--             <input type="text" class="form-control" placeholder="Promo code"> -->
<!--             <button type="submit" class="btn btn-secondary">Redeem</button> -->
<!--           </div> -->
<!--         </form> -->
      </div>
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">운전자 정보</h4>
<!--         <form id="checkout_form" class="needs-validation"> -->
        <form id="checkout_form" class="needs-validation" action="/checkout/payment" method="POST">
        	<input type="hidden" name="pay_res_rid" id="pay_res_rid" value="${res_rid}">
          <div class="row g-3">
            <div class="col-sm-12">
              <label for="name" class="form-label">이름</label>
              <input type="text" class="form-control" id="name" value="${loginInfo.mem_name}" readonly>
              <div class="invalid-feedback">
             
              </div><br>
            </div>

            <div class="col-12">
              <label for="text" class="form-label">연락처<span class="text-muted"></span></label>
              <input type="text" class="form-control" id="phone" value=${loginInfo.mem_phone} readonly>
              <div class="invalid-feedback">
                연락처 불려오기
              </div><br>
            </div>

            <div class="col-12">
              <label for="birth" class="form-label">생년월일</label>
              <input type="text" class="form-control" id="birth" value=${loginInfo.mem_birth} readonly>
              <div class="invalid-feedback">
                생년월일 불려오기
              </div><br>
            </div>

<!-- 		<div class="col-md-7 col-lg-8"> -->
<!--           <h4 class="mb-3">Payment</h4> -->
<!--           </div> -->

<!--           <div class="col-md-7 col-lg-8"> -->
<!--             <div class="form-check"> -->
<!--               <input id="pointPayment" name="paymentMethod" type="radio" class="form-check-input" checked required> -->
<!--               <label class="form-check-label" for="credit">포인트 결제</label> -->
<!--             </div> -->
<!--             <div class="form-check"> -->
<!--               <input id="creditPayment" name="paymentMethod" type="radio" class="form-check-input" required> -->
<!--               <label class="form-check-label" for="debit">현금 결제 (비회원 전용)</label> -->
<!--             </div> -->
<!--             </div><br> -->

<%
// int	res_totalpay = 65000;

int unit = 100;
   
int min = 5000;

   %>
    
         
        <div class="col-md-7 col-lg-12"> 
<!--        		<div class="ex_txt" style="color:gray;"><p>결제수단 등록은 ‘마이페이지 &gt; 내 정보 관리 &gt; 결제수단관리’에서 가능합니다.</p><br></div> -->
         	 <h4><p class="title_295">이용 약관에 동의해 주세요</p></h4>
       	</div>
          	<div class="col-md-7 col-lg-12"> 
          	<div class="sub_cont">
          		<div class="inner">
          			<div class="agree_chk_wrap">
          				<span class="chk_box totol_chk">
          					<input type="checkbox" id="totalChk" name="payTotal" readonly="">
          					<label for="totalChk">모든 필수/선택 약관을 확인하고 전체 동의합니다.
          					</label>
          				</span>
          				<ul class="agree_list">
          				<li>
          				<span class="chk_box">
          				<input type="checkbox" id="agree01" name="agree01" readonly="">
          				<label for="agree01">고유식별정보 수집 및 이용 동의(필수)</label>
          				</span>
          				<span class="view">
          				<a id="agree01" name="0">보기</a>
          				</span></li>
          				<li>
          				<span class="chk_box">
          				<input type="checkbox" id="agree02" name="agree02" readonly>
          				<label for="agree02">대여자격 확인 동의(필수)
          				</label></span><span class="view">
          				<a id="agree02" name="1">보기</a>
          				</span></li><li><span class="chk_box">
          				<input type="checkbox" id="agree03" name="agree03" readonly>
          				<label for="agree03">개인정보 수집 및 이용 동의(필수)</label>
          				</span><span class="view"><a id="agree03" name="2">보기</a>
          				</span>
          				</li>
          				<li>
          				<span class="chk_box">
          				<input type="checkbox" id="agree04" name="agree04" readonly="">
          				<label for="agree04">개인정보 제3자 제공 동의(필수)</label>
          				</span><span class="view">
          				<a id="agree04" name="3">보기</a>
          				</span>
          				</li>
          				<li>
          				<span class="chk_box">
          				<input type="checkbox" id="agree05" name="agree05" readonly="">
          				<label for="agree05">고유식별정보 제3자 제공에 관한 동의(필수)</label>
          				</span>
          				<span class="view">
          				<a id="agree05" name="4">보기</a>
          				</span>
          				</li>
          				<li>
          				<span class="chk_box">
          				<input type="checkbox" id="agree06" name="agree06" readonly="">
          				<label for="agree06">자동차 표준 대여약관(필수)</label>
          				</span>
          				<span class="view">
          				<a id="agree06" name="5">보기</a>
          				</span>
          				</li>
          				<li>
          				<span class="chk_box">
          				<input type="checkbox" id="agree07" name="agree07" readonly="">
          				<label for="agree07">취소 및 위약금 규정 동의(필수)</label>
          				</span>
          				<span class="view">
          				<a id="agree07" name="6">보기</a>
          				</span>
          				</li>
          				<li>
          				<span class="chk_box">
          				<input type="checkbox" id="agree08" name="agree08" readonly="">
          				<label for="agree08">전자금융거래 이용약관(필수)</label>
          				</span>
          				<span class="view">
          				<a id="agree08" name="7">보기</a>
          				</span>
          				</li>
          				</ul>
          			</div>
          			</div>
          			<div class="ex_txt"><p>위 내용을 확인했으며 결제에 동의합니다</p></div><br>
          			<p></p><br>
          			<p></p><br>
          			<p></p><br>
          			<p></p>
          		
          		</div>
          	</div>
          	</div>
        </form>
      </div>
    </div>
  </main>
</div>

   <script>
	// 변수 선언 및 값 할당
   var mem_id = '${memberVO.mem_id}';
   
   var point_cost = '${paymentDTO.point_cost}';
 
   var point = '${memberVO.mem_point}';
   
   console.log("포인트: " + point);
      
   var res_totalpay = 0;
   
   var pay_amount = 0;
   
   var res_totalpay = '${totalPay}';
   console.log("res_totalpay 0 : " ,res_totalpay);
   
   var pay_amount = '${totalPay}';
   console.log("pay_amount 1 : " ,pay_amount);
   
   var rentalDateStr = "${firstReservation.res_rental_date}";
   var returnDateStr = "${firstReservation.res_return_date}";

   // 날짜를 파싱하여 Date 객체로 변환
   var rentalDate = new Date(rentalDateStr);
   var returnDate = new Date(returnDateStr);

   // 날짜 간의 차이를 밀리초로 계산
   var diffInMillies = returnDate - rentalDate;

   // 밀리초를 시간과 분으로 변환
   var hours = Math.floor(diffInMillies / (1000 * 60 * 60));
   var minutes = Math.floor((diffInMillies / (1000 * 60)) % 60);

   // 계산된 시간과 분을 화면에 표시하거나 필요한 작업을 수행
   console.log("총 시간: " + hours + " 시간 " + minutes + " 분");
   $("#hours").text(hours);
   $("#minutes").text(minutes);

   function chkPoint(totalpay, point, min) {
	    // totalpay : 결제 금액 / point : 사용가능,남은 포인트 / min : 사용 가능 최소 포인트
	    var v_point = 0; // 사용할 포인트 (input 입력값)

	    // 사용할 포인트 계산
	    var pointCostInput = document.getElementById("point_cost");
	    v_point = parseInt(pointCostInput.value) || 0;

	    // 사용할 포인트가 최소 사용 단위 미만일 때 0으로 설정
	    if (v_point < min) {
	        v_point = 0;
	    }

	    // 사용할 포인트가 남은 포인트를 초과할 때 남은 포인트로 설정
	    if (v_point > point) {
	        v_point = point;
	    }

	    // 최종 결제 금액 업데이트
	    changePoint(totalpay, point, min, v_point);
	}

	function changePoint(totalpay, point, min, v_point) {
	    // 최종 결제 금액 계산
	    var finalPayment = totalpay - v_point;

	    // 화면에 사용할 포인트, 남은 포인트, 최종 결제 금액 표시
	    document.getElementById("view_point_cost").innerText = v_point;
	    document.getElementById("left_pnt").innerHTML = point - v_point + "p";
	 // 만약 최종 결제 금액이 음수이면 0으로 설정
	    finalPayment = Math.max(finalPayment, 0);
	    document.getElementById("result_pnt").innerHTML = ${totalPay} + " 원";
	}

	$(document).ready(function() {
	    // 페이지 로드 시 최종 결제 금액 초기화
	    var totalpay = parseInt($("#res_totalpay", "#pay_amount").val());
	    var point = parseInt("${memberVO.mem_point}");
	    var min = 1; // 최소 사용 가능 포인트
	    changePoint(totalpay, point, min, 0);

	    // 입력 값 변경 이벤트 핸들러
	    $("#point_cost").on("change", function() {
	        // 최종 결제 금액 업데이트
	        chkPoint(totalpay, point, min);
	    });
	});

	
	var totalChk = document.getElementById("totalChk");
	if (totalChk) {
	    totalChk.addEventListener("click", function() {
	        // 모든 필수/선택 약관에 대한 checkbox 요소들 가져오기
	        var checkboxes = document.querySelectorAll('.agree_chk_wrap input[type="checkbox"]');
	        
	        // totalChk checkbox의 상태에 따라 모든 필수/선택 약관 checkbox의 상태 변경
	        for (var i = 0; i < checkboxes.length; i++) {
	            checkboxes[i].checked = totalChk.checked;
	        }
	    });
	}
	
	$(document).ready(function() {
	    // 페이지 로드 시 항상 #btn_pay 버튼을 표시
	    $("#btn_pay").show();
	});

	
	
	$("#btn_pay").on("click", function(e) {
	    e.preventDefault(); // 폼 전송 막기

	    var res_rid = $("#res_rid").val();
	    var pay_res_rid = $("#pay_res_rid").val();
	    var point_cost = $("#point_cost").val();
	    var pay_mem_id = $("#pay_mem_id").val();
	    var res_totalpay = $("#res_totalpay").val();
	    console.log("res_totalpay", res_totalpay);
	    var pay_amount = $("#pay_amount").val();
	    console.log("pay_amount 1", pay_amount);

	    /* 서버 전송 */
	    $("#checkout_form").submit();
	});

	$("#btn_pay").on("click", function(e) {
	    e.preventDefault(); // 폼 전송 막기
	    
	    // 필수 약관에 대한 checkbox 요소들을 가져옴
	    var checkboxes = document.querySelectorAll('.agree_list input[type="checkbox"]');
	    var allChecked = true; // 모든 약관에 동의했는지 여부

	    // 모든 약관에 대해 동의했는지 확인
	    checkboxes.forEach(function(checkbox) {
	        if (!checkbox.checked) {
	            allChecked = false;
	        }
	    });

	    // 모든 약관에 동의하지 않은 경우
	    if (!allChecked) {
	        alert("약관에 동의해주세요.");
	        return;
	    }

	    // 결제 포인트가 부족한지 확인
	    var pointCostInput = document.getElementById("point_cost");
	    var pointCost = parseInt(pointCostInput.value) || 0;
	    var remainingPoint = parseInt("${memberVO.mem_point}"); // 남은 포인트

	    if (pointCost > remainingPoint) {
	        alert("결제 포인트가 부족합니다.");
	        return;
	    }

	    // AJAX를 이용한 서버로의 결제 요청
	    $.ajax({
	        type: "POST",
	        url: "/checkout/payment",
	        contentType: "application/json",
	        data: JSON.stringify(paymentData), // 결제 데이터를 JSON 문자열로 변환하여 전송
	        success: function(response) {
	            // 서버에서의 처리 결과 확인
	            if (response.status === "success") {
	                // 결제가 성공한 경우
	                alert("결제 완료"); // 결제 완료 메시지 표시
	                // 페이지 이동
	                window.location.href = "/myPage/reservationList";
	            } else {
	                // 결제가 실패한 경우
	                alert("결제 실패"); // 결제 실패 메시지 표시
	            }
	        },
	        error: function(xhr, status, error) {
	            // AJAX 요청 실패 시 처리
	            console.error("AJAX 요청 실패:", error);
	        }
	    });
	});

		
   </script>
   
</body>
</html>
	
<%@ include file="/WEB-INF/views/include/bottom.jsp" %>