<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<!-- top -->
<!-- 주소 -->
  	<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.min.js" /></script>
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
	$("#frmSignUp").submit(function() {
		
		var inputId = $("#mem_id").val();
		var inputPwd = $("#mem_pw").val();
		var inputPwdCfm = $("#mem_pw_check").val();
		var inputCpnName = $("#mem_name").val();
		var inputCpnBirth = $("#mem_birth").val();
		var inputCpnTelNo = $("#mem_phone").val();
		var inputCpnEmail = $("#mem_email").val();
		<!--주소-->
		var inputCpnAddr1 = $("#zip_code").val();
		var inputCpnAddr2 = $("#addr").val();
		
		
		if(inputId.length == 0) { alert("아이디를 입력해 주세요."); $("#mem_id").focus(); return false; }
// 		if(isCheckId == 0) { alert("아이디 중복 체크를 해주세요."); $("#mem_id").focus(); return; }
		
		if(inputPwd.length == 0) { alert("비밀번호를 입력해 주세요."); $("#mem_pw").focus(); return  false; }
		if(inputPwd != inputPwdCfm) { alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); $("#mem_pw").focus(); return false; }
		
		
		if(inputCpnTelNo.length == 0) { alert("전화번호를 입력해 주세요."); $("#mem_phone").focus(); return  false; }
		
		if(inputCpnEmail.length == 0) { alert("이메일을 입력해 주세요."); $("#mem_email").focus(); return false; }
		
		
		if(inputCpnAddr1.length == 0 || inputCpnAddr2.length == 0) { 
			alert("주소를 입력해 주세요."); $("#addr").focus();  return  false;
		}
		

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
                <button type="button" id="id_check"  class="btn btn-primary py-2 px-2" style="margin-left: 5px;">중복확인</button>
                </div>
               </div>
               </div>
                <div class="form-group">
              </div>
              <div class="form-group">
              	<small>비밀번호</small>
                <input type="password" id="mem_pw" name="mem_pw" class="form-control" placeholder="영문 8~16이내">
                <input class="textErr" style="color: red;" value="입력하신 비밀번호는 올바른 형식이 아닙니다." type="hidden">
              </div>
              <div class="form-group">
              	<small>비밀번호 확인</small>
                <input type="password"  id="mem_pw_check" name="mem_pw_check" class="form-control" placeholder="확인을 위해 한번 더 입력해주세요.">
                <input class="textErr" style="color: red;" value="비밀번호가 서로 맞지 않습니다." type="hidden">
              </div>
              <div class="form-group">
              <small>이름</small>
                <input type="text" id="mem_name" name="mem_name" class="form-control">
              </div>
              <div class="form-group">
              <small>생년월일</small>
             	 <input type="number" id="mem_birth" name="mem_birth" class="form-control" >
             	 <input class="textErr" style="color: red;" value="'-'없이 숫자8자만 입력해주세요." type="hidden">
              </div>
              <div class="form-group">
              <small>휴대폰</small>
                <input type="number" id="mem_phone" name="mem_phone" class="form-control">
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