<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/top.jsp" %>
<style>
table td {
	vertical-align: middle !important;
	border-top: 1px solid #d1d1d1 !important;
}

p {
	margin-top: auto !important;
	margin-bottom: auto !important;
}
</style>
<script>




$(document).ready(function() {
    // 전체 선택 체크박스 클릭 시 모든 체크박스 선택/해제
    $("#selectAllCheckbox").click(function() {
        $(".board-checkbox").prop("checked", $(this).prop("checked"));
    });

    // 각 체크박스가 클릭될 때 전체 선택 체크박스 상태 업데이트
    $(".board-checkbox").click(function() {
        if ($(".board-checkbox:checked").length == $(".board-checkbox").length) {
            $("#selectAllCheckbox").prop("checked", true);
        } else {
            $("#selectAllCheckbox").prop("checked", false);
        }
    });

    function getCheckedBoardNumbers() {
        var checkedBoardNumbers = [];
        $('.board-checkbox:checked').each(function() {
            checkedBoardNumbers.push($(this).closest('tr').data('board-no'));
        });
        console.log("checkedBoardNumbers:",checkedBoardNumbers);
        return checkedBoardNumbers;
    }
    
    $('#btnDelete').click(function() {
        var checkedBoardNumbers = getCheckedBoardNumbers();
        $.ajax({
            url: 'admin/board/deleteCheckedBoard',
            type: 'POST',
            data: { boardNumbers: checkedBoardNumbers },
            success: function(response) {
                alert(response.message);
                // 삭제 후에 필요한 작업 수행 (예: 화면 갱신)
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
            }
        });
    });

    
    
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

		<%-- <form method="get" id="frmSearch" name="frm">
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
		</form> --%>
		<div class="dt-buttons col-sm-12 mb-3">
			<div class="flaot-left " style="vertical-align: bottom;"></div>
			<button class="btn btn-danger" type="button" id="btnDelete" >삭제</button>
			<button class="btn btn-secondary float-right" type="button" onclick="window.open('/board/list', '_blank')"
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
								            <th scope="col"><input type="checkbox" id="selectAllCheckbox"></th>
								            <th scope="col">글번호</th>
								            <th scope="col">제목</th>
								            <th scope="col">등록일</th>
								            <th scope="col">조회수</th>     
								        </tr>
								    </thead>
								    <tbody>
								        <c:forEach items="${boardVO}" var="boardVO">
								            <tr class="board-row" data-board-no="${boardVO.board_no}">
								                <td style="text-align: center;">
								                    <input type="checkbox" class="board-checkbox">
								                </td>
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