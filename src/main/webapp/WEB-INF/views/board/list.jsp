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
	 .pagination .page-link {
        color: #fff; 
        background-color: #f07039; 
        border-color: #f07039;
    }

    .pagination .page-item.active .page-link {
        background-color: #0056b3; 
        border-color: #0056b3; 
    }
    
    .btn-success {
        color: #fff; 
        background-color: #f07039; 
        border-color: #f07039;
    }

    .btn-success:hover {
        background-color: #218838; /* Hover background color */
        border-color: #1e7e34; /* Hover border color */
    }
    .custom-cursor {
            cursor: pointer;
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
		var deleteYN = $(this).data("deleteyn");
		var adminck = "${loginInfo.mem_adminck}";
		var loginID = "${loginInfo.mem_id}";
		
		console.log("boardNo:" , boardNo);
		console.log("boardPrivate:" , boardPrivate);
		console.log("boardID:" , boardID);
		console.log("deleteYN:" , deleteYN);
		console.log("adminck:" , adminck);
		console.log("loginID:" , loginID);
		
		if (deleteYN == "Y") {
			alert("삭제된 게시글입니다.");
			return;
		}
		
		if (boardPrivate == "N" || (boardPrivate == "Y" && adminck == 1) || (loginID == boardID)) {
			var url = "get?board_no=" + boardNo +
            "&pageNum=${pageDTO.criteria.pageNum}" +
            "&amount=${pageDTO.criteria.amount}" +
            "&keyword=${pageDTO.criteria.keyword}" +
            "&type=${pageDTO.criteria.type}";
			 // Navigate to the page
			 window.location.href = url;
	        
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
    if(registerResult == 1) {
        alert("글 등록이 완료되었습니다.");
    }
    
    // 검색기능
    $("#frmSearch").submit(function(){
		var type = $(this).find("[name=type]").val();
		var keyword = $(this).find("[name=keyword]").val();
		console.log("type:",type );
		console.log("keyword:", keyword);
		
// 	    if(keyword.trim() == ""){
// 	    	window.location.href="/board/list?type=" + type + "&keyword=" + keyword;
// 	        alert("검색어를 입력해주세요.");
// 	        $("[name=keyword]").focus();
// 	        return false;
// 	    }
// 		$.ajax({
// 			type :"get",
// 			url : "/board/search",
// 			data : {type : type,
// 					keyword : keyword},
// 			success : function(rData){
// 				console.log("rData:" , rData);
				
// 				 $("table tbody tr").hide();
				
// 				rData.forEach(function(item) {
// 	                var boardNo = item.board_no;
// 	                console.log("boardNo:" , boardNo);
// 	                $("table tbody tr[data-board-no=" + boardNo + "]").show();
// 	            });
// 			},
// 			error: function(xhr, status, error) {
// 	            console.error("Error occurred during search:", error);
// 	        }

			
// 		});  
		    
	});
    
    //페이지 번호
    $("a.page-link").click(function(e){
		e.preventDefault();
		var pageDTO = $(this).attr("href");
		var frmCriteria = $("#frmCriteria");
		frmCriteria.find("input[name=pageNum]").val(pageDTO);
		frmCriteria.find("input[name=boarad_no]").remove();
		frmCriteria.attr("action", "/board/list");
		frmCriteria.submit();
		
    });

});
</script>

<%@ include file="/WEB-INF/views/include/frmCriteria.jsp" %>

<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/resources/carbook-master/img/top2.jpg'); background-size: cover; background-position: bottom center; height: 100vh; position: relative;">
  <div class="overlay"></div>
  <div class="container">
    <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
      <div class="col-md-9 ftco-animate pb-5">
      	<p class="breadcrumbs"><span class="mr-2"><a href="/">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>고객의소리 <i class="ion-ios-arrow-forward"></i></span></p>
        <h1 class="mb-3 bread">문의게시판</h1>
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
				<form id="frmSearch" action="/board/list" method="get">
					<select class="custom-select-8" name="type">
						<option value="">------------------</option>
                        <option value="TCW" ${param.type =='TCW' ? 'selected' : ''}>전체</option>
                        <option value="T" ${param.type =='T' ? 'selected' : ''}>제목</option>
                        <option value="C" ${param.type =='C' ? 'selected' : ''}>내용</option>
                        <option value="W" ${param.type == 'W' ? 'selected' : ''}>작성자</option>
                    </select>
					<input type="text" name="keyword" value="${param.keyword}" placeholder="검색어 입력">
					<button type="submit" class="btn btn-sm btn-success" >검색</button>
				</form>
				<c:if test="${not empty loginInfo}">
					<div class="ml-auto">
						<button type="button" class="btn btn-primary btn-oper mr-2" onclick="location.href='/board/register'">글쓰기</button>
					</div>
				</c:if>

			</div>
		</div>
<%-- 		<div>noticeList:${noticeList }</div> --%>
<%-- <div>boardList:${boardList }</div> --%>
<%-- <div>pageDTO:${pageDTO }</div> --%>
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
						<tr class="notice-row custom-cursor" data-board-no="${notice.board_no}">
							<td style="font-weight: bold;">[공지]</td>
							<td style="font-weight: bold;">${notice.board_title}</td>
							<td>관리자</td>
							<td class="cdate">${notice.board_cdate}</td>
							<td>${notice.readcount}</td>
						</tr>
					</c:forEach>
					<c:forEach items="${boardList}" var="board">
						<tr class="board-row" data-board-no="${board.board_no}" 
											  data-board-private="${board.board_privateYN}"
											  data-deleteyn="${board.board_deleteYN}"
											  data-board-id="${board.board_mem_id}">
							<td>${board.board_no}</td>
							<td>
								<!-- 답글 제목처리 -->
								<c:if test="${board.board_level > 0}">
									<c:forEach begin="1" end ="${board.board_level}">
										<span style="padding-left:20px"></span>
									</c:forEach>
									<img src="/resources/carbook-master/images/arrow.png" width="12" height="12">
								</c:if>
								<!-- 비밀글 제목처리 -->
								<c:if test="${board.board_privateYN eq 'Y'}">
								<i class="fa fa-lock"></i>
								</c:if>
					            ${board.board_title}
							</td>
							<td>
							    <c:choose>
							        <c:when test="${board.board_seq ne 0}">
							            관리자
							        </c:when>
							        <c:otherwise>
							            ${board.board_mem_id}
							        </c:otherwise>
							    </c:choose>
							</td>
							<td class="cdate">${board.board_cdate}</td>
							<td>${board.readcount}</td>
<%-- 							<td style="display:none;" data-deleteyn="${board.board_deleteYN}" >${board.board_deleteYN}</td> --%>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<!-- 페이징 -->
			<div class="row" >
				<div class="col-md-12">
					<nav>
						<ul class="pagination justify-content-center">
							<c:if test="${pageDTO.prev == true}">
							<li class="page-item">
								<a class="page-link" href="${pageDTO.startPage - 1}">&laquo;</a>
							</li>
							</c:if>
							<c:forEach begin="${pageDTO.startPage}" end="${pageDTO.endPage}" var="v">
								<li class="page-item ${(board.pageDTO.pageNum == v)? 'active' :''}">
									<a class="page-link" data-oper="list" href="${v}">${v}</a>
								</li>
							</c:forEach>
							<c:if test="${pageDTO.next == true}">
								<li class="page-item">
								<a class="page-link"  id="endPage" href="${pageDTO.endPage + 1}">&raquo;</a>
							</li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
	<!-- //페이징 -->
	</div>
</section>
	

 <%@ include file="/WEB-INF/views/include/bottom.jsp" %> 