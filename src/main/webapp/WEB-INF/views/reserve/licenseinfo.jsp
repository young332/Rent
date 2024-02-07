<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="/resources/js/myscript.js"></script>
<style>
.ex_box {
	font-size: 15px;
}
.txt_birth{
	font-size:13px;
}
</style>
<section class="hero-wrap hero-wrap-2 js-fullheight"
	style="background-image: url('/resources/carbook-master/images/bg_3.jpg');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div
			class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
			<div class="col-md-9 ftco-animate pb-5">
				<p class="breadcrumbs">
					<span class="mr-2"><a href="/">Home <i
							class="ion-ios-arrow-forward"></i></a></span> <span>예약 <i
						class="ion-ios-arrow-forward"></i></span>
				</p>
				<h1 class="mb-3 bread"></h1>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section ftco-cart">
	<div class="container">
		<div class="row">
			<div class="col-md-12 ftco-animate">
				<h4>●운전자(예약자) 정보를 입력해 주세요</h4>
				<h6>입력한 정보는 안전하게 보호할게요</h6>
				<form id="frmLicense" role="form" action="/reserve/reserveinsert" method="post">
					<div class="jumbotron card card-block"
						style="background-color: white;">
						<p>기본정보*</p>
						이름<input type="text" id="name" name="name"
							placeholder="이름을 입력해주세요." value="${loginInfo.mem_name}"><br>
						전화번호<input type="text" id="tel" name="tel"
							placeholder="'-'없이 입력해주세요." value="${loginInfo.mem_phone}"><br>
						생년월일<input type="text" id="birthdate" name="birthdate"
							placeholder="생년월일을 입력해주세요." value="${loginInfo.mem_birth}">
							<p class="txt_birth">
								예시)1900-00-00
							</p><br>
							

						
						<br>
						<p>운전면허 정보</p>
						<div class="license_img">
							<center>
								<img src="/resources/carbook-master/images/img_license.png"
									alt="운전면허증예시">
							</center>
						</div>
						<br>
						<div class="form_row select_box ">
							<label class="form_label">면허종류</label><br> <select
								name="res_license_type">
								<option value="">면허종류를 선택해주세요</option>
								<option value="2종보통">2종보통</option>
								<option value="1종보통">1종보통</option>
								<option value="1종대형">1종대형</option>

							</select>
						</div>
						<br> 
						면허번호<input type="text" id="licensenum"
							name="res_license_num" placeholder="면허번호 최대 12자를 입력해주세요.">

						<div class="ex_box">
							<p class="txt">
								구면허증) 서울-01-123456-00 → 서울0112345600<br> 
								신면허증) 11-01-123456-00 → 110112345600
							</p>

						</div>
						<br>

						<p>
							<button type="button" class="btn btn-info btn-large"
								name="paymentType" id="btnNonMemPay" value="non-member" data-url="/">비회원예약</button>
							<button type="button" id="btnMemPay" class="btn btn-success btn-large"
								name="paymentType" value="member">회원전용 결제</button>
						</p>



					</div>
				</form>


			</div>
		</div>
	</div>
</section>


<%@ include file="/WEB-INF/views/include/bottom.jsp"%>

<script>
$(function() {
	 // 로그인 여부 확인
    var isLoggedIn = ${not empty loginInfo};
	$("#btnMemPay").click(function() {
		// 로그인 여부 확인
        if (!isLoggedIn) {
            alert("로그인 후 이용해 주세요.");
            return;
        }

		$("input[name=name]").remove();
		$("input[name=tel]").remove();
		$("input[name=birthdate]").remove();
		 var non_license_type = $("select[name=res_license_type]").val().trim();
		    var non_license_num = $("#licensenum").val().trim();
		    // 입력 값이 비어 있는지 확인
		    if (non_license_type === '' || non_license_num === '') {
		        alert("입력값을 모두 입력하세요.");
		        return; // 함수 종료
		    }
		    // 유효성 검사
	        var validationResult = validateLicenseNumber(non_license_num);
	        if (validationResult !== true) {
	            alert(validationResult);
	            return; // 함수 종료
	        }
		$("#frmLicense").submit();
		
	});
	
	$("#btnNonMemPay").click(function() {
		// 로그인 여부 확인
        if (isLoggedIn) {
            alert("회원전용결제를 이용해 주세요.");
            return;
        }
		// 입력된 값 가져오기
	    var non_name = $("#name").val().trim();
	    var non_tel = $("#tel").val().trim();
	    var non_license_birth = $("#birthdate").val().trim();
	    var non_license_type = $("select[name=res_license_type]").val().trim();
	    var non_license_num = $("#licensenum").val().trim();
		   // 입력 값이 비어 있는지 확인
	    if (non_name === '' || non_tel === '' || non_license_birth === '' || non_license_type === '' || non_license_num === '') {
	        alert("입력값을 모두 입력하세요.");
	        return; // 함수 종료
	    }
	    // 유효성 검사
        var validationResult = validateLicenseNumber(non_license_num);
        if (validationResult !== true) {
            alert(validationResult);
            return; // 함수 종료
        }

	    var formData = {
    		non_name: $("#name").val(),
    		non_tel: $("#tel").val(),
    		non_license_birth: $("#birthdate").val(),
	        non_license_type: $("select[name=res_license_type]").val(),
	        non_license_num: $("#licensenum").val()
	        
	    };
		
		console.log("formData:",formData);
		console.log("formData:",JSON.stringify(formData));
		
		    $.ajax({
		        type: "POST",
		        url: "/reserve/nonmeminsert",
		        contentType: "application/json",
		        data: JSON.stringify(formData),
		        success: function(rData) {
		            console.log("rData:", rData);
		            if (rData=="success") {
		            	location.href = "/";
		            }
		        }
		    });
	    
	});
	function validateLicenseNumber(licenseNumber) {
        // 숫자만 입력했을 때는 12자까지 입력 가능
        if (/^\d+$/.test(licenseNumber) && licenseNumber.length > 12) {
            return "최대 12자까지 입력할 수 있습니다.";
        }
        // 한글과 숫자를 혼합하여 최대 12자까지 입력되도록 제한
        if (!/^[가-힣0-9]{0,12}$/.test(licenseNumber)) {
            return "면허번호를 올바르게 입력하세요.";
        }
    	 // 0~11자 입력했을 때는 12자 입력 요청
        if (licenseNumber.length < 12) {
            return "면허번호 12자를 입력해주세요.";
        }
        return true; // 유효성 검사 통과
    }
	 
});

</script>