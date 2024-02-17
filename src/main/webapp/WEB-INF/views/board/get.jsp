<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- 테이블 CSS -->
<%@ include file="/WEB-INF/views/include/boardGetStyle.jsp" %>   

<script>
//등록일 날짜변환
function formattedDate(cdate) {
	if (!cdate) {
        return "";
    }
    
    var date = new Date(cdate);
    
    var year = date.getFullYear();
    var month = ("0" + (date.getMonth() + 1)).slice(-2);
    var day = ("0" + date.getDate()).slice(-2);
    var hours = ("0" + date.getHours()).slice(-2);
    var minutes = ("0" + date.getMinutes()).slice(-2);
    var seconds = ("0" + date.getSeconds()).slice(-2);
    
    return year + "-" + month + "-" + day + "   " + hours + ":" + minutes;
}

$(document).ready(function() {
	$(".cdate").each(function() {
		var cdate= $(this).text();
		if (cdate) {
			$(this).text(formattedDate(cdate));
		}
	});
	
});

$(function(){
	$(".btn-oper").click(function(){
		console.log("클릭");
		var operation = $(this).data("oper");
		var no = $(this).data("no");
		console.log("operation:" , operation);
		console.log("no:" , no);
		
		if (operation == "modify") {
			window.location.href = '/board/modify?board_no=' + no;
		} else if (operation == "delete"){
			if(confirm("게시글을 삭제하시겠습니까?")) {
				$.ajax({
					type:"post",
					url : "/board/remove",
					data : {"board_no" : no},
					success : function(rData) {
						alert("삭제되었습니다.");
						window.location.href = '/board/list';
					},
					error : function() {
						console.log("error");
					}
				
				})
			}
		} else if (operation == "answer") {
			window.location.href = '/board/answer?board_no=' + no;
		}
	});
	
	var modifyResult = '${modifyResult}';
	if(modifyResult){
		alert("수정이 완료되었습니다.");
	}
	
	$("#btnlist").click(function(e){
		e.preventDefault();
		var frmCriteria = $("#frmCriteria");
		frmCriteria.attr("action","/board/list");
		frmCriteria.submit();
	});

});

</script>
<%@ include file="/WEB-INF/views/include/frmCriteria.jsp" %>
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
				<table class="table">
					<thead>
                        <tr>
                        <th id="th_head">
	                        <c:if test="${boardVO.board_noticeYN eq 'Y'}">
	                        	[공지]
	                        </c:if>
                            ${boardVO.board_title}
                        </th>
                        </tr>
					</thead>
					<tbody>
                        <tr>
                            <td id="td_info">
                            	<dl id="dl_info">
                            		<dt>작성자</dt>
                            		<dt>ㅣ</dt>
								    <c:if test="${board.board_seq ne 0}">
								        <dd>관리자</dd>
								    </c:if>
								    <c:if test="${board.board_seq eq 0}">
								        <dd>${boardVO.board_mem_id}</dd>
								    </c:if>
                            	</dl>
                            	<dl id="dl_info">
                            		<dt>조회수</dt>
                            		<dt>ㅣ</dt>
                            		<dd>${boardVO.readcount}</dd>
                            	</dl>
                            	<dl id="dl_info">
                            		<dt>등록일</dt>
                            		<dt>ㅣ</dt>
                            		<dd class="cdate">${boardVO.board_cdate}</dd>
                            	</dl>
                            </td>
                        </tr>
                        <tr>
                            <td id="td_content">${boardVO.board_content}</td>
                        </tr>
                    </tbody>
				</table>
				<div class="col-md-12">
				    <div class="d-flex justify-content-end align-items-center">
				        <c:if test="${loginInfo.mem_adminck eq 1}">
				        	<button type="button" class="btn btn-primary btn-oper mr-2" data-oper="answer" data-no="${boardVO.board_no}">답글쓰기</button>
				        </c:if>
				        <c:if test="${(loginInfo.mem_id eq boardVO.board_mem_id) or (loginInfo.mem_adminck eq 1 and boardVO.board_noticeYN eq 'Y')}">
				            <button type="button" class="btn btn-primary btn-oper mr-2" data-oper="modify" data-no="${boardVO.board_no}">수정</button>
				            <button type="button" class="btn btn-primary btn-oper" data-oper="delete" data-no="${boardVO.board_no}">삭제</button>
				        </c:if>
				    </div>
				</div>
				<div class="col-md-12 d-flex justify-content-center">
				    <button type="button" class="btn btn-primary btn-oper" id="btnlist" >목록</button>
				</div>
			</div>
		</div>
	</div>
</section>
	

 <%@ include file="/WEB-INF/views/include/bottom.jsp" %> 