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
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">예약 <i class="ion-ios-arrow-forward"></i></a></span> <span>결제 <i class="ion-ios-arrow-forward"></i></span></p>
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
              <h6 class="my-0">${memberVO.mem_name}님의 여정</h6>
              <small class="text-muted">울산지점</small><br>
              <small class="text-muted">02.16(금) 11:00 ~ 02.18(일) 15:00</small>
              <small class="text-muted">소형</small>
            </div>
          </li>
        <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
		    <h6 class="my-0">운전자</h6>
		    <small class="text-muted">${memberVO.mem_name}</small>
			</div>
          </li>
        <ul class="list-group mb-3">
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">표준가</h6>
            </div>
            <span class="text-muted"><span class="bold txt_blue"><%=65000%>원</span></span>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">보험료</h6>
              <small class="text-muted">결제 지점으로 연락주시면 상담 후 연락드립니다.</small>
            </div>
            <span class="text-muted"></span>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">할인내역</h6>
              <small class="text-muted">ㄴ상품권</small>
               <span class="text-muted">0</span><br>
              <small class="text-muted">ㄴ이벤트</small>
              <span class="text-muted">0</span><br>
            </div>
            <span class="text-muted">0</span>
          </li>
          <li class="list-group-item d-flex justify-content-between bg-light">
            <div class="text-success">
              <h6 class="my-0">포인트</h6>
              <small>point</small>
            </div>
            <span class="text-success">0</span>
          </li>
          <li class="list-group-item d-flex justify-content-between">
            <span>총 결제내역</span>
            <strong><c:out value="${orderDTO.pay_cost}"/></strong>
          </li>
           <button id="btn_pay" onclick="location.href='index.jsp'" class="w-100 btn btn-primary btn-lg" type="submit">결제 하기</button>
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
        <form class="needs-validation" novalidate>
          <div class="row g-3">
            <div class="col-sm-12">
              <label for="name" class="form-label">이름</label>
              <input type="text" class="form-control" id="name" value=${memberVO.mem_name}>
              <div class="invalid-feedback">
             
              </div><br>
            </div>


            <div class="col-12">
              <label for="text" class="form-label">연락처<span class="text-muted"></span></label>
              <input type="text" class="form-control" id="phone" value=${memberVO.mem_phone}>
              <div class="invalid-feedback">
                연락처 불려오기
              </div><br>
            </div>

            <div class="col-12">
              <label for="birth" class="form-label">생년월일</label>
              <input type="text" class="form-control" id="birth" value=${memberVO.mem_birth}>
              <div class="invalid-feedback">
                생년월일 불려오기
              </div><br>
            </div>

		<div class="col-md-7 col-lg-8">
          <h4 class="mb-3">Payment</h4>
          </div>

          <div class="col-md-7 col-lg-8">
            <div class="form-check">
              <input id="pointPayment" name="paymentMethod" type="radio" class="form-check-input" checked required>
              <label class="form-check-label" for="credit">포인트 결제</label>
            </div>
            <div class="form-check">
              <input id="creditPayment" name="paymentMethod" type="radio" class="form-check-input" required>
              <label class="form-check-label" for="debit">현금 결제 (비회원 전용)</label>
            </div>
            </div><br>

<%
int	orderSalePrice = 65000;

int unit = 100;
   
int min = 5000;

   %>
        <div class="col-md-7 col-lg-8">

		<table class="tbl_edit01">
		  <colgroup>
		    <col width="90px"/>
		    <col width="*"   />
		  </colgroup>
		  <tbody>
		    <tr>
		      <th>결제금액</th>
		      <td><span class="bold txt_blue"><%=orderSalePrice%>원</span></td>
		    </tr>
		    <tr>
		      <th> 포인트 </th>
		      <td>
		        사용가능 포인트 : <span name="left_pnt">${memberVO.mem_point}</span>p  <span><input type="checkbox" id="chk_use" onclick="chkPoint(${orderSalePrice}, ${memberVO.mem_point}, ${min}, ${unit})">포인트 사용</span>
<%-- 		        <span style="float:right">포인트는 최소 <%=min%>p부터 <%=unit%>p단위로 사용 가능합니다.</span> --%>
		      </td>
		    </tr>
		    <tr>
		      <td></td>
		      <td>
		        <span> <input type="number" name="use_pnt" id="use_pnt" min="<%=min%>" max="<%=orderSalePrice%>" onchange="changePoint(orderSalePrice, point, min)"></span> p 
		        <span> (남은포인트 : </span><span name="left_pnt" id="left_pnt">${orderSalePrice - memberVO.mem_point}</span>p )
		      </td>
		    </tr>
		    <tr>
		      <td></td>
		      <td>
		      	<p class="bold txt_red"> 최종 결제 금액 : <span class="bold txt_red" id="result_pnt"><%=orderSalePrice%></span> 원</p>
		      </td>
		    </tr>
		  </tbody>
			</table>
	</div>
         
        <div class="col-md-7 col-lg-12"> 
       		<div class="ex_txt" style="color:gray;"><p>결제수단 등록은 ‘마이페이지 &gt; 내 정보 관리 &gt; 결제수단관리’에서 가능합니다.</p><br></div>
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
          				<input type="checkbox" id="agree01" name="0" readonly="">
          				<label for="agree01">고유식별정보 수집 및 이용 동의(필수)</label>
          				</span>
          				<span class="view">
          				<a id="agree01" name="0">보기</a>
          				</span></li>
          				<li>
          				<span class="chk_box">
          				<input type="checkbox" id="agree02" name="1" readonly="">
          				<label for="agree02">대여자격 확인 동의(필수)
          				</label></span><span class="view">
          				<a id="agree02" name="1">보기</a>
          				</span></li><li><span class="chk_box">
          				<input type="checkbox" id="agree03" name="2" readonly="">
          				<label for="agree03">개인정보 수집 및 이용 동의(필수)</label>
          				</span><span class="view"><a id="agree03" name="2">보기</a>
          				</span>
          				</li>
          				<li>
          				<span class="chk_box">
          				<input type="checkbox" id="agree04" name="3" readonly="">
          				<label for="agree04">개인정보 제3자 제공 동의(필수)</label>
          				</span><span class="view">
          				<a id="agree04" name="3">보기</a>
          				</span>
          				</li>
          				<li>
          				<span class="chk_box">
          				<input type="checkbox" id="agree05" name="4" readonly="">
          				<label for="agree05">고유식별정보 제3자 제공에 관한 동의(필수)</label>
          				</span>
          				<span class="view">
          				<a id="agree05" name="4">보기</a>
          				</span>
          				</li>
          				<li>
          				<span class="chk_box">
          				<input type="checkbox" id="agree06" name="5" readonly="">
          				<label for="agree06">자동차 표준 대여약관(필수)</label>
          				</span>
          				<span class="view">
          				<a id="agree06" name="5">보기</a>
          				</span>
          				</li>
          				<li>
          				<span class="chk_box">
          				<input type="checkbox" id="agree07" name="6" readonly="">
          				<label for="agree07">취소 및 위약금 규정 동의(필수)</label>
          				</span>
          				<span class="view">
          				<a id="agree07" name="6">보기</a>
          				</span>
          				</li>
          				<li>
          				<span class="chk_box">
          				<input type="checkbox" id="agree08" name="7" readonly="">
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

	<form class="checkout_form" action="/reserve/reserve" method="Get">
		<!-- 사용 포인트 -->
		<input name="point_cost" type="hidden">
	</form>
	
	<!-- 주문 요청 form -->
		<form class="order_form" action="/order" method="post">
			<!-- 주문자 회원번호 -->
			<input name="mem_id" value="${pay_mem_id}" type="hidden">
			<!-- 예약자 -->
			<input name="pay_res_rid" type="hidden">
			<!-- 사용 포인트 -->
			<input name="point_cost" type="hidden">
			<!-- 예약 정보 -->
		</form>

      
   <script>
   
// 변수 선언 및 값 할당
   var mem_id = '${memberVO.mem_id}';
   
   var point_cost = '${orderDTO.point_cost}';
 
   var point = point;
   console.log("포인트: " + point);
   
   var pay_cost = '${orderDTO.pay_cost}';
  
	// radio box 클릭 이벤트 처리
	$("#pointPayment").on("click", function() {
	    if ($(this).is(":checked")) {
	        // radio box가 체크된 경우의 동작을 여기에 추가
	        console.log("pointPayment radio box가 체크되었습니다.");
	        // 추가로 해야 할 작업을 여기에 구현
	       	$(".order_point_input_btn").on("click", function() {
	       		const maxPoint = "${MemberVO.mem_point}";
	       		let state = $(this).data("state");
	       		
	       		if(state == "N") {
	       			console.log("n동작");
	       		$(".order_point_input").val(maxPoint);
	       		
	       		$(".order_point_input_btn_Y").css("display", "inline-block");
	       		$(".order_point_input_btn_N").css("display", "none");
	       		} else if (state == "Y") {
	       			console.log("y동작");
	       			//취소
	       			//값 변경
	       			$(".order_point_input").val(0);
	       			//글 변경
	       			$(".order_point_input_btn_Y").css("display", "none");
	       			$(".order_point_input_btn_N").css("display", "inline-block");
	       			
	       		}
	       	});
	    } else if ($(this).not(":checked")) {
	    	console.log("point 체크해주세요.");
	    }
	});

	function chkPoint(orderSalePrice, point, min,unit) {
		//orderSalePrice : 최초 결제 금액 / point : 사용가능,남은 포인트 / min : 사용 가능 최소 포인트 / unit : 사용단위
		var v_point = parseInt(document.getElementById("use_pnt").value); //사용할 포인트 (input 입력값)
	
		if (document.getElementById("chk_use").checked)  
		{
			if (point < min)  //최소 사용 단위보다 작을 때
			{
				v_point = 0; 
				
			}else {
		//		v_point = orderSalePrice - pnt%unit; //사용할 포인트 = 전체 포인트 중 최소단위 이하 포인트를 뺀 포인트
			}

			if(point > orderSalePrice ){ //결제금액보다 포인트가 더 클 때
				v_point = orderSalePrice; //사용할 포인트는 결제금액과 동일하게 설정
			}
			
		}
		document.getElementById("use_pnt").value = v_point; //input 값 설정

		changePoint(orderSalePrice,point,min,unit);
	}
	
	function changePoint(orderSalePrice,point,min,unit){
		//input값을 가져옴 > left_pnt 변경 > 최종결제금액 변경
		//amt : 최초 결제 금액 / pnt : 사용가능,남은 포인트 / min : 사용 가능 최소 포인트 / unit : 사용단위
		var v_point = parseInt(document.getElementById("use_pnt").value); //사용할 포인트 (input 입력값)
		if (v_point > point) //입력값이 사용가능 포인트보다 클때
		{
			v_point = point;
			document.getElementById("use_pnt").value = v_point; //input 값 재설정
		}

		if(v_point > orderSalePrice ){ //결제금액보다 포인트가 더 클 때
			v_point = orderSalePrice; //사용할 포인트는 결제금액과 동일하게 설정
			document.getElementById("use_pnt").value = v_point; //input 값 재설정
		}

		if (v_point < min)  //최소 사용 단위보다 작을 때
		{
			v_point = 0; 
			document.getElementById("use_pnt").value = v_point; //input 값 재설정
		}else {
			// v_point = v_point - v_point%unit; //사용할 포인트 = 사용할 포인트 중 최소단위 이하 포인트를 뺀 포인트
		}

		var v_left = document.getElementsByName("left_pnt"); //사용가능 포인트, 남은 포인트 값 설정
		for (var i = 0; i < v_left.length; i++) {

			v_left[i].innerHTML = point - v_point; //= 전체 포인트 중에 사용할 포인트빼고 남은 포인트

		}
		document.getElementById("result_pnt").innerHTML = pay_cost - v_point; //최종 결제금액 = 결제금액 - 사용할 포인트
	}
	
	$("#btn_pay").on("click", function() {
        // 포인트 정보를 폼에 추가
        $("input[name='point_cost']").val($("#use_pnt").val());

        // 결제 요청 폼 서버에 전송
        $(".checkout_form").submit();

        console.log("결제완료: ", $("#result_pnt").val());
        
      
    });
	
  // JavaScript 코드에서 mem_id와 point_cost 사용 가능
    console.log("회원 ID: " + mem_id);
    console.log("포인트 비용: " + point_cost);

   </script>
</body>
</html>
	

<%@ include file="/WEB-INF/views/include/bottom.jsp" %>