<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- 알람창 -->
<!-- top -->
<!-- 주소 -->
  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
      
	<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/resources/carbook-master/images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Contact <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-3 bread">로그인</h1>
          </div>
        </div>
      </div>
    </section>
<script>
//카카오 api주소
function openZipSearch() {
    new daum.Postcode({
    	oncomplete: function(data) {     
		var addr = ''; 
		if (data.userSelectedType === 'R') { 
			addr = data.roadAddress;
		} else {
			addr = data.jibunAddress;
		}
		$("#mem_zip_code").val(data.zonecode);
		$("#mem_addr").val(addr);
		$("#mem_addr").focus();
        }
    }).open();
}

var isValidPhone = false;
var isValidPassword = false;

//아이디 중복 체크
$(function(){
	$("#id_check").click(function(){
		console.log("클릭");
		
		var userId = $("#mem_id").val();
		console.log("userId:" , userId);
		
		if (userId.trim() == "") {
            alert("아이디를 입력해주세요.");
            return;
        }
		$.ajax({
            async: true,
            type : 'post',
            data : userId,
            url : "/login/checkId",
            dataType : "text",
            headers : {       
				"Content-Type" : "application/json",      
				"X-HTTP-Method-Override" : "POST"    
			}, 
            success: function (data) {
            	console.log("dataS:" , data);
				if(data == "S") {
					alert("사용가능한 아이디입니다.");
					$("#mem_id").focus();
					isCheckId = 1;
					
				} else {
					console.log("dataF:" , data);
					alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
					$("#mem_id").focus();
				}
            },
            error : function(error) {
                
                alert("error:",error);
            }
        });
	});
	
	//휴대폰번호 11자리 중복허용X 
	$("input[name='mem_phone']").on("propertychange change keyup paste input", function(){
		var str = $("input[name='mem_phone']").val();
		console.log("str:" , str);
		var regExp = /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;
		if(!regExp.test(str)){
			$("#dup-phone").text("올바른 전화번호 11자리를 입력해주세요").css("color","red");
			isValidPhone = false;
			
		} else{
			$("#dup-phone").text("");
			isValidPhone = true;
		
		$.ajax({
			async: true,
			type : 'post',
			url : "/login/phoneCheck",
			dataType : "text",
			contentType: "application/json",
			data: str,
			headers : {       
				"Content-Type" : "application/json",      
				"X-HTTP-Method-Override" : "POST"    
			},
			success : function(data){
				console.log("data:" , data);
				if(data == 0){
					$("#dup-phone").text("사용가능한 번호입니다.").css("color","green");
					isValidPhone = true;
				}else{
					$("#dup-phone").text("등록된 번호가 있습니다.").css("color","red");
					isValidPhone = false;
				}
			}
		});
	  }

	});
		//문자인증
		var responseData= "";
		$("#check_send").click(function() {
			console.log("클릭");
			alert("인증번호 발송이 완료되었습니다.");
			
			var mem_phone = $("#mem_phone").val();
			console.log("mem_phonMS:", mem_phone);
			$.ajax({
				async : true,
				type : "GET",
				url : "/login/phoneSend",
				dataType : "text",
				data: { "mem_phone": mem_phone }, 
				headers : {
					"Content-Type" : "application/json"
				},
				success : function(data) {
					console.log("datMS:", data);
					if(data =="error"){
						alert("휴대폰 번호가 올바르지 않습니다.");
					} else{
						 $("#phoneDoubleCheck").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
				         $("#phoneDoubleCheck").css("color","red");
				         responseData = data;
				         
					$("#phone_check").click(function() {
						console.log("문자인증클릭");
						if ($.trim(responseData) == $("#mem_phone_check").val()) {
							alert("인증성공!\n휴대폰 인증이 정상적으로 완료되었습니다.");
						} else {
							alert("인증실패!\n인증번호가 올바르지 않습니다!");
						}
					  });	
					}
				  }
			    
		     });
	        
         });
		
		//비밀번호 유효성검사 
		function checkPassword(){
			var pass1 = $("input[name='mem_pw']").val().trim();
			var pass2 = $("input[name='mem_pw_check']").val().trim();
			var regExp = /^[a-zA-Z\d`~!@#$%^&*()-_=+]{8,16}$/;
			console.log("pass1:" , pass1);
			if(!regExp.test(pass1)){
				$("#dup-password").text("비밀번호는 8~16자 입니다.").css("color","red");
				isValidPassword = false;
			} else{
				$("#dup-password").text(""); // 유효성 검사가 통과했을 때 메시지를 초기화
				  isValidPassword = true;
				if(pass1 == pass2){
					$("#dup-password-check").text("비밀번호가 일치합니다.").css("color","green");
					isValidPassword = true;
				} else{
					$("#dup-password-check").text("비밀번호가 다릅니다.").css("color","red");
					isValidPassword = false;
				}
			}
		}
		$("input[name='mem_pw']").on("propertychange change keyup paste input", checkPassword);
		$("input[name='mem_pw_check']").on("propertychange change keyup paste input", checkPassword);

		
	
		
		//회원가입 버튼 클릭 시
		$("#frmSignUp").submit(function() {
		
			var inputId = $("#mem_id").val();
			var inputPwd = $("#mem_pw").val();
			var inputPwdCfm = $("#mem_pw_check").val();
			var inputCpnName = $("#mem_name").val();
			var inputCpnBirth = $("#mem_birth").val();
			var inputCpnTelNo = $("#mem_phone").val();
			var inputCpnEmail = $("#mem_email").val();
			<!--주소-->
			var inputCpnAddr1 = $("#mem_zip_code").val();
			var inputCpnAddr2 = $("#mem_addr").val();
			<!--문자인증-->
			var inputCpnMessage =$("#phone_check").val();
			
				if (inputId.length == 0) {alert("아이디를 입력해 주세요.");$("#mem_id").focus();return false;}
				if (isCheckId == 0) {alert("아이디 중복 체크를 해주세요.");$("#mem_id").focus();return false;}
				if (inputPwd.length == 0) {alert("비밀번호를 입력해 주세요.");$("#mem_pw").focus();return false;}
				if (inputPwd != inputPwdCfm) {alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요.");$("#mem_pw").focus();return false;}
				if (inputCpnTelNo.length == 0) {alert("전화번호를 입력해 주세요.");$("#mem_phone").focus();return false;}
				<!--문자인증 -->
// 				if (inputCpnMessage.length == 0) {alert("문자인증 해주세요.");$("#phone_check").focus();return false;}
				if (inputCpnEmail.length == 0) {alert("이메일을 입력해 주세요.");$("#mem_email").focus();return false;}
				if (inputCpnAddr1.length == 0 || inputCpnAddr2.length == 0) {alert("주소를 입력해 주세요.");$("#addr").focus();return false;	}
			});
	});
</script>     

    <section class="ftco-section contact-section">
      <div class="container">
        <div class="row d-flex mb-5 contact-info justify-content-center">
        	
          <div class="col-md-6 block-9 mb-md-5">
          <div class="form-group">
          		<p style="font-size:30px;">회원가입</p>
            </div>
            <form id="frmSignUp" action="/login/signUpPost" method="post" class="bg-light p-5 contact-form" accept-charset="UTF-8">
					<div class="form-group" id="divInputId">
						<small>아이디</small>
						<div class="input-group">
							<input type="text" class="form-control" id="mem_id" name="mem_id">
							<div class="input-group-append">
								<button type="button" id="id_check"
									class="btn btn-primary py-1 px-2" style="margin-left: 5px;">중복확인</button>
							</div>
						</div>
					</div>
					<div class="form-group">
              </div>
              <div class="form-group">
              	<small>비밀번호</small>
                <input type="password" id="mem_pw" name="mem_pw" class="form-control" placeholder="영문 8~16이내">
              	<input type="hidden" id="pwDoubleChk" value="비밀번호는 6자 이상 설정해주시기 바랍니다.">
              	<span id="dup-password"></span>
              </div>
              <div class="form-group">
              	<small>비밀번호 확인</small>
                <input type="password"  id="mem_pw_check" name="mem_pw_check" class="form-control" placeholder="확인을 위해 한번 더 입력해주세요.">
                <input class="textErr" style="color: red;" value="비밀번호가 서로 맞지 않습니다." type="hidden">
              	<span id="dup-password-check"></span>
              </div>
              <div class="form-group">
              <small>이름</small>
                <input type="text" id="mem_name" name="mem_name" class="form-control phone-input">
              </div>
              <div class="form-group">
              <small>생년월일</small>
             	 <input type="date" id="mem_birth" name="mem_birth" class="form-control" >
             	 <input class="textErr" style="color: red;" value="'-'없이 숫자8자만 입력해주세요." type="hidden">
              </div>
					<div class="form-group" id="divInputId">
						<small>휴대전화</small>
						<div class="input-group">
							<input type="text" class="form-control" id="mem_phone" name="mem_phone">
							<div class="input-group-append">
								<button type="button" id="check_send" class="btn btn-primary py-1 px-2" style="margin-left: 5px;">문자보내기</button>
							</div>
						</div>
					</div>
							<div>
							<span id="dup-phone"></span>
							</div>
					<div class="form-group">
						<div class="input-group">
							<input type="text" class="form-control" id="mem_phone_check" name="mem_phone_check">
							<div class="input-group-append">
								<button type="button" id="phone_check" class="btn btn-primary py-1 px-2" style="margin-left: 5px;">본인인증</button>
							</div>
								<span id="phoneDoubleCheck"></span>						
						</div>
					</div>
					<div class="form-group">
              <small>이메일</small>
                <input type="email" id="mem_email" name="mem_email" class="form-control">
              </div>
              <div class="form-group">
              <small>주소</small>
              <div class="input-group">
              	<input type="text"  class="form-control"  id="mem_zip_code" name="mem_zip_code" readonly="readonly" placeholder="우편번호" >
				<span class="input-group-btn">
				<input type="button"  onclick="openZipSearch();" value="우편번호 찾기" class="btn btn-secondary">
				</span>
				</div>
				<input type="text" class="form-control" id="mem_addr" name="mem_addr" onclick="openZipSearch();" readonly="readonly" placeholder="기본주소">
              </div>
              
              <div class="form-group">
                <button type="submit" id="DosignUp" class="btn btn-primary py-3 px-5">회원가입</button>
              </div>
			</form>
          </div>
          </div>
		</div>
    </section>
	
<!-- bottom -->
<%@ include file="/WEB-INF/views/include/bottom.jsp" %>