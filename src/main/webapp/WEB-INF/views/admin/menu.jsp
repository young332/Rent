<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	$(function(){
		$("#btnMenuWrite").click(function(){
	        $.ajax({
	            url: "/admin/menuWrite",
	            method: "GET",
	            success: function(data) {
	                $("#menuWrite").html(data);
	            },
	            error: function() {
	                alert("파일 로드 중 오류가 발생했습니다.");
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
								<div class="card-header">상위메뉴</div>
								<button type="button" class="btn btn-success">추가</button>
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
									<c:forEach var="menuVO" items="${menu}">
										<tr>
											<th>${menuVO.menu_id}</th>
											<td>${menuVO.menu_name}</td>
											<td>${menuVO.orderby}</td>
											<td><button type="button" class="btn btn-success" data-menuId="${menuVO.menu_id}">수정</button></td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card">
								<div class="card-header">하위메뉴</div>
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
										<tr>
											<th scope="row">1</th>
											<td>Mark</td>
											<td>Otto</td>
											<td>@mdo</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>



					<div class="btn-group bottom-btn float-right">
						<a class="btn btn-success" id="btnMenuWrite" >추가</a>
						<button type="button" class="btn btn-warning" onclick="">수정</button>
						<button type="button" class="btn btn-danger" onclick="">삭제</button>
						<button type="button" class="btn btn-primary" onclick="">정렬</button>
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

<%@ include file="/WEB-INF/views/admin/include/bottom.jsp" %>                  