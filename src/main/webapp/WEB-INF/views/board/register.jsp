<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>   

<script>
function cancleRegi() {
	alert("글 등록이 취소되었습니다.");
	history.back();
}

$(function() {
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
	$("#formRegister").submit(function(e) {
		e.preventDefault();
		// 최대 글자 수 초과 시 폼 제출 중단
		if (!checkMaxLength()) {
            return; 
        }
		var content = $("#board_content").val();
		content = content.replace(/(?:\r\n|\r|\n)/g, "<br>");
		$("#board_content").val(content);
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
				<form id="formRegister" role="form" action="/board/register" method="post">
					<div class="form-group">
						<label for="board_title">
							제목
						</label>
						<input type="text" class="form-control" id="board_title" name="board_title" required/>
					</div>
					<div class="form-group">
						<label for="board_content">
							내용
						</label>
						<textarea rows="10" class="form-control textarea" id="board_content" name="board_content" wrap="hard" required>${BoardVO.board_content}</textarea>
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
					            <input type="radio" id="board_privateYN" name="board_privateYN" value="N" checked> 아니오
					        </label>
					        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					        <label>
					            <input type="radio" id="board_privateYN" name="board_privateYN" value="Y"> 예
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
							            <input type="radio" id="board_noticeYN" name="board_noticeYN" value="N" checked> 아니오
							        </label>
							        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							        <label>
							            <input type="radio" id="board_noticeYN" name="board_noticeYN" value="Y"> 예
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
						<button type="submit" class="btn btn-primary mr-2">글 등록</button>
						<button class="btn btn-primary" onclick="cancleRegi()">취소</button>
					</div>
				</form>
			</div>
		</div>	
	</div>
</section>
	

<%@ include file="/WEB-INF/views/include/bottom.jsp" %> 