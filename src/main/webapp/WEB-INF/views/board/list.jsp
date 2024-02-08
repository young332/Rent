<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>   

<script>
$(function(){
	$(".board-row").click(function() {
		console.log("클릭");
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
	
        var registerResult = "${registerResult}";
        if(registerResult !== "") {
            alert("등록이 완료되었습니다.");
        }
        
	
});
</script>
<style>
	.board-row {
    cursor: pointer;
}
body {
  color: #666;
  font: 14px/24px "Open Sans", "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", Sans-Serif;
}
table {
  border-collapse: separate;
  border-spacing: 0;
  width: 100%;
}
th,td {
  padding: 6px 15px;
}
th {
  background: #42444e;
  color: #fff;
  text-align: left;
}
tr:first-child th:first-child {
  border-top-left-radius: 6px;
  width: 8%;
}
td:nth-child(2) {
  padding-left: 10px; /* 좌측 여백 추가 */
}

th:nth-child(3), td:nth-child(3) {
  width: 13%;
}

th:nth-child(4), td:nth-child(4) {
  width: 8%;
}
tr:first-child th:last-child {
  border-top-right-radius: 6px;
  
}
td {
  border-right: 1px solid #c6c9cc;
  border-bottom: 1px solid #c6c9cc;
}
td:first-child {
  border-left: 1px solid #c6c9cc;
}
tr:nth-child(even) td {
  background: #eaeaed;
}
tr:last-child td:first-child {
  border-bottom-left-radius: 6px;
  
}
tr:last-child td:last-child {
  border-bottom-right-radius: 6px;
}
</style>   
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
		<div class="col-md-12">
			<div class="d-flex justify-content-end">
				<button type="button" class="btn btn-secondary btn-oper" onclick="location.href='/board/register'">등록</button>
			</div>
		</div>
			<table class="table">
				<thead>
					<tr>
							<th style="text-align: center;">글번호</th>
							<th style="text-align: center;">제목</th>
							<th style="text-align: center;">등록일</th>
							<th style="text-align: center;">조회수</th>
					</tr>		
				</thead>
				<tbody>
				<c:forEach items="${boardVO}" var="boardVO">
							<tr class="board-row" data-board-no="${boardVO.board_no}">
								<td style="text-align: center;">${boardVO.board_no}</td>
								<td>${boardVO.board_title}</td>
								<td style="text-align: center;"><p>${dateTime}</p></td>
								<td style="text-align: center;">${boardVO.readcount}</td>
							</tr>
						</c:forEach>
				</tbody>
			</table>
			
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
</section>
	

 <%@ include file="/WEB-INF/views/include/bottom.jsp" %> 