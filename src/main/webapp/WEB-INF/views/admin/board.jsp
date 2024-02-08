<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/top.jsp" %>

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

    <!-- [ content ] Start -->
    <div class="container-fluid flex-grow-1 container-p-y">
        <h4 class="font-weight-bold py-3 mb-0">Dashboard</h4>
        <div class="text-muted small mt-0 mb-4 d-block breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#"><i class="feather icon-home"></i></a></li>
                <li class="breadcrumb-item"><a href="#">게시판</a></li>
                <li class="breadcrumb-item active">게시판 관리</li>
            </ol>
        </div>
        
        <div class="card-body">

		<form method="get" id="frmSearch" name="frm">
			<div class="alert alert-light bg-light text-dark sch_wrap">
				<div class="input-group col-sm-12">
					<div class="input-group col-sm">
						<select class="custom-select" name="type">
							<option value="">전체</option>
							<option value="I" ${param.type=='I' ? 'selected' : ''}>아이디</option>
							<option value="N" ${param.type=='N' ? 'selected' : ''}>이름</option>
						</select>
					</div>
					<div class="input-group col-sm app-search">
						<input type="text" class="form-control" placeholder="검색어 입력"
							name="keyword" value="${param.keyword}"> <span
							class="search-icon"></span>
						<div class="input-group-append">
							<button class="btn btn-primary" type="submit">검색</button>
						</div>
					</div>
				</div>
			</div>
		</form>
		<div class="dt-buttons col-sm-12 mb-3">
			<div class="flaot-left " style="vertical-align: bottom;"></div>
			<button class="btn btn-secondary float-right" type="button" onclick="location.href='/board/register'"
			style="margin-bottom: 15px;"><span>공지등록</span>
			</button>
			
		</div>
		<div data-simplebar="init" class="table-responsive">
			<div class="simplebar-wrapper" style="margin: 0px;">
				<div class="simplebar-height-auto-observer-wrapper">
					<div class="simplebar-height-auto-observer"></div>
				</div>
				<div class="simplebar-mask">
					<div class="simplebar-offset" style="right: 0px; bottom: 0px;">
						<div class="simplebar-content-wrapper"
							style="height: auto; overflow: hidden;">
							<div class="simplebar-content" style="padding: 0px;">
								<table class="table mb-0 table-hover table-responsive-xl">
									<thead class="thead-dark">
										<tr style="text-align: center;">
											<th scope="col">글번호</th>
											<th scope="col">제목</th>
											<th scope="col">등록일</th>
											<th scope="col">조회수</th>     
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
						</div>
					</div>
				</div>
				<!-- <div class="simplebar-placeholder" style="width: auto; height: 680px;"></div> -->
			</div>
			<div class="simplebar-track simplebar-horizontal"
				style="visibility: hidden;">
				<div class="simplebar-scrollbar" style="width: 0px; display: none;"></div>
			</div>
			<div class="simplebar-track simplebar-vertical"
				style="visibility: hidden;">
				<div class="simplebar-scrollbar" style="height: 0px; display: none;"></div>
			</div>
		</div>
		<!-- end table-responsive -->

	</div>
        	
       

       
    </div>
    <!-- [ content ] End -->

<%@ include file="/WEB-INF/views/admin/include/bottom.jsp" %>                  