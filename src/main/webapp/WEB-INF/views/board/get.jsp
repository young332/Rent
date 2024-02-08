<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>   
<script>
$(function(){
	$(".btn-oper").click(function(){
		console.log("클릭");
		var operation = $(this).data("oper");
		var no = $(this).data("no");
		console.log("operation:" , operation);
		console.log("no:" , no);
		
		if(operation == "modify"){
			window.location.href = '/board/modify?board_no=' + no;
		} else if(operation == "delete"){
			if(confirm("삭제하시겠습니까?")){
				$.ajax({
					type:"post",
					url : "/board/remove",
					data : {"board_no" : no},
					success : function(rData){
						alert("삭제되었습니다.");
						window.location.href = '/board/list';
					},
					error : function(){
						console.log("error");
					}
				
				})
			}
		}
		
	});
	var modifyResult = '${modifyResult}';
	if(modifyResult){
		alert("수정이 완료되었습니다.");
	}
	
});
</script>   
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/resources/carbook-master/images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="/">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>공지사항 <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-3 bread">공지사항</h1>
          </div>
        </div>
      </div>
</section>

<section class="ftco-section contact-section">
      <div class="container-fluid">
      <div class="row justify-content-center">
          <div class="col-md-12 heading-section text-center ftco-animate mb-5">
            <h2 class="mb-2">HAKA렌트카 공지사항</h2>
          </div>
        </div>
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<table class="table">
				<thead>
					 <tbody>
                        <tr>
                            <th><h4>${boardVO.board_title}</h4></th>
                        </tr>
                        <tr>
                            <th><p>${dateTime}</p></th>
                        </tr>
                        <tr>
                            <th>${boardVO.board_content}</th>
                        </tr>
                    </tbody>
			</table>
			<div class="col-md-12 text-center">
				<button type="button" class="btn btn-secondary btn-oper" onclick="location.href='/board/list'">목록</button>
			</div>
			<div class="col-md-12">
				<div class="d-flex justify-content-end">
					<button type="button" class="btn btn-secondary btn-oper mr-2" data-oper="modify" data-no="${boardVO.board_no}">수정</button>
					<button type="button" class="btn btn-secondary btn-oper" data-oper="delete" data-no="${boardVO.board_no}">삭제</button>
			</div>
			</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
</section>
	

 <%@ include file="/WEB-INF/views/include/bottom.jsp" %> 