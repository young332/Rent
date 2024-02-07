<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/include/top.jsp"%>

<script>
    function updateCarInfo() {
        var selectedOption = $("#car_name option:selected");
        var company = selectedOption.data("company");
        var size = selectedOption.data("size");

        $("#car_company").val(company);
        $("#car_size").val(size);
    }
</script>


<!-- [ content ] Start -->
<div class="container-fluid flex-grow-1 container-p-y">
	<h4 class="font-weight-bold py-3 mb-0">차량등록</h4>
	<div class="text-muted small mt-0 mb-4 d-block breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#"><i
					class="feather icon-home"></i></a></li>
			<li class="breadcrumb-item"><a href="#">차량관리</a></li>
			<li class="breadcrumb-item active">차량등록</li>
		</ol>
	</div>

	<div class="row card mb-4">
		<div class="card-body">

			<form action="/admin/car/CarInfoAdd" method="post"
				enctype="multipart/form-data">

				<!-- 기본 정보 -->
				<div class="form-row">

					<div class="form-group col-md-6 mb-3">
						<label for="car_name" class="form-label">차량 이름</label> 
						<select name="car_name" class="custom-select" id="car_name" onchange="updateCarInfo()">
							<c:forEach var="car" items="${carNamelist}">
								<option value="${car.code_name}" data-company="${car.ref_1}" data-size="${car.ref_2}">${car.code_name}</option>
							</c:forEach>
						</select>
					</div>


					<div class="form-group col-md-6 mb-3">
						<label for="car_number" class="form-label">차량 번호</label> <input
							type="text" class="form-control" id="car_number"
							name="car_number" required>
					</div>
				</div>

				<!-- 기타 정보 -->
				<div class="form-row">
					<div class="form-group col-md-6 mb-3">
						<label for="car_company" class="form-label">제조사</label> <input
							type="text" class="form-control" id="car_company"
							name="car_company">
					</div>

					<div class="form-group col-md-6 mb-3">
						<label for="car_size" class="form-label">크기</label> <input
							type="text" class="form-control" id="car_size" name="car_size">
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6 mb-5">
						<label for="car_fuel" class="form-label">연료 종류</label> <input
							type="text" class="form-control" id="car_fuel" name="car_fuel">
					</div>
					<div class="form-group col-md-6 mb-5">
						<label for="car_cost" class="form-label">시간당 차량 가격</label> <input
							type="number" class="form-control" id="car_cost" name="car_cost"
							required>
					</div>
				</div>

				<!-- 옵션 정보 -->

				<p class="font-weight-bold mb-5">추가 옵션</p>
				<div class="form-row">
					<div class="form-group col-md-3 mb-5">
						<label>카시트</label> <label class="custom-control custom-radio">
							<input name="op_carseat" value="Y" type="radio"
							class="custom-control-input rdoY" checked> <span
							class="custom-control-label">사용</span>
						</label> <label class="custom-control custom-radio"> <input
							name="op_carseat" value="N" type="radio"
							class="custom-control-input rdoN"> <span
							class="custom-control-label">미사용</span>
						</label>
					</div>

					<div class="form-group col-md-3 mb-5">
						<label>내비게이션</label> <label class="custom-control custom-radio">
							<input name="op_navi" value="Y" type="radio"
							class="custom-control-input rdoY" checked> <span
							class="custom-control-label">사용</span>
						</label> <label class="custom-control custom-radio"> <input
							name="op_navi" value="N" type="radio"
							class="custom-control-input rdoN"> <span
							class="custom-control-label">미사용</span>
						</label>
					</div>

					<div class="form-group col-md-3 mb-5">
						<label>블루투스</label> <label class="custom-control custom-radio">
							<input name="op_bt" value="Y" type="radio"
							class="custom-control-input rdoY" checked> <span
							class="custom-control-label">사용</span>
						</label> <label class="custom-control custom-radio"> <input
							name="op_bt" value="N" type="radio"
							class="custom-control-input rdoN"> <span
							class="custom-control-label">미사용</span>
						</label>
					</div>

					<div class="form-group col-md-3 mb-5">
						<label>후방 카메라</label> <label class="custom-control custom-radio">
							<input name="op_cam" value="Y" type="radio"
							class="custom-control-input rdoY" checked> <span
							class="custom-control-label">사용</span>
						</label> <label class="custom-control custom-radio"> <input
							name="op_cam" value="N" type="radio"
							class="custom-control-input rdoN"> <span
							class="custom-control-label">미사용</span>
						</label>
					</div>
				</div>
				<!-- 기타 정보 -->
				<div class="form-group mb-3">
					<label for="create_user" class="form-label">등록자</label><input
						type="text" class="form-control" id="create_user"
						name="create_user" value="${loginInfo.mem_name}" required>
				</div>
				<div class="form-group">
					<label class="form-label w-100">차량사진</label> <input type="file"
						name="image_path"> <small class="form-text text-muted">차량이미지를
						첨부하세요.</small>
				</div>

				<!-- 등록 버튼 -->
				<button type="submit" class="btn btn-primary">차량 등록</button>
			</form>
		</div>
		<div class="col-md-1"></div>
	</div>















</div>
<!-- [ content ] End -->

<%@ include file="/WEB-INF/views/admin/include/bottom.jsp"%>
