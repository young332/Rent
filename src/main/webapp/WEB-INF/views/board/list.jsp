<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script> 
  
<!-- 테이블 CSS -->
<%@ include file="/WEB-INF/views/include/boardStyle.jsp" %>
<style>
    .custom-select-8 {
        width: 130px;
    }
    .pagination {
    display: flex;
    justify-content: center;
}
</style>
<script>
// 등록일 날짜변환
function formattedDate(cdate) {
	return new Date(cdate).toISOString().split('T')[0];
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
	// 공지 게시물
	$(".notice-row").click(function() {
		console.log("공지클릭");
		var boardNo = $(this).data("board-no");
		
		console.log("boardNo:" , boardNo);
		
       	window.location.href = "get?board_no=" + boardNo;
        
        $.ajax({
        	type: "GET",
            url: "/board/readCount?board_no=" + boardNo,
            success: function(rData) {
            	console.log("rData:" , rData);
            },
            error : function(){
            	console.log("error");
            }
        });
			
	});

	// 일반 게시물
	$(".board-row").click(function() {
		console.log("클릭");
		var boardNo = $(this).data("board-no");
		var boardPrivate = $(this).data("board-private");
		var boardID = $(this).data("board-id");
		var adminck = "${loginInfo.mem_adminck}";
		var loginID = "${loginInfo.mem_id}";
		
		console.log("boardNo:" , boardNo);
		console.log("boardPrivate:" , boardPrivate);
		console.log("boardID:" , boardID);
		console.log("adminck:" , adminck);
		console.log("loginID:" , loginID);
		
		if (boardPrivate == "N" || (boardPrivate == "Y" && adminck == 1) || (loginID == boardID)) {
	       	window.location.href = "get?board_no=" + boardNo;
	        
	        $.ajax({
	        	type: "GET",
	            url: "/board/readCount?board_no=" + boardNo,
	            success: function(rData) {
	            	console.log("rData:" , rData);
	            },
	            error : function(){
	            	console.log("error");
	            }
	        });
		} else {
			alert("비밀글입니다.");
			return;
		}
			
	});
	
	// 등록완료 메세지
    var registerResult = "${registerResult}";
    if(registerResult !== "") {
        alert("등록이 완료되었습니다.");
    }
    
    // 검색기능
    $("#frmSearch").submit(function(e){
		e.preventDefault();
		var type = $(this).find("[name=type]").val();
		var keyword = $(this).find("[name=keyword]").val();
		console.log("type:",type );
		console.log("keyword:", keyword);
		
	    if(keyword.trim() == ""){
	    	window.location.href="/board/list";
// 	        alert("검색어를 입력해주세요.");
// 	        $("[name=keyword]").focus();
// 	        return false;
	    }
	    
		$.ajax({
			type :"get",
			url : "/board/search",
			data : {type : type,
					keyword : keyword},
			success : function(rData){
				console.log("rData:" , rData);
				
				 $("table tbody tr").hide();
				
				rData.forEach(function(item) {
	                var boardNo = item.board_no;
	                console.log("boardNo:" , boardNo);
	                $("table tbody tr[data-board-no=" + boardNo + "]").show();
	            });
			},
			error: function(xhr, status, error) {
	            console.error("Error occurred during search:", error);
	        }

			
		});  
		    
	});

});
</script>
   
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/resources/carbook-master/images/bg_3.jpg');" data-stellar-background-ratio="0.5">
  <div class="overlay"></div>
  <div class="container">
    <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
      <div class="col-md-9 ftco-animate pb-5">
      	<p class="breadcrumbs"><span class="mr-2"><a href="/">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>문의사항 <i class="ion-ios-arrow-forward"></i></span></p>
        <h1 class="mb-3 bread">문의사항</h1>
      </div>


    </div>
  </div>
</section>
    
<section class="ftco-section contact-section">
    <div class="container">
    	<div class="row justify-content-center">
	        <div class="col-md-12 heading-section text-center ftco-animate mb-5">
	          <h2 class="mb-2">HAKA렌트카 문의게시판</h2>
	        </div>
      	</div>
      
		<div class="row">
			<div class="col-md-12 d-flex mb-1">
				<form id="frmSearch" action="/board/search" method="get">
					<label>검색</label>
					<select class="custom-select-8" name="type">
						<option value="">------------------</option>
                        <option value="TCW" ${param.type =='TCW' ? 'selected' : ''}>전체</option>
                        <option value="T" ${param.type =='T' ? 'selected' : ''}>제목</option>
                        <option value="C" ${param.type =='C' ? 'selected' : ''}>내용</option>
                        <option value="W" ${param.type == 'W' ? 'selected' : ''}>작성자</option>
                    </select>
					<input type="text" name="keyword" value="${param.keyword}" placeholder="검색어 입력">
					<button type="submit" class="btn btn-sm btn-success">검색</button>
				</form>
				<c:if test="${not empty loginInfo}">
					<div class="ml-auto">
						<button type="button" class="btn btn-secondary btn-oper mr-2" onclick="location.href='/board/register'">글쓰기</button>
					</div>
				</c:if>

			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12">
				<table class="table">
					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>조회수</th>
						</tr>		
					</thead>
					<tbody>
					<c:forEach items="${noticeList}" var="notice">
						<tr class="notice-row" data-board-no="${notice.board_no}">
							<td style="font-weight: bold;">[공지]</td>
							<td style="font-weight: bold;">${notice.board_title}</td>
							<td>${notice.board_mem_id}</td>
							<td class="cdate">${notice.board_cdate}</td>
							<td>${notice.readcount}</td>
						</tr>
					</c:forEach>
					<c:forEach items="${boardList}" var="board">
						<tr class="board-row" data-board-no="${board.board_no}" 
											  data-board-private="${board.board_privateYN}" 
											  data-board-id="${board.board_mem_id}">
							<td>${board.board_no}</td>
							<td>
								<c:if test="${board.board_privateYN eq 'Y'}">
								<i class="fa fa-lock"></i>
								</c:if>
							${board.board_title}</td>
							<td>${board.board_mem_id}</td>
							<td class="cdate">${board.board_cdate}</td>
							<td>${board.readcount}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</section>
	

 <%@ include file="/WEB-INF/views/include/bottom.jsp" %> 