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
        
	$("#frmSearch").submit(function(e){
		e.preventDefault();
		 var type = $(this).find("[name=type]").val();
		 var keyword = $(this).find("[name=keyword]").val();
		 console.log("type:",type );
		 console.log("keyword:", keyword);
		 
		    if(keyword.trim() == ""){
		        alert("검색어를 입력해주세요.");
		        $("[name=keyword]").focus();
		        return false;
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
      <div class="container-fluid">
      <div class="row justify-content-center">
          <div class="col-md-12 heading-section text-center ftco-animate mb-5">
            <h2 class="mb-2">HAKA렌트카 문의게시판</h2>
          </div>
        </div>
       <div class="row">
            <div class="col-md-4" style="margin-left: 225px;">
                <form method="get" id="frmSearch" action="/board/search">
                    <div class="text-dark sch_wrap">
                        <div class="input-group col-sm-12">
                            <div class="input-group col-sm-4">
                                <select class="custom-select-8" name="type">
                                    <option value="TC" ${param.type=='TC' ? 'selected' : ''}>전체</option>
                                    <option value="T" ${param.type=='T' ? 'selected' : ''}>제목</option>
                                    <option value="C" ${param.type=='C' ? 'selected' : ''}>내용</option>
                                </select>
                            </div>
                            <div class="input-group col-sm-7 app-search" id="search-text">
                                <input type="text" class="form-control" placeholder="검색어 입력" name="keyword" value="${param.keyword}">
                                <span class="search-icon"></span>
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="submit">검색</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
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