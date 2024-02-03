<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	$(function(){
		
		var AddMenuName = '<c:out value="${AddMenuName}"/>';
		var ModifyMenuName = '<c:out value="${ModifyMenuName}"/>';
		var deleteMenuName = '<c:out value="${deleteMenuName}"/>';
		var errorMessage = '<c:out value="${errorMessage}"/>';
		console.log("AddMenuName: " , AddMenuName);
		console.log("ModifyMenuName: " , ModifyMenuName);
		console.log("errorMessage: " , errorMessage);
		
		var parentMenu;
		console.log("상단parentMenu:",parentMenu);
		
		// 알림창 설정
		var v = "";
		if(AddMenuName){
			v = "등록";
		} else if(ModifyMenuName){
			v = "수정";
		}  else if(deleteMenuName){
			v = "삭제";
		} 
		
		if(AddMenuName || ModifyMenuName || deleteMenuName) {
			$("#alertModal").find(".modal-body")
										.text(" 메뉴가 "+ v +" 되었습니다.");
			$("#alertModal").find(".modal-title")
										.text("메뉴 "+ v);
			$("#alertModal").modal("show");
		} else if(errorMessage){
			$("#alertModal").find(".modal-body").text("해당요청을 수행하지 못했습니다.");
		}
		
		// 선택한 상위메뉴의 하위메뉴 목록 조회 이벤트 처리
		$(".parentMenu").click(function() {
		    parentMenu = $(this).text();
		    console.log("선택후parentMenu:",parentMenu);
		    $("#sub_title").text("");
		    $("#sub_title").text("선택된 상위메뉴: " + parentMenu);

		    // 함수 호출
		    $.ajax({
		        url: "/admin/menu/submenus/" + parentMenu,
		        success: function(data) {
		            console.log("data: ", data);
		            
		            var tbody = $("#subTable tbody");
		            tbody.empty();

		            $.each(data, function(index, subMenu) {
		            	var row = "<tr>" +
		                "<th class='align-middle'>" + subMenu.menu_id + "</th>" +
		                "<td class='align-middle'>" + subMenu.menu_name + "</td>" +
		                "<td class='align-middle'>" + subMenu.use_yn + "</td>" +
		                "<td class='align-middle'>" + subMenu.orderby + "</td>" +
		                "<td class='align-middle'>" +
		                "<button type='button' class='btn btn-success btn-subModal btnSubModify' " +
		                "data-menu_id='" + subMenu.menu_id + "' " +
		                "data-menu_type='" + subMenu.menu_type + "' " +
		                "data-menu_name='" + subMenu.menu_name + "' " +
		                "data-orderby='" + subMenu.orderby + "' " +
		                "data-menu_url='" + subMenu.menu_url + "' " +
		                "data-use_yn='" + subMenu.use_yn + "'>수정</button>" +
		                "</td>" +
		                "<td class='align-middle'>" +
		                "<button type='button' class='btn btn-danger btnSubdelete' data-menu_id='" + subMenu.menu_id + "'>삭제</button>" +
		                "</td>" +
		                "</tr>";
		            	tbody.append(row);
		            });
		        }
		    });
		});
		
		//하위메뉴 등록/수정
		$(document).on('click', '.btn-subModal', function() { //동적으로 생성된 요소 이벤트 추가
			console.log("버튼 클릭됨!");
			
			var sub_parent_menu_id = $("#SubMenuModal #sub_parent_menu_id").val(parentMenu);
			var sub_parent_menu_id = sub_parent_menu_id.val();
				console.log("하위메뉴등록parentMenu:",parentMenu);
				if (!sub_parent_menu_id) {
			        alert("상위 메뉴를 선택하세요.");
			        return;
			    } 
			
	    	//수정 버튼인지 등록버튼인지 확인
	    	var curMode = $(this).hasClass("btnSubModify") ? "Edit" : "Add";
	    	console.log("curMode:",curMode);

	     	// 수정 버튼 클릭 시 모달 열기 및 데이터 설정
	        if(curMode == "Edit"){
		        var menu_id = $(this).data("menu_id");
		        var menu_type = $(this).data("menu_type");
		        var menu_name = $(this).data("menu_name");
		        var orderby = $(this).data("orderby");
		        var menu_url = $(this).data("menu_url");
		        var use_yn = $(this).data("use_yn");
		        console.log("수정 yn값:" , use_yn);
		        //console.log(menu_id, menu_type, menu_name, orderby, menu_url ,use_yn)
	        	
		        $("#SubMenuModal form").attr("action", "/admin/menu/subMenuModify");
	            $("#SubMenuModal .modal-title").text("하위메뉴 수정");
		        $("#SubMenuModal #sub_menu_id").val(menu_id).prop('readonly', true);
		        $("#SubMenuModal #sub_menu_type").val(menu_type);
		        
		        console.log("menu_type", menu_type);
		        if (menu_type == 1) {
		        	$("#sub_menu_type").val("1").prop("selected", true);
		        } 
		        if (menu_type == 2) {
		        	$("#sub_menu_type").val("2").prop("selected", true);
		        }
		        
		        $("#SubMenuModal #sub_menu_name").val(menu_name);
		        $("#SubMenuModal #sub_orderby").val(orderby);
		        $("#SubMenuModal #sub_menu_url").val(menu_url);

		        if(use_yn == "Y"){
		        	$('#SubMenuModal input[name="use_yn"]').attr('checked', 'checked');
		        }
		        if(use_yn == "N"){
		        	$('#SubMenuModal input[name="use_yn"]').attr('checked', 'checked');
		        }
		        updateModalFooter(curMode);
		        
	        }  else{
	        	console.log("else");
	        	$("#SubMenuModal form").attr("action", "/admin/menu/subMenuAdd");
	            $("#SubMenuModal .modal-title").text("하위메뉴 등록");
	        	$("#SubMenuModal #sub_menu_id").val("");
		        $("#SubMenuModal #sub_menu_name").val("");
		        $("#SubMenuModal #sub_orderby").val("");
		        $("#SubMenuModal #sub_menu_url").val("");
		        $('#SubMenuModal input[name="use_yn"][value="N"]').attr('disabled', 'disabled');
		        
		        updateModalFooter(curMode);
	        }
	    	
	        
	    	$("#SubMenuModal").modal("show");
	    	
	    });
		
		

			// 상위메뉴 등록/수정
		    $(".btn-modal").click(function() {   	
		    	//수정 버튼인지 등록버튼인지 확인
		    	var curMode = $(this).hasClass("btnTopModify") ? "Edit" : "Add";

		     	// 수정 버튼 클릭 시 모달 열기 및 데이터 설정
		        if(curMode == "Edit"){
			        var menu_id = $(this).data("menu_id");
			        var menu_type = $(this).data("menu_type");
			        var menu_name = $(this).data("menu_name");
			        var orderby = $(this).data("orderby");
			        var menu_url = $(this).data("menu_url");
			        var use_yn = $(this).data("use_yn");
			        
		        	
			        $("#TopMenuModal form").attr("action", "/admin/menu/topMenuModify");
		            $("#TopMenuModal .modal-title").text("상위메뉴 수정");
			        $("#TopMenuModal #menu_id").val(menu_id).prop('readonly', true);
			        $("#TopMenuModal #menu_type").val(menu_type);
			        
			        console.log(menu_id, menu_type ,menu_name, orderby, use_yn, menu_url)
			        console.log("menu_type", menu_type);
			        
			        if (menu_type == 1) {
			        	$("#menu_type").val("1").prop("selected", true);
			        } 
			        if (menu_type == 2) {
			        	$("#menu_type").val("2").prop("selected", true);
			        }
			        
			        $("#TopMenuModal #menu_name").val(menu_name);
			        $("#TopMenuModal #orderby").val(orderby);
			        $("#TopMenuModal #menu_url").val(menu_url);

			        if(use_yn == "Y"){
			        	$('#TopMenuModal .rdoY').prop('checked', true);
			        	$('#TopMenuModal .rdoN').prop('checked', false);
			        }
			        if(use_yn == "N"){
			        	$('#TopMenuModal .rdoY').prop('checked', false);
			        	$('#TopMenuModal .rdoN').prop('checked', true);
			        }
			        updateModalFooter(curMode);
			        
		        }  else{
		        	console.log("else");
		        	$("#TopMenuModal form").attr("action", "/admin/menu/topMenuAdd");
		            $("#TopMenuModal .modal-title").text("상위메뉴 등록");
		        	$("#TopMenuModal #menu_id").val("");
			        $("#TopMenuModal #menu_name").val("");
			        $("#TopMenuModal #orderby").val("");
			        $("#TopMenuModal #menu_url").val("");
			        $('#TopMenuModal input[name="use_yn"][value="N"]').attr('disabled', 'disabled');
			        
			        updateModalFooter(curMode);
		        }  
		    	
		    	$("#TopMenuModal").modal("show");
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

		//상위 메뉴 삭제
		$(".btnTopdelete").click(function() {
		    var menu_id = $(this).data("menu_id");
		    console.log("menu_id:", menu_id);
		    var parentMenu = menu_id;
		    var that = $(this);
		
		    // 하위메뉴 확인 작업
		    $.ajax({
		        url: "/admin/menu/submenus/" + parentMenu,
		        success: function(data) {
		            console.log("parentMenu: ", parentMenu);
		            console.log("data: ", data);
		
		            if (data.length === 0) {
		                console.log("하위 메뉴 없음");
		
		             	// 메뉴 삭제 비동기 요청
		                $.post("/admin/menu/delete/" + parentMenu, function(deleteResult) {
		                	console.log(deleteResult ? "삭제 성공" : "삭제 실패");
		                	if (deleteResult) {
		                        that.closest("tr").fadeOut();
		                    }
		                });
		            } else {
		                alert("하위 메뉴가 존재하여 삭제할 수 없습니다.");
		            }
		        }
		    });
		});
		
		//하위 메뉴 삭제
		$(document).on('click', '.btnSubdelete', function() { //동적으로 생성된 요소 이벤트 추가
			console.log("클릭됨");
		    var menu_id = $(this).data("menu_id");
		    console.log("menu_id:", menu_id);
		    var that = $(this);
		
		 	// 메뉴 삭제 비동기 요청
            $.post("/admin/menu/delete/" + menu_id, function(deleteResult) {
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
       <h4 class="font-weight-bold py-3 mb-0">메뉴관리</h4>
       <div class="text-muted small mt-0 mb-4 d-block breadcrumb">
           <ol class="breadcrumb">
               <li class="breadcrumb-item"><a href="#"><i class="feather icon-home"></i></a></li>
               <li class="breadcrumb-item"><a href="#">메뉴</a></li>
               <li class="breadcrumb-item active">메뉴관리</li>
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
								    <span class="mr-auto">상위메뉴</span>
								    <button type="button" class="btn btn-success ml-3 btnTopMenuAdd btn-modal">추가</button>
								</div>
								
								<table class="table card-table table-hover ">
									<thead class="thead-light">
										<tr >
											<th>메뉴 아이디</th>
											<th>메뉴명</th>
											<th>순서</th>
											<th>수정</th>
											<th>삭제</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="topMenu" items="${topMenuList}">
										<tr>
											<th class="align-middle parentMenu" style="cursor: pointer;">${topMenu.menu_id}</th>
											<td class="align-middle">${topMenu.menu_name}</td>
											<td class="align-middle">${topMenu.orderby}</td>
											<td class="align-middle"><button type="button" class="btn btn-success btnTopModify btn-modal"
												 data-menu_id="${topMenu.menu_id}"
												 data-menu_type="${topMenu.menu_type}"
												 data-menu_name="${topMenu.menu_name}"
												 data-orderby="${topMenu.orderby}" 
												 data-menu_url="${topMenu.menu_url}"
												 data-use_yn="${topMenu.use_yn}"
												 >수정</button></td>
											<td class="align-middle"><button type="button" class="btn btn-danger btnTopdelete" 
											data-menu_id="${topMenu.menu_id}">삭제</button></td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card">
								<div class="card-header font-weight-bold d-flex align-items-center" >
								    <span class="mr-auto" id="sub_title">하위메뉴 (상위메뉴 아이디를 선택해 주세요.)</span>
								    <button type="button" class="btn btn-success ml-3 btn-subModal" >추가</button>
								</div>
								<table class="table card-table" id="subTable">
									<thead class="thead-light">
										<tr>
											<th>메뉴 아이디</th>
											<th>메뉴명</th>
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
<!-- 상위메뉴등록 모달 -->
<div class="row">
	<div class="col-md-12">
		<div class="modal fade" id="TopMenuModal" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg " role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="messageModalLabel">상위메뉴 등록</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>

					<div class="modal-body">
						<form action="/admin/menu/topMenuAdd" method="post" >
							<input type="hidden" name="parent_menu_id" id="parent_menu_id" value="@">
							<input type="hidden" name="menu_depth" id="menu_depth" value="1">
							<!-- <input type="hidden" name="use_yn" id="use_yn" value="Y"> -->
							
							<div class="form-row">
								<div class="form-group col-md-6">
									<label class="form-label">Menu_id</label> 
									<input type="text" class="form-control" placeholder="ex)Menu001" id="menu_id" name="menu_id">
									<div class="clearfix"></div>
								</div>
								<div class="form-group col-md-6">
									<label class="form-label">Menu-type</label>
									<select name="menu_type" id="menu_type" class="custom-select">
										<option value="1" selected>관리자</option>
										<option value="2">메인페이지</option>
									</select>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label class="form-label">메뉴 이름</label>
									<input type="text" class="form-control" placeholder="메뉴 이름" name="menu_name" id="menu_name">
									<div class="clearfix"></div>
								</div>
								<div class="form-group col-md-6">
									<label class="form-label">메뉴 순서</label>
									<input type="text" class="form-control" placeholder="메뉴 순서" name="orderby" id="orderby">
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="form-group">
								<label class="form-label">메뉴 URL</label>
								<input type="text" class="form-control" placeholder="메뉴 URL" name="menu_url" id="menu_url">
								<div class="clearfix"></div>
							</div>
							<fieldset class="form-group only-edit">
			                <div class="row">
		                    <label class="col-form-label col-sm-2 text-sm-right pt-sm-0">사용유무</label>
			                    <div class="col-sm-10">
			                        <div class="custom-controls-stacked">
			                            <label class="custom-control custom-radio">
			                                <input name="use_yn" value="Y" type="radio" class="custom-control-input rdoY" checked>
			                                <span class="custom-control-label">사용</span>
			                            </label>
			                            <label class="custom-control custom-radio">
			                                <input name="use_yn" value="N" type="radio" class="custom-control-input rdoN" >
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

<!-- 서브메뉴등록 모달 -->
<div class="row">
	<div class="col-md-12">
		<div class="modal fade" id="SubMenuModal" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg " role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="messageModalLabel">하위메뉴 등록</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>

					<div class="modal-body">
						<form action="/admin/menu/subMenuAdd" method="post" >
							<input type="hidden" id="sub_parent_menu_id" name="parent_menu_id" value="">
							<input type="hidden" name="menu_depth" value="2" id="sub_menu_depth">
							<input type="hidden" name="use_yn" value="Y" id="sub_use_yn">
							
							<div class="form-row">
								<div class="form-group col-md-6">
									<label class="form-label">Menu_id</label> 
									<input type="text" class="form-control" placeholder="ex)Sub001" name="menu_id" id="sub_menu_id">
									<div class="clearfix"></div>
								</div>
								<div class="form-group col-md-6">
									<label class="form-label">Menu-type</label>
									<select name="menu_type" class="custom-select" id="sub_menu_type">
										<option value="1" selected>관리자</option>
										<option value="2">메인페이지</option>
									</select>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label class="form-label">메뉴 이름</label>
									<input type="text" class="form-control" placeholder="메뉴 이름" name="menu_name" id="sub_menu_name">
									<div class="clearfix"></div>
								</div>
								<div class="form-group col-md-6">
									<label class="form-label">메뉴 순서</label>
									<input type="text" class="form-control" placeholder="메뉴 순서" name="orderby" id="sub_orderby">
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="form-group">
								<label class="form-label">메뉴 URL</label>
								<input type="text" class="form-control" placeholder="메뉴 URL" name="menu_url" id="sub_menu_url">
								<div class="clearfix"></div>
							</div>
						
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary btnAdd" >등록</button>
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