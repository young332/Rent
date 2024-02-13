<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>   
<script>
function cancleModi() {
	alert("글 수정이 취소되었습니다.");
	history.back();
	return false;
}

$(document).ready(function() {
	var content = $("#board_content").val();
	content = content.replace(/<br\s*\/?>/mg, "\n");
	$("#board_content").val(content);
});

$(function() {
	// 수정폼 전송
	$("#frmModify").submit(function(e) {
		e.preventDefault();
		var content = $("#board_content").val();
		content = content.replace(/(?:\r\n|\r|\n)/g, "<br>");
		$("#board_content").val(content);
		this.submit();
	});
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
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<form id="frmModify" role="form" action="/board/modify" method="post">
				<div class="form-group">
				<input type="hidden" name="board_no" value="${boardVO.board_no}">
					<label for="board_title">
						제목
					</label>
					<input type="text" class="form-control" id="board_title" name="board_title" value="${boardVO.board_title}" required/>
				</div>
				<div class="form-group">
					<label for="board_content">
						내용
					</label>
					<textarea rows="10" class="form-control" id="board_content" name="board_content" wrap="hard" required>${boardVO.board_content}</textarea>
				</div>
				<div class="form-group">
					<label for="board_mem_id">
						작성자
					</label>
					<input type="text" class="form-control" id="board_mem_id" name="board_mem_id"
					value="${loginInfo.mem_id}" readonly/>
				</div>
				<div class="form-group">
					<label for="board_privateYN">
						비공개 설정
					</label>
					<div>
				        <label>
				            <input type="radio" id="board_privateYN" name="board_privateYN" value="N" 
				            	<c:if test="${boardVO.board_privateYN eq 'N'}">checked</c:if>> 아니오
				        </label>
				        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				        <label>
				            <input type="radio" id="board_privateYN" name="board_privateYN" value="Y"
				            	<c:if test="${boardVO.board_privateYN eq 'Y'}">checked</c:if>> 예
				        </label>
				    </div>
				</div>
				<c:choose>
					<c:when test="${loginInfo.mem_adminck eq 1}">
						<div class="form-group">
							<label for="board_noticeYN">
								공지 설정
							</label>
							<div>
						        <label>
						            <input type="radio" id="board_noticeYN" name="board_noticeYN" value="N"
						            	<c:if test="${boardVO.board_noticeYN eq 'N'}">checked</c:if>> 아니오
						        </label>
						        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						        <label>
						            <input type="radio" id="board_noticeYN" name="board_noticeYN" value="Y"
						            	<c:if test="${boardVO.board_noticeYN eq 'Y'}">checked</c:if>> 예
						        </label>
						    </div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="form-group">
							<input type="hidden" id="board_noticeYN" name="board_noticeYN" value="N">
						</div>
					</c:otherwise>
				</c:choose>
				<div class="col-md-12 d-flex justify-content-center">
					<button type="submit" class="btn btn-primary mr-2">
						수정완료
					</button>
					<button class="btn btn-primary" onclick="cancleModi()">취소</button>
				</div>
			</form>
		</div>
	</div>	
</div>
</section>
	

 <%@ include file="/WEB-INF/views/include/bottom.jsp" %> 