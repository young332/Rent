<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>   

<script>
function cancleRegi() {
	if(confirm("답글 등록을 취소하시겠습니까?")) {
		history.back();
		return false; 
	} else {
		return false;
	}
}

$(function() {
	// 원글
	var parent = $("#parent_content").val();
	parent = parent.replace(/<br\s*\/?>/mg, "\n");
	$("#parent_content").val(parent);
	
	// 답글
	var content = $("#board_content").val();
	content = content.replace(/<br\s*\/?>/mg, "\n");
	$("#board_content").val(content);
	
	// 최대 글자 수 초과 검사 함수
    function checkMaxLength() {
        var currentLength = $("#board_content").val().length;
        var maxLength = 2000;
        if (currentLength > maxLength) {
            alert('입력 글자 수가 ' + maxLength + '자를 초과했습니다.');
            return false;
        }
        return true;
    }
	
	// 폼 전송
	$("#formReply").submit(function(e) {
		e.preventDefault();
		if (!checkMaxLength()) {
            return; 
        }
		var content = $("#board_content").val();
		content = content.replace(/(?:\r\n|\r|\n)/g, "<br>");
		$("#board_content").val(content);
		console.log("boardVO:")
		this.submit();
	});
	
	$("#board_content").on('input', function() {
		checkMaxLength();
	 });
});

</script>   
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/resources/carbook-master/images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs">
          	<span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> 
          	<span class="mr-2"><a href="/myPage/myPage">고객의소리 <i class="ion-ios-arrow-forward"></i></a></span> 
          	<span class="mr-2">답글쓰기 <i class="ion-ios-arrow-forward"></i></span> 
          	</p>
            <h1 class="mb-3 bread">답글쓰기</h1>
          </div>
        </div>
      </div>
    </section>
<%-- ${parent} --%>
<section class="ftco-section contact-section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="jumbotron">
					<div>
						<label for="board_title">
							원글 제목
						</label>
						<input type="text" class="form-control" value="${parent.board_title}" readonly/>
					</div>
					<div>
						<label for="board_title">
							원글 내용
						</label>
						<textarea class="form-control" rows="10" id="parent_content" readonly>${parent.board_content}</textarea>
					</div>
				</div>
				<form id="formReply" role="form" action="/board/answer.do" method="post">
					<input type="hidden" class="form-control" name="board_mem_id" value="${parent.board_mem_id}"/>
					<input type="hidden" class="form-control" name="board_no" value="${parent.board_no}"/>
					<div class="form-group">
						<label for="board_title">
							답글 제목
						</label>
						<input type="text" class="form-control" id="board_title" name="board_title" 
							   value="RE: ${parent.board_title}" required/>
					</div>
					<div class="form-group">
						<label for="board_content">
							답글 내용
						</label>
						<textarea rows="10" class="form-control textarea" id="board_content" name="board_content" wrap="hard" required>${BoardVO.board_content}</textarea>
					</div>
					<div class="form-group">
						<label for="board_privateYN">
							비공개 설정
						</label>
						<div>
					        <label>
					            <input type="radio" id="board_privateYN" name="board_privateYN" value="N" 
					            	<c:if test="${parent.board_privateYN eq 'N'}">checked</c:if>> 아니오
					        </label>
					        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					        <label>
					            <input type="radio" id="board_privateYN" name="board_privateYN" value="Y"
					            	<c:if test="${parent.board_privateYN eq 'Y'}">checked</c:if>> 예
					        </label>
				    	</div>
					</div>
					<input type="hidden" name="board_noticeYN" value="N">
					<div class="col-md-12 d-flex justify-content-center">
						<button type="submit" class="btn btn-primary mr-2">답글 등록</button>
						<button class="btn btn-primary" onclick="return cancleRegi()">취소</button>
					</div>
				</form>
			</div>
		</div>	
	</div>
</section>
	

<%@ include file="/WEB-INF/views/include/bottom.jsp" %> 