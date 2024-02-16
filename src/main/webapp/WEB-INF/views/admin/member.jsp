<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/admin/include/top.jsp" %>
<!-- 주소찾기 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
 
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<!-- /주소찾기 -->

<!-- 비밀번호변경 유효성 검사 스크립트 include -->
<script src="/resources/js/change-pw-checker-admin.js"></script>
<!-- 비밀번호 암호화 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.1.1/crypto-js.min.js"></script>

<script>

//금액 자릿수 표시하기(콤마)
function formatNumberWithCommas(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

//회원정보수정하기
function fn_memberModify(mem_id) {
   $.ajax({
    type: 'GET',
    url: '/admin/member/getMemberInfo',  
    data: { mem_id: mem_id },
    success: function (data) {
      console.log('Success:', data);

      $("#mem_id").val(data['mem_id']);
      $("#mem_name").val(data['mem_name']);
      $("#mem_pw").val(data['mem_pw']);
      $("#mem_adminck").val(data['mem_adminck']);
      var mem_adminck = data['mem_adminck'];
      if (mem_adminck == 0) {
       	$("#mem_adminck").val("0").prop("selected", true);
      } 
      if (mem_adminck == 1) {
       	$("#mem_adminck").val("1").prop("selected", true);
      }
      if (mem_adminck == 2) {
       	$("#mem_adminck").val("2").prop("selected", true);
      }
    	    
      $("#mem_birth").val(data['mem_birth']);
      $("#mem_phone").val(data['mem_phone']);
      $("#mem_email").val(data['mem_email']);
      $("#mem_zip_code").val(data['mem_zip_code']);
      $("#mem_addr").val(data['mem_addr']);

      $("#MembermodifyModal").modal("show");   
    }
    
  }); 
}

//개별 포인트현황
function fn_memberPoint(mem_id) {
   $.ajax({
    type: 'GET',
    url: '/admin/member/getMemberPoint',  
    data: { mem_id: mem_id },
    success: function (data) {
      console.log('Success:', data);
      var tbody = $("#pointTable > tbody");
      tbody.empty();

      //데이터가 없을 경우 처리
      if (data.length == 0) {
          var row = $("<tr>");
          row.append($("<td colspan='4'>").text("포인트 현황이 없습니다."));
          tbody.append(row);
      } else {
          $.each(data, function(index, point) {
              var row = $("<tr>");
              row.append($("<td>").text(point.point_user_id));
              row.append($("<td>").text(point.point_code_name));
              row.append($("<td class='point'>").text(formatNumberWithCommas(point.point_cost)));
              
              // 사용일 Date형식 변환(상단 라이브러리 추가)
			  var formattedDate = moment.utc(point.point_use_date).format('YYYY-MM-DD');
			  //console.log("formattedDate:" ,formattedDate);
			  var $td = $("<td>").text(formattedDate);
			  row.append($td);
			  tbody.append(row);
			  
           	  // 클릭한 버튼의 mem_id 값을 가져와서 설정
              $("#point_user_id").val(point.point_user_id);  
              $("#point_mem_id").val(point.point_user_id);  
          });
      }
      $("#PointModal").modal("show");
     }
   }); 
}

//주소 검색
function openZipSearch() {
    new daum.Postcode({
    	oncomplete: function(data) {     
		var addr = ''; 
		if (data.userSelectedType === 'R') { 
			addr = data.roadAddress;
		} else {
			addr = data.jibunAddress;
		}

		$("#mem_zip_code").val(data.zonecode);
		$("#mem_addr").val(addr);
		$("#mem_addr").focus();
        }
    }).open();
}

$(function() {
	
	$(".point a").each(function() {
	    var point = $(this).text();
	    if (point) {
	        $(this).text(formatNumberWithCommas(point));
	    }
	});
	
	//검색
	$("#frmSearch").submit(function(event) {
	    event.preventDefault();
	    
	    var type = $(this).find("[name=type]").val();
	    var keyword = $(this).find("[name=keyword]").val();
	    console.log("type",type );
	    console.log("keyword", keyword);

	    if(type == ""){
	        alert("검색조건을 선택해주세요.");
	        $("[name=type]").focus();
	        return false;
	    }

	    if(keyword.trim() == ""){
	        alert("검색어를 입력해주세요.");
	        $("[name=keyword]").focus();
	        return false;
	    }

	    $.ajax({
	        type: "GET",
	        url: "/admin/member/search", 
	        data: { type: type, 
	        	    keyword: keyword },
	        success: function(response) {
	            console.log("검색 결과:", response);
	            var tbody = $(".table tbody");
	            tbody.empty();

	            $.each(response, function(index, member) {
	                
	                var row = $("<tr>");

	                row.append($("<td>").text(member.mem_id));
	                row.append($("<td>").html("<a href='javascript:void(0);' onclick=\"javascript:fn_memberModify('" + member.mem_id + "');\">" + member.mem_name + "</a>"));
	                var memberTypeText = member.mem_type == 1 ? "관리자" : "일반회원"; 
	                row.append($("<td>").html("<div class='badge badge-pill badge-primary typeM'>" + memberTypeText + "</div>"));
	                /* row.append($("<td>").text(member.mem_birth)); */
	                row.append($("<td>").text(member.mem_email));
	                row.append($("<td>").text(member.mem_phone));
	                row.append($("<td>").text(member.mem_addr));
	                row.append($("<td>").html("<a href='javascript:void(0);' onclick=\"javascript:fn_memberPoint('" + member.mem_id + "');\">" + member.mem_point + "</a>"));
	                
	                // 가입일 Date형식 변환
	                var date = new Date(member.mem_cdate);
	                var year = date.getFullYear();
	                var month = (date.getMonth() + 1).toString().padStart(2, "0");
	                var day = date.getDate().toString().padStart(2, "0");
	                var formattedDate = year + "-" + month + "-" + day;
	                row.append($("<td>").text(formattedDate));
	                tbody.append(row);
	            });
	            
	        },
	        error: function(xhr, status, error) {
	            console.error("검색 오류:", error);
	        }
	    });

	});

	//비밀번호변경 모달열기
	$("#pwdChange").click(function() {
		var password1 = $("#mem_pw").val();
		console.log(password1);
		$("#password1").val(password1);
		$("#newPassword").val("");
		$("#confirmPassword").val("");
		$("#invalid-message1").text("비밀번호는 영문 대/소문자, 숫자, 특수문자를 1개 이상 포함한 8~16자입니다.");
		$("#invalid-message2").hide();
		$("#modal-pwdChangeForm").modal("show");
	});
	
	//비밀번호변경 처리
	$("#btn-pwdChange-save").click(function() {
	    validatePasswordChangeForm();
	});
	
	//포인트충전 모달열기
	$("#btnPoint").click(function() {
		var mem_id = $("#point_mem_id").val();
		console.log(mem_id);
		$("#PointInModal").modal("show");
	});
	
	//포인트충전 form전송
	$("#btn-point-save").click(function(){
        // 입력된 값을 가져와서 mem_point input의 value로 설정
        var memPointValue = $("#in_point").val();
        $("#point_cost").val(memPointValue);
        console.log("memPointValue:",memPointValue);

        $("#FrmpointIn").submit();
    });
});
</script>
<style>
.typeM{
	font-size: 0.9rem;
}
.point{
	font-weight: bold;
}
</style>

<!-- [ content ] Start -->
<div class="container-fluid flex-grow-1 container-p-y">
    <h4 class="font-weight-bold py-3 mb-0">회원목록</h4>
    <div class="text-muted small mt-0 mb-4 d-block breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="feather icon-home"></i></a></li>
            <li class="breadcrumb-item"><a href="#">회원관리</a></li>
            <li class="breadcrumb-item active">회원목록</li>
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
											<!-- <th scope="col"><input type="checkbox" id="selectAllCheckbox"></th> -->
											<th scope="col">아이디</th>
											<th scope="col">이름</th>
											<th scope="col">회원구분</th>
											<!-- <th scope="col">생년월일</th> -->
											<th scope="col">메일</th>
											<th scope="col">연락처</th>
											<th scope="col">주소</th>
											<th scope="col">포인트</th>
											<th scope="col">가입일</th>

										</tr>
									</thead>
									<tbody>
										<c:forEach var="memberVO" items="${MemberList}">
											<tr style="text-align: center;">
												<!-- <td style="text-align: center;">
								                    <input type="checkbox" class="board-checkbox">
								                </td> -->
												<td>${memberVO.mem_id}</td>
												<td><a href="javascript:void(0);"
													onclick="javascript:fn_memberModify('${memberVO.mem_id}');">${memberVO.mem_name}</a>
												</td>
												<td>
													<div class="badge badge-pill badge-primary typeM">
														<c:choose>
															<c:when test="${memberVO.mem_adminck == 0}">일반회원</c:when>
															<c:when test="${memberVO.mem_adminck == 1}">관리자</c:when>
															<c:when test="${memberVO.mem_adminck == 2}">비회원</c:when>
															<c:otherwise>알 수 없는 상태</c:otherwise>
														</c:choose>
													</div>
												</td>
												<%-- <td>${memberVO.mem_birth}</td> --%>
												<td>${memberVO.mem_email}</td>
												<td>${memberVO.mem_phone}</td>
												<td>${memberVO.mem_addr}</td>
												<%-- <td>${memberVO.mem_point}</td> --%>
												<td class="point"><a href="javascript:void(0);"
													onclick="javascript:fn_memberPoint('${memberVO.mem_id}');">${memberVO.mem_point}</a></td>
												<td>${memberVO.mem_cdate}</td>
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