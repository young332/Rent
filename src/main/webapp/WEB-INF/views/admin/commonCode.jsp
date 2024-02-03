<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	 $(function(){
		
		var AddCodeName = '<c:out value="${AddCodeName}"/>';
		var ModifyCodeName = '<c:out value="${ModifyCodeName}"/>';
		var deleteCodeName = '<c:out value="${deleteCodeName}"/>';
		console.log("AddCodeName: " , AddCodeName);
		console.log("ModifyCodeName: " , ModifyCodeName);
		
		var parent_code;
		console.log("상단parent_code:",parent_code);
		
		// 알림창 설정
		var v = "";
		if(AddCodeName){
			v = "등록";
		} else if(ModifyCodeName){
			v = "수정";
		}  else if(deleteCodeName){
			v = "삭제";
		} 
		
		if(AddCodeName || ModifyCodeName || deleteCodeName) {
			$("#alertModal").find(".modal-body")
										.text(" 코드가 "+ v +" 되었습니다.");
			$("#alertModal").find(".modal-title")
										.text("코드 "+ v);
			$("#alertModal").modal("show");
		}
		
		
		
		// 선택한 상위코드의 하위코드 목록 조회 이벤트 처리
		$(".parent_code").click(function() {
			parent_code = $(this).text();
		    console.log("선택후parent_code:",parent_code);
		    $("#sub_title").text("");
		    $("#sub_title").text("선택된 상위코드: " + parent_code);

		    // 함수 호출
		    $.ajax({
		        url: "/admin/commonCode/subcodes/" + parent_code,
		        success: function(data) {
		            console.log("data: ", data);
		            
		            var tbody = $("#subTable tbody");
		            tbody.empty();

		            $.each(data, function(index, subCode) {
		            	var row = "<tr>" +
		                "<th class='align-middle'>" + subCode.code_id + "</th>" +
		                "<td class='align-middle'>" + subCode.code_name + "</td>" +
		                "<td class='align-middle'>" + subCode.use_yn + "</td>" +
		                "<td class='align-middle'>" + subCode.orderby + "</td>" +
		                "<td class='align-middle'>" +
		                "<button type='button' class='btn btn-success btn-subModal btnSubModify' " +
		                "data-code_id='" + subCode.code_id + "' " +
		                "data-code_name='" + subCode.code_name + "' " +
		                "data-orderby='" + subCode.orderby + "' " +
		                "data-ref_1='" + subCode.ref_1 + "' " +
		                "data-ref_2='" + subCode.ref_2 + "' " +
		                "data-use_yn='" + subCode.use_yn + "'>수정</button>" +
		                "</td>" +
		                "<td class='align-middle'>" +
		                "<button type='button' class='btn btn-danger btnSubdelete' data-code_id='" + subCode.code_id + "'>삭제</button>" +
		                "</td>" +
		                "</tr>";
		            	tbody.append(row);
		            });
		        }
		    });
		});
		
		//하위코드 등록/수정
		$(document).on('click', '.btn-subModal', function() { //동적으로 생성된 요소 이벤트 추가
			console.log("버튼 클릭됨!");
			
			var sub_parent_code_id = $("#SubCodeModal #sub_parent_code_id").val(parent_code);
			var sub_parent_code_id = sub_parent_code_id.val();
				console.log("하위코드등록parent_code:",parent_code);
				if (!sub_parent_code_id) {
			        alert("상위 코드를 선택하세요.");
			        return;
			    } 
			
	    	//수정 버튼인지 등록버튼인지 확인
	    	var curMode = $(this).hasClass("btnSubModify") ? "Edit" : "Add";
	    	console.log("curMode:",curMode);

	     	// 수정 버튼 클릭 시 모달 열기 및 데이터 설정
	        if(curMode == "Edit"){
		        var code_id = $(this).data("code_id");
		        var code_name = $(this).data("code_name");
		        var orderby = $(this).data("orderby");
		        var ref_1 = $(this).data("ref_1");
		        var ref_2 = $(this).data("ref_2");
		        var use_yn = $(this).data("use_yn");
		        
	        	
		        $("#SubCodeModal form").attr("action", "/admin/commonCode/subCodeModify");
	            $("#SubCodeModal .modal-title").text("하위코드 수정");
		        $("#SubCodeModal #sub_code_id").val(code_id);
		        $("#SubCodeModal #sub_code_name").val(code_name);
		        $("#SubCodeModal #sub_orderby").val(orderby);
		        $("#SubCodeModal #sub_ref_1").val(ref_1);
		        $("#SubCodeModal #sub_ref_2").val(ref_2);
		        
		        if(use_yn == "Y"){
		        	$('#SubCodeModal input[name="use_yn"]').attr('checked', 'checked');
		        }
		        if(use_yn == "N"){
		        	$('#SubCodeModal input[name="use_yn"]').attr('checked', 'checked');
		        }
		        updateModalFooter(curMode);
		        
	        }  else{
	        	console.log("else");
	        	$("#SubCodeModal form").attr("action", "/admin/commonCode/subCodeAdd");
	            $("#SubCodeModal .modal-title").text("하위코드 등록");
	        	$("#SubCodeModal #sub_code_id").val("");
		        $("#SubCodeModal #sub_code_name").val("");
		        $("#SubCodeModal #sub_orderby").val("");
		        $('#SubCodeModal input[name="use_yn"][value="N"]').attr('disabled', 'disabled');
		        $("#SubCodeModal #sub_ref_1").val("");
		        $("#SubCodeModal #sub_ref_2").val("");
		        
		        updateModalFooter(curMode);
	        }
	    	
	        
	    	$("#SubCodeModal").modal("show");
	    	
	    });
		
		

			// 상위코드 등록/수정
		    $(".btn-modal").click(function() {   	
		    	//수정 버튼인지 등록버튼인지 확인
		    	var curMode = $(this).hasClass("btnTopModify") ? "Edit" : "Add";

		     	// 수정 버튼 클릭 시 모달 열기 및 데이터 설정
		        if(curMode == "Edit"){
			        var code_id = $(this).data("code_id");
			        var code_depth = $(this).data("code_depth");
			        var code_name = $(this).data("code_name");
			        var orderby = $(this).data("orderby");
			        var use_yn = $(this).data("use_yn");
			        var ref_1 = $(this).data("ref_1");
			        var ref_2 = $(this).data("ref_2");
			        
		        	
			        $("#TopCodeModal form").attr("action", "/admin/commonCode/topCodeModify");
		            $("#TopCodeModal .modal-title").text("상위코드 수정");
			        $("#TopCodeModal #code_id").val(code_id);
			        $("#TopCodeModal #code_name").val(code_name);
			        $("#TopCodeModal #orderby").val(orderby);
			        $("#TopCodeModal #ref_1").val(ref_1);
			        $("#TopCodeModal #ref_2").val(ref_2);

			        if(use_yn == "Y"){
			        	$('#TopCodeModal input[name="use_yn"]').attr('checked', 'checked');
			        }
			        if(use_yn == "N"){
			        	$('#TopCodeModal input[name="use_yn"]').attr('checked', 'checked');
			        }
			        updateModalFooter(curMode);
			        
		        }  else{
		        	console.log("else");
		        	$("#TopCodeModal form").attr("action", "/admin/commonCode/topCodeAdd");
		            $("#TopCodeModal .modal-title").text("상위코드 등록");
		        	$("#TopCodeModal #code_id").val("");
			        $("#TopCodeModal #code_name").val("");
			        $("#TopCodeModal #orderby").val("");
			        $('#TopCodeModal input[name="use_yn"][value="N"]').attr('disabled', 'disabled');
			        
			        updateModalFooter(curMode);
		        }  
		    	
		    	$("#TopCodeModal").modal("show");
		    });
		    
	    function updateModalFooter(curMode) {
	        var footer = $(".modal-footer");
	        
	        // 수정 모드인 경우 "수정" 버튼으로 변경
	        if (curMode=="Edit") {
	        	console.log("curModefooter:",curMode)
	            footer.find(".btnAdd").text("수정");
	        }  else {
	        	console.log("curModefooter:",curMode)
	            footer.find(".btnAdd").text("등록");
	        }  
	    }

		//상위 코드 삭제
		$(".btnTopdelete").click(function() {
		    var code_id = $(this).data("code_id");
		    console.log("code_id:", code_id);
		    var parent_code = code_id;
		    var that = $(this);
		
		    // 하위코드 확인 작업
		    $.ajax({
		        url: "/admin/commonCode/subcodes/" + parent_code,
		        success: function(data) {
		            console.log("parent_code: ", parent_code);
		            console.log("data: ", data);
		
		            if (data.length === 0) {
		                console.log("하위 코드 없음");
		
		             	// 코드 삭제 비동기 요청
		                $.post("/admin/commonCode/delete/" + parent_code, function(deleteResult) {
		                	console.log(deleteResult ? "삭제 성공" : "삭제 실패");
		                	if (deleteResult) {
		                        that.closest("tr").fadeOut();
		                    }
		                });
		            } else {
		                alert("하위 코드가 존재하여 삭제할 수 없습니다.");
		            }
		        }
		    });
		});
		
		//하위 코드 삭제
		$(document).on('click', '.btnSubdelete', function() { //동적으로 생성된 요소 이벤트 추가
			console.log("클릭됨");
		    var code_id = $(this).data("code_id");
		    console.log("code_id:", code_id);
		    var that = $(this);
		
		 	// 코드 삭제 비동기 요청
            $.post("/admin/commonCode/delete/" + code_id, function(deleteResult) {
            	console.log(deleteResult ? "삭제 성공" : "삭제 실패");
            	if (deleteResult) {
                    that.closest("tr").fadeOut();
                }
            });
		});

		

	});
</script>

   <!-- [ content ] Start -->
   <div class="container-fluid flex-grow-1 container-p-y">
       <h4 class="font-weight-bold py-3 mb-0">공통코드관리</h4>
       <div class="text-muted small mt-0 mb-4 d-block breadcrumb">
           <ol class="breadcrumb">
               <li class="breadcrumb-item"><a href="#"><i class="feather icon-home"></i></a></li>
               <li class="breadcrumb-item"><a href="#">관리자</a></li>
               <li class="breadcrumb-item active">공통코드관리</li>
           </ol>
       </div>

	<div class="row">
		<!-- start page title -->
		<div class="col-xl-12">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-md-6">
							<div class="card">
								<div class="card-header font-weight-bold d-flex align-items-center" >
								    <span class="mr-auto">상위코드</span>
								    <button type="button" class="btn btn-success ml-3 btnTopMenuAdd btn-modal">추가</button>
								</div>
								
								<table class="table card-table table-hover ">
									<thead class="thead-light">
										<tr >
											<th>코드 아이디</th>
											<th>코드명</th>
											<th>순서</th>
											<th>수정</th>
											<th>삭제</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="topCode" items="${topCodeList}">
										<tr>
											<th class="align-middle parent_code" style="cursor: pointer;">${topCode.code_id}</th>
											<td class="align-middle">${topCode.code_name}</td>
											<td class="align-middle">${topCode.orderby}</td>
											<td class="align-middle"><button type="button" class="btn btn-success btnTopModify btn-modal"
												 data-code_id="${topCode.code_id}"
												 data-code_name="${topCode.code_name}"
												 data-orderby="${topCode.orderby}"
												 data-use_yn="${topCode.use_yn}"
												 >수정</button></td>
											<td class="align-middle"><button type="button" class="btn btn-danger btnTopdelete" 
											data-code_id="${topCode.code_id}">삭제</button></td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card">
								<div class="card-header font-weight-bold d-flex align-items-center" >
								    <span class="mr-auto" id="sub_title">하위코드 (상위코드 아이디를 선택해 주세요.)</span>
								    <button type="button" class="btn btn-success ml-3 btn-subModal" >추가</button>
								</div>
								<table class="table card-table" id="subTable">
									<thead class="thead-light">
										<tr>
											<th>코드 아이디</th>
											<th>코드명</th>
											<th>사용</th>
											<th>순서</th>
											<th>수정</th>
											<th>삭제</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
				<!-- end card body-->
			</div>
			<!-- end card -->
		</div>
		<!-- end col-->
	</div>
</div>
<!-- [ content ] End -->
<!-- 상위코드등록 모달 -->
<div class="row">
	<div class="col-md-12">
		<div class="modal fade" id="TopCodeModal" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg " role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="messageModalLabel">상위코드 등록</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>

					<div class="modal-body">
						<form action="/admin/commonCode/topCodeAdd" method="post" >
							<input type="hidden" name="parent_code_id" id="parent_code_id" value="@">
							<input type="hidden" name="code_depth" value="1">
							<!-- <input type="hidden" name="use_yn" id="use_yn" value="Y"> -->
							
							<div class="form-row">
								<div class="form-group col-md-6">
									<label class="form-label">code_id</label> 
									<input type="text" class="form-control" placeholder="ex)Car" id="code_id" name="code_id">
									<div class="clearfix"></div>
								</div>
								<div class="form-group col-md-6">
									<label class="form-label">코드 이름</label>
									<input type="text" class="form-control" placeholder="코드 이름" name="code_name" id="code_name">
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<label class="form-label">코드 순서</label>
									<input type="text" class="form-control" placeholder="코드 순서" name="orderby" id="orderby">
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label class="form-label">참조코드1</label> 
									<input type="text" class="form-control" id="ref_1" name="ref_1">
									<div class="clearfix"></div>
								</div>
								<div class="form-group col-md-6">
									<label class="form-label">참조코드2</label>
									<input type="text" class="form-control" name="ref_2" id="ref_2">
									<div class="clearfix"></div>
								</div>
							</div>
							<fieldset class="form-group only-edit">
			                <div class="row">
		                    <label class="col-form-label col-sm-2 text-sm-right pt-sm-0">사용유무</label>
			                    <div class="col-sm-10">
			                        <div class="custom-controls-stacked">
			                            <label class="custom-control custom-radio">
			                                <input name="use_yn" value="Y" type="radio" class="custom-control-input" checked="">
			                                <span class="custom-control-label">사용</span>
			                            </label>
			                            <label class="custom-control custom-radio">
			                                <input name="use_yn" value="N" type="radio" class="custom-control-input" >
			                                <span class="custom-control-label">미사용</span>
			                            </label>
			                        </div>
			                    </div>
		                	</div>
			            </fieldset>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary btnAdd" id="btnTopAdd">등록</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">닫기</button>
							</div>
						</form>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 모달끝 -->

<!-- 서브코드등록 모달 -->
<div class="row">
	<div class="col-md-12">
		<div class="modal fade" id="SubCodeModal" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg " role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="messageModalLabel">하위코드 등록</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>

					<div class="modal-body">
						<form action="/admin/commonCode/subCodeAdd" method="post" >
							<input type="hidden" id="sub_parent_code_id" name="parent_code_id" value="">
							<input type="hidden" name="code_depth" value="2" id="sub_code_depth">
							<input type="hidden" name="use_yn" value="Y" id="sub_use_yn">
							
							<div class="form-row">
								<div class="form-group col-md-6">
									<label class="form-label">code_id</label> 
									<input type="text" class="form-control" placeholder="ex)Car_01" name="code_id" id="sub_code_id">
									<div class="clearfix"></div>
								</div>
								<div class="form-group col-md-6">
									<label class="form-label">코드 이름</label>
									<input type="text" class="form-control" placeholder="코드 이름" name="code_name" id="sub_code_name">
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<label class="form-label">코드 순서</label>
									<input type="text" class="form-control" placeholder="코드 순서" name="orderby" id="sub_orderby">
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label class="form-label">참조코드1</label> 
									<input type="text" class="form-control" name="ref_1" id="sub_ref_1">
									<div class="clearfix"></div>
								</div>
								<div class="form-group col-md-6">
									<label class="form-label">참조코드2</label>
									<input type="text" class="form-control" name="ref_2" id="sub_ref_2">
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary btnAdd">등록</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">닫기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 모달끝 -->
<!-- 알림 모달 -->
<div class="row">
	<div class="col-md-12">
		<div class="modal fade" id="alertModal" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-sm " role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="alertModalLable">알림</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 모달끝 -->

<%@ include file="/WEB-INF/views/admin/include/bottom.jsp" %>                  