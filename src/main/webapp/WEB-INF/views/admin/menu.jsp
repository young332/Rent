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
					<c:set var="menuType" value="1" scope="application" />
					<link rel="stylesheet"
						href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css">
					<script
						src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
					<div class="row">
						<div class="col-lg-4">
							<div class="user-menu-title">
								<ul>
									<li><i class="fal fa-folders"></i>사용자메뉴</li>
								</ul>
							</div>


							<div id="jstree"></div>
						</div>
						<div id="menuWrite" class="col-lg-8 needs-validation" novalidate></div>

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