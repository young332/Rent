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
    
    //검색
	$("#frmSearch").submit(function(event) {
	    event.preventDefault();

	});

	//예약상태 필터링 기능
    $("#statusFilter").change(function() {
        var selectedStatus = $(this).val();
        var found = false; //결과가 있는지 여부

        if (selectedStatus) {
            $(".table tbody tr").hide(); 
            $(".table tbody tr").each(function() {
                var status = $(this).find("td:nth-child(8)").text(); 
                if (status == selectedStatus) {
                    $(this).show();
                    found = true;
                }
            });
        } else {
            $(".table tbody tr").show(); 
            found = true; 
        }
        //결과가 없는 경우 메시지 추가
        if (!found) {
            var messageRow = "<tr><td colspan='9' style='font-size: 0.9rem; text-align: center; font-weight: bold;'>해당 내역이 없습니다.</td></tr>";
            $(".table tbody").append(messageRow);
        } else {
            //결과가 있는 경우 메시지 삭제
            $(".table tbody tr:has(td[colspan='9'])").remove();
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
						<select class="custom-select" name="statusFilter" id="statusFilter">
							   <option value="">전체</option>
							   <option value="예약중">예약중</option>
							   <option value="예약완료">예약완료</option>
							   <option value="이용중">이용중</option>
							   <option value="이용완료">이용완료</option>
							   <option value="기한만료">기한만료</option>
							   <option value="예약취소">예약취소</option>
						</select>
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


<%@ include file="/WEB-INF/views/admin/include/bottom.jsp" %>                  