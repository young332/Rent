<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	$(function(){
		//등록 모달창
		$("#btnTopMenuAdd").click(function(e){
			e.preventDefault();
			$("#TopMenuModal").modal("show");
			/* var receiver = $(this).attr("data-receiver");
			$("#receiver").val(receiver); */
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
								<div class="card-header">상위메뉴 <button type="button" class="btn btn-success ml-3" id="btnTopMenuAdd">추가</button></div>
								<table class="table card-table ">
									<thead class="thead-light">
										<tr >
											<th>메뉴 아이디</th>
											<th>메뉴명</th>
											<th>순서</th>
											<th>편집</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="topMenu" items="${topMenuList}">
										<tr>
											<th class="align-middle">${topMenu.menu_id}</th>
											<td class="align-middle">${topMenu.menu_name}</td>
											<td class="align-middle">${topMenu.orderby}</td>
											<td class="align-middle"><button type="button" class="btn btn-success" data-menuId="${topMenu.menu_id}">수정</button></td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card">
								<div class="card-header">하위메뉴 <button type="button" class="btn btn-success ml-3">추가</button></div>
								<table class="table card-table">
									<thead class="thead-light">
										<tr>
											<th>메뉴 아이디</th>
											<th>메뉴명</th>
											<th>순서</th>
											<th>편집</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="subMenu" items="${subMenuList}">
										<tr>
											<th class="align-middle">${subMenu.menu_id}</th>
											<td class="align-middle">${subMenu.menu_name}</td>
											<td class="align-middle">${subMenu.orderby}</td>
											<td class="align-middle"><button type="button" class="btn btn-success" data-menuId="${subMenu.menu_id}">수정</button></td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>



					<!-- <div class="btn-group bottom-btn float-right">
						<a class="btn btn-success" id="btnMenuWrite" >추가</a>
						<button type="button" class="btn btn-warning" onclick="">수정</button>
						<button type="button" class="btn btn-danger" onclick="">삭제</button>
						<button type="button" class="btn btn-primary" onclick="">정렬</button>
					</div> -->
				</div>
				<!-- end card body-->
			</div>
			<!-- end card -->
		</div>
		<!-- end col-->
	</div>

</div>
<!-- [ content ] End -->
<!-- 등록 모달 -->
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
							<input type="hidden" name="parent_menu_id" value="@">
							<input type="hidden" name="menu_depth" value="1">
							<input type="hidden" name="useyn" value="Y">
							
							<div class="form-row">
								<div class="form-group col-md-6">
									<label class="form-label">Menu_id</label> 
									<input type="text" class="form-control" placeholder="ex)Menu001" name="menu_id">
									<div class="clearfix"></div>
								</div>
								<div class="form-group col-md-6">
									<label class="form-label">Menu-type</label>
									<select name="menu_type" class="custom-select">
										<option value="1" selected>관리자</option>
										<option value="2">메인페이지</option>
									</select>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label class="form-label">메뉴 이름</label>
									<input type="text" class="form-control" placeholder="메뉴 이름" name="menu_name">
									<div class="clearfix"></div>
								</div>
								<div class="form-group col-md-6">
									<label class="form-label">메뉴 순서</label>
									<input type="text" class="form-control" placeholder="메뉴 순서" name="orderby">
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="form-group">
								<label class="form-label">메뉴 URL</label>
								<input type="text" class="form-control" placeholder="메뉴 URL" name="menu_url">
								<div class="clearfix"></div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary" id="btnTopAdd">등록</button>
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

<%@ include file="/WEB-INF/views/admin/include/bottom.jsp" %>                  