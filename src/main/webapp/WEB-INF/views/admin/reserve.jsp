<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/admin/include/top.jsp" %>

<script>

//금액 자릿수 표시하기(콤마)
function formatNumberWithCommas(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$(function() {
	$(".totalpay").each(function() {
	    var totalpay = $(this).text();
	    if (totalpay) {
	        $(this).text(formatNumberWithCommas(totalpay));
	    }
   	});
	
	//전체 선택 체크박스 클릭 시 모든 체크박스 선택/해제
    $("#selectAllCheckbox").click(function() {
        $(".board-checkbox").prop("checked", $(this).prop("checked"));
    });

    //각 체크박스가 클릭될 때 전체 선택 체크박스 상태 업데이트
    $(".board-checkbox").click(function() {
        if ($(".board-checkbox:checked").length == $(".board-checkbox").length) {
            $("#selectAllCheckbox").prop("checked", true);
        } else {
            $("#selectAllCheckbox").prop("checked", false);
        }
    });
	
});
</script>

<!-- [ content ] Start -->
<div class="container-fluid flex-grow-1 container-p-y">
    <h4 class="font-weight-bold py-3 mb-0">회원예약관리</h4>
    <div class="text-muted small mt-0 mb-4 d-block breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="feather icon-home"></i></a></li>
            <li class="breadcrumb-item"><a href="#">회원관리</a></li>
            <li class="breadcrumb-item active">회원예약관리</li>
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
			<button class="btn btn-secondary flaot-left" type="button"
				onclick="javascript:fn_excel('member','');">
				<span>엑셀 다운로드</span>
			</button>
			<div class="float-right" style="vertical-align: bottom;"></div>
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
											<th scope="col">예약번호</th>
											<th scope="col">아이디</th>
											<th scope="col">이용시작일</th>
											<th scope="col">이용종료일</th>
											<th scope="col">차량</th>
											<th scope="col">결제금액</th>
											<th scope="col">예약상태</th>
											<th scope="col">결제상태</th>
										</tr>
									</thead>
									<tbody class="table">
										<c:forEach var="reserveVO" items="${reserveList}">
											<tr style="text-align: center;">
												<td style="text-align: center;">
								                    <input type="checkbox" class="board-checkbox">
								                </td>
												<td>${reserveVO.res_rid}</td>
												<td>${reserveVO.res_mem_id}</td>
												<td>
													<div class="badge badge-primary" style="font-size: 0.9rem">
														${reserveVO.res_rental_date}
													</div>
												</td>
												<td>
													<div class="badge badge-info" style="font-size: 0.9rem">
														${reserveVO.res_return_date}
													</div>
												</td>
												<td>${reserveVO.res_car_id}</td>
												<td class="totalpay" style="font-weight: bold;">${reserveVO.res_totalpay}</td>
												<td style="color: ${reserveVO.res_status == '예약완료' ? 'red' : 'inherit'}; font-weight: ${reserveVO.res_status == '예약완료' ? 'bold' : 'normal'};">${reserveVO.res_status}</td>
        										<td style="color: ${reserveVO.pay_status == '결제완료' ? 'red' : 'inherit'}; font-weight: ${reserveVO.pay_status == '결제완료' ? 'bold' : 'normal'};">${reserveVO.pay_status}</td>
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
<!-- 회원정보 수정 -->
<div class="row">
	<div class="col-md-12">
		<div class="modal fade" id="MembermodifyModal" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg " role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="messageModalLabel">회원정보 수정</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>

					<div class="modal-body">
						<form id="formModify" action="/admin/member/memberModify_submit" method="post">
						<div class="form-row">
						    <div class="form-group col-md-6">
						      <label for="id">아이디</label>
						      <input type="text" class="form-control" id="mem_id" name="mem_id" value="" readonly>
						    </div>
						    <div class="form-group col-md-6">
						      <label for="name">이름</label>
						      <input type="text" class="form-control" id="mem_name" name="mem_name" value="" readonly>
						    </div>
					    </div>
					    <div class="form-group">
						    <label for="pwd">비밀번호</label>
						    <div style="display: flex; align-items: center;">
					      	<input type="password" class="form-control" id="mem_pw" name="mem_pw" 
					      		   value="" style="margin-right: 10px;" readonly>
					     	<button type="button" id="pwdChange" class="btn btn-primary" style="flex-shrink: 0;">변경</button>
					      </div>
						</div>
						<div class="form-row">
						    <div class="form-group col-md-6">
								<label class="form-label">회원구분</label>
								<select name="mem_adminck" class="custom-select" id="mem_adminck">
									<option value="0" selected>일반회원</option>
									<option value="1">관리자</option>
									<option value="2">비회원</option>
								</select>
							</div>
						    <div class="form-group col-md-6">
						      <label for="birthDay">생년월일</label>
						      <input type="date" class="form-control" id="mem_birth" name="mem_birth" value="" required>
						    </div>
					    </div>
					    <div class="form-row">
						    <div class="form-group col-md-6">
						      <label for="phoneNumber">휴대폰 번호</label>
						      <input type="text" class="form-control" id="mem_phone" name="mem_phone" value="" required>
						    </div>
						    <div class="form-group col-md-6">
						      <label for="email">이메일</label>
						      <input type="email" class="form-control" id="mem_email" name="mem_email" value="" required>
						    </div>
						</div>
					    <div class="form-group">
			              <small>주소</small>
			              <div class="input-group" style="display: flex; align-items: center;">
			              	<input type="text"  class="form-control"  id="mem_zip_code" name="mem_zip_code" 
			              		   value="" style="margin-right: 10px;" readonly>
							<span class="input-group-btn">
							<input type="button"  onclick="openZipSearch();" value="우편번호 찾기" class="btn btn-secondary">
							</span>
							</div>
							<input type="text" class="form-control" id="mem_addr" name="mem_addr" readonly="readonly" value="">
			              </div>
						<hr>
						<button type="submit" class="btn btn-primary">수정완료</button>
					  </form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 모달끝 -->
<!-- 비밀번호 변경 모달창 -->
	<div class="modal fade" id="modal-pwdChangeForm" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> -->
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel">
						비밀번호 변경
					</h5> 
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					</div>
						<div class="modal-body">
						<label for="pwd">현재 비밀번호</label>
						<input type="password" class="form-control" id="password1">
					</div>
					<div class="modal-body">
						<label for="pwd">새 비밀번호</label>
						<input type="password" class="form-control" id="newPassword">
						<div id="invalid-message1"></div>
					</div>
					<div class="modal-body">
						<label for="pwd">새 비밀번호 확인</label>
						<input type="password" class="form-control" id="confirmPassword">
						<div id="invalid-message2">비밀번호가 일치하지 않습니다.</div>
          		        <div id="invalid-message3">비밀번호를 입력하세요.</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary" id="btn-pwdChange-save">
							저장
						</button> 
						<button type="button" class="btn btn-secondary" data-dismiss="modal">
							닫기
						</button>
					</div>
			  </div>
		</div>
	</div>
<!-- // 비밀번호 변경 모달창 -->
<!-- 포인트 모달창 -->
<div class="modal fade" id="PointModal" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myModalLabel">포인트 현황</h5>
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<button type="button" id="btnPoint" class="btn btn-info" style="margin-bottom: 17px;float: right;" >충전</button>
				<table id="pointTable" class="table mb-0 table-hover table-responsive-xl">
					<tbody>
					<thead class="thead-dark">
						<tr>
							<th scope="col">아이디</th>
							<th scope="col">이용현황</th>
							<th scope="col">금액</th>
							<th scope="col">발생일</th>
						</tr>
					</thead>
					</tbody>
				</table>
			</div>

			<div class="modal-footer">
				<!-- <button type="" class="btn btn-primary" id="btn-pwdChange-save">확인</button> -->
				<button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>
<!-- // 포인트 모달창 -->
<!-- 포인트 충전 모달창 -->
<div class="modal fade" id="PointInModal" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myModalLabel">포인트 충전</h5>
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<form action="/admin/member/pointIn" method="post" id="FrmpointIn">
				<input type="hidden" name="point_code" value="POINT_C">
				<input type="hidden" name="mem_id" id="point_mem_id" value="">
				<input type="hidden" name="point_user_id" id="point_user_id" value="">
				<input type="hidden" name="point_cost" id="point_cost" value="">
				
				<div class="modal-body" style="display: flex; align-items: center;">
				    <label style="margin-right: 10px;">충전금액:</label>
				    <input class="form-control" type="number" name="mem_point" id="in_point" style="width: 65%;">원		    
				</div>
	
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btn-point-save">확인</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- // 포인트 충전 모달창 -->

<%@ include file="/WEB-INF/views/admin/include/bottom.jsp" %>                  