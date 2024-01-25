<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/top.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- top -->
   
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
$(function(){
	$("#find_id").click(function(e){
		e.preventDefault();
		console.log("클릭");
		
		var mem_name = $("#mem_name").val();
		var mem_phone = $("#mem_phone").val();
		
		var url = "/login/findIdRun";
		var sData = {"mem_name" : mem_name,
					"mem_phone" : mem_phone	};
		$.ajax({    
			type : 'post',    
			url : '/login/findIdRun',   
			async : true,   
			headers : {       
				"Content-Type" : "application/json",      
				"X-HTTP-Method-Override" : "POST"    
			},   
			dataType : 'text',       // 데이터 타입 (html, xml, json, text 등등)    
			data : JSON.stringify({  // 보낼 데이터 (Object , String, Array)      
				"mem_name" : mem_name,      
				"mem_phone" : mem_phone
			}),    
			success : function(result) { // 결과 성공 콜백함수        
				console.log(result);
				var findid = $("#findeModal_id").text(result);
				console.log("findid:",findid);
				$("#findIdModal").modal("show");
				
			},    
			error : function(request, status, error) { // 결과 에러 콜백함수        
				console.log(error)    
				}
			
			});
	});
	
});
</script> 
    <section class="ftco-section contact-section">
      <div class="container">
        <div class="row d-flex mb-5 contact-info justify-content-center">
        	
          <div class="col-md-6 block-9 mb-md-5">
          	<div class="form-group">
          		<p style="font-size:30px;">아이디 찾기</p>
            </div>
            <div class="form-group">
            	<p>렌트카의 가입된 정보를 입력해주세요.</p>
            </div>
            <form action="#" class="bg-light p-5 contact-form">
            <div class="form-group">
              <div class="form-group">
             	<label for="mem_name">이름</label>
                <input type="text" id="mem_name" name="mem_name" class="form-control" placeholder="이름를 입력해주세요." value="이순신">
              </div> 
              <div class="form-group">
              	<label for="mem_phone">휴대전화</label>
                <input type="number"  id="mem_phone"  name="mem_phone" class="form-control" placeholder="핸드폰 번호를 입력해주세요." value="01015450428">
              </div>
              <div class="form-group">
                <button type="button" id="find_id" class="btn btn-primary py-3 px-5">아이디 찾기</button>
              </div>
				<div class="loginBtns">
					<a href="/login/login" style="margin-right: 30px;">로그인</a>
					<a href="/login/findPw" style="margin-right: 30px;">비밀번호 찾기</a>
					<br>
				</div>
				</div>
			</form>
          </div>
		</div>
      </div>
      
     <!-- 모달창 -->
    <div class="row">
		<div class="col-md-12">
			 <a style="display:none;"  
			 id="modal-363039" href="#findIdModal" role="button" class="btn" data-toggle="modal">Launch demo modal</a>
			
			<div class="modal fade" id="findIdModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								아이디 찾기
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<a id="findeModal_id"></a>
						</div>
						<div class="modal-footer"> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">
								닫기
							</button>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>
     <!-- 모달창 끝 -->
</section>
<!-- bottom -->
<%@ include file="/WEB-INF/views/include/bottom.jsp" %>
