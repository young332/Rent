<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/include/top.jsp" %>
<script>
	//회원정보수정하기
	function fn_carInfoModify(car_index) {
			
		   //alert("수정")
		    $.ajax({
		    type: 'GET',
		    url: '/admin/car/getCarInfo',  
		    data: {car_index : car_index },
		    success: function (data) {
		      console.log('Success:', data);
	
		      
		        $("#car_name").val(data['car_name']);
			    $("#car_number").val(data['car_number']);
			    $("#car_company").val(data['car_company']);
			    $("#car_size").val(data['car_size']);
			    $("#car_fuel").val(data['car_fuel']);
			    $("#car_cost").val(data['car_cost']);
			    var op_carseat = data['op_carseat'];
			    if (op_carseat == "Y") {
		        	$('input[name="op_carseat"]').prop("selected", true);
		        } 
			    var op_navi = data['op_navi'];
			    if (op_navi == "Y") {
		        	$('input[name="op_navi"]').prop("selected", true);
		        }
			    var op_bt = data['op_bt'];
			    if (op_bt == "Y") {
		        	$('input[name="op_bt"]').prop("selected", true);
		        }
			    var op_cam = data['op_cam'];
			    if (op_cam == "Y") {
		        	$('input[name="op_cam"]').prop("selected", true);
		        }

			    $("#create_user").val(data['create_user']);
			    $("#file").attr('src', '${pageContext.request.contextPath}/resources/upload/' + data['unique_file_nm']);
			    

		      // 모달 창 열기
		      $("#CarmodifyModal").modal("show");
		    
		    } 
		    
		  }); 
		}
	
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
    <h4 class="font-weight-bold py-3 mb-0">차량목록</h4>
    <div class="text-muted small mt-0 mb-4 d-block breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#"><i class="feather icon-home"></i></a></li>
            <li class="breadcrumb-item"><a href="#">차량관리</a></li>
            <li class="breadcrumb-item active">등록차량목록</li>
        </ol>
    </div>
    
    <div class="card-body">

		 <form method="post" id="frm" name="frm">
			<input type="hidden" name="pageIndex" value="1"> <input
				type="hidden" name="recordCountPerPage" value="10"> <input
				type="hidden" name="emplyrId" value=""> <input type="hidden"
				name="searchType" value=""> <input type="hidden" name="type"
				value="">

			<div class="alert alert-light bg-light text-dark sch_wrap">
				<div class="input-group col-sm-12">
					
					<div class="input-group col-sm">
						<select class="custom-select" name="searchCnd">
							<option value="all">전체</option>
							<option value="emplyrId">제조사</option>
							<option value="userNm">차종</option>

						</select>
					</div>
					<div class="input-group col-sm app-search">
						<input type="text" class="form-control" placeholder="검색어 입력"
							name="searchWrd" value=""
							onkeypress="javascript:fn_searchKeyPressed(event);"> <span
							class="search-icon"></span>
						<div class="input-group-append">
							<button class="btn btn-primary" type="button"
								onclick="javascript:fn_memberList('1');">Search</button>
						</div>
					</div>
				</div>
			</div>
		</form> 

		<div class="dt-buttons col-sm-12 mb-3">
                <button class="btn btn-secondary flaot-left" type="button" onclick="javascript:fn_excel('member','');"><span>엑셀 다운로드</span></button>
                <div class="float-right" style="vertical-align: bottom;">
                 <button class="btn btn-danger mr-2" type="button" onclick="javascript:fn_memberChkDel();"><span>선택 삭제</span></button>
                  <a class="btn btn-success" type="button" href="/admin/car/registerCar"><span>차량 등록</span></a>
                </div>
        </div>
              <div data-simplebar="init" class="table-responsive"><div class="simplebar-wrapper" style="margin: 0px;"><div class="simplebar-height-auto-observer-wrapper"><div class="simplebar-height-auto-observer"></div></div><div class="simplebar-mask"><div class="simplebar-offset" style="right: 0px; bottom: 0px;"><div class="simplebar-content-wrapper" style="height: auto; overflow: hidden;"><div class="simplebar-content" style="padding: 0px;">
                <table class="table mb-0 table-hover table-responsive-xl">
                  <thead class="thead-dark">
                    <tr>
                      <th scope="col">
                        <div class="custom-control custom-checkbox">
                          <input type="checkbox" class="custom-control-input checkall" id="checkall">
                          <label class="custom-control-label" for="checkall"></label>
                        </div>
                      </th>
                      <th scope="col">사진</th>
                      <th scope="col">차종</th>
                      <th scope="col">차번호</th>
                      <th scope="col">제조사</th>
                      <th scope="col">크기</th>
                      <th scope="col">가격/h</th>
                      <th scope="col">사용유무</th>
                      <th scope="col">등록자</th>
                      <th scope="col">수정일</th>
                    </tr>
                  </thead>
                  <tbody>
					<c:forEach var="carInfo" items="${carInfoList}">
					<tr>
						<td>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input chk"
									id="chk0" emplyrid="jml8758" membertype="general">
								<label class="custom-control-label" for="chk0"></label>
							</div>
						</td>
						<td>
							<img src="${pageContext.request.contextPath}/resources/upload/${carInfo.unique_file_nm}" style="width: 50px; height: 50px" alt="Image">
						</td>
						<td><a href="javascript:void(0);"
						onclick="javascript:fn_carInfoModify('${carInfo.car_index}');">${carInfo.car_name}</a>
						</td>
						<td>${carInfo.car_number}</td>
						<td>${carInfo.car_company}</td>
						<td>${carInfo.car_size}</td>
						<td>${carInfo.car_cost}</td>
						<td>${carInfo.use_yn}</td>
						<td>${carInfo.create_user}</td>
						<td>${carInfo.create_date}</td>
					</tr>
				</c:forEach>




			     </tbody>
                </table>
              </div></div></div></div>
              <!-- <div class="simplebar-placeholder" style="width: auto; height: 680px;"></div> -->
              </div><div class="simplebar-track simplebar-horizontal" style="visibility: hidden;"><div class="simplebar-scrollbar" style="width: 0px; display: none;"></div></div><div class="simplebar-track simplebar-vertical" style="visibility: hidden;"><div class="simplebar-scrollbar" style="height: 0px; display: none;"></div></div></div> <!-- end table-responsive -->
              <!-- <div class="row mt-4">
                <div class="col-sm-12 col-md-5">
                  <div class="dataTables_length"><label>목록개수
                      <select class="custom-select mb-3" id="recordCountPerPage" onchange="javascript:fn_recordCountPerPage();">
                        <option value="10" selected="">10</option>
                        <option value="15">15</option>
                        <option value="20">20</option>
                        <option value="30">30</option>
                        <option value="40">40</option>
                        <option value="50">50</option>
                        <option value="100">100</option>
                      </select></label></div>
                </div>
                <div class="col-sm-12 col-md-7">
                  <div class="dataTables_paginate paging_simple_numbers">
                    <ul class="pagination pagination-rounded">
                    	<li><a href="?pageIndex=1" class="page-link" onclick="fn_memberList(1);return false; "><i class="fal fa-angle-double-left"></i></a></li><li class="paginate_button page-item previous"><a href="?pageIndex=1" class="page-link" onclick="fn_memberList(1);return false; "><i class="fal fa-angle-left"></i></a></li><li class="paginate_button page-item active"><a href="#" class="page-link">1</a></li><li class="paginate_button page-item"><a href="?pageIndex=2" class="page-link" onclick="fn_memberList(2);return false; ">2</a></li><li class="paginate_button page-item"><a href="?pageIndex=3" class="page-link" onclick="fn_memberList(3);return false; ">3</a></li><li class="paginate_button page-item"><a href="?pageIndex=4" class="page-link" onclick="fn_memberList(4);return false; ">4</a></li><li class="paginate_button page-item"><a href="?pageIndex=5" class="page-link" onclick="fn_memberList(5);return false; ">5</a></li><li class="paginate_button page-item"><a href="?pageIndex=6" class="page-link" onclick="fn_memberList(6);return false; ">6</a></li><li class="paginate_button page-item"><a href="?pageIndex=7" class="page-link" onclick="fn_memberList(7);return false; ">7</a></li><li class="paginate_button page-item"><a href="?pageIndex=8" class="page-link" onclick="fn_memberList(8);return false; ">8</a></li><li class="paginate_button page-item"><a href="?pageIndex=9" class="page-link" onclick="fn_memberList(9);return false; ">9</a></li><li class="paginate_button page-item"><a href="?pageIndex=10" class="page-link" onclick="fn_memberList(10);return false; ">10</a></li><li class="paginate_button page-item next"><a href="?pageIndex=11" class="page-link" onclick="fn_memberList(11);return false; "><i class="fal fa-angle-right"></i></a></li><li><a href="?pageIndex=218" class="page-link" onclick="fn_memberList(218);return false; "><i class="fal fa-angle-double-right"></i></a></li>

                    </ul>
                  </div>
                </div>
              </div> -->
      </div>
            
</div>
<!-- [ content ] End -->
<!-- 회원정보 수정 -->
<div class="row">
	<div class="col-md-12">
		<div class="modal fade" id="CarmodifyModal" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg " role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="messageModalLabel">차량정보 수정</h5>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>

					<div class="modal-body">
						<form id="formModify" action="/admin/car/CarInfoModify" method="post">
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
							name="create_user" required>
					</div>
					<div class="form-group">
						<img id="file" src="" style="width: 100px; height: 100px" alt="Image">
						<label class="form-label w-100">차량사진</label> <input type="file"
							name="image_path"> <small class="form-text text-muted">차량이미지를
							첨부하세요.</small>
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

<%@ include file="/WEB-INF/views/admin/include/bottom.jsp" %> 