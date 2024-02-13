<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/include/top.jsp" %>
<script>
    function fn_deleteFile(file_id) {
        if(confirm('삭제하시겠습니까?')) {
            $.ajax({
                type: 'GET',
                url: '/admin/car/deleteCarFile',  
                data: {file_id : file_id },
                success: function (data) {
                    console.log('deleteFileComplete:', data);
                }
            });
        }
    }

    // 알림창 설정
    $(function(){
        var AddCar = '<c:out value="${AddCar}"/>';
        var ModifyCar = '<c:out value="${ModifyCar}"/>';
        var errorMessage = '<c:out value="${errorMessage}"/>';
        console.log("AddCar: " , AddCar);
        console.log("ModifyCar: " , ModifyCar);
        console.log("errorMessage: " , errorMessage);

        var v = "";
        if(AddCar == "success"){
            v = "등록";
        } else if(ModifyCar == "success"){
            v = "수정";
        }

        if(AddCar == "success" || ModifyCar == "success") {
            $("#alertModal").find(".modal-body").text(" 차량이 "+ v +" 되었습니다.");
            $("#alertModal").find(".modal-title").text("차량 "+ v);
            $("#alertModal").modal("show");
        } else if(errorMessage){
            $("#alertModal").find(".modal-body").text("해당요청을 수행하지 못했습니다.");
        }
    });

    // 차량정보수정
    function fn_carInfoModify(car_index) {    
        $.ajax({
            type: 'GET',
            url: '/admin/car/getCarInfo',  
            data: {car_index : car_index },
            success: function (data) {
                console.log('Success:', data);

                $("#car_index").val(data['car_index']);
                $("#file_id").val(data['file_id']);
                $("#car_name").val(data['car_name']);
                $("#car_number").val(data['car_number']);
                $("#car_company").val(data['car_company']);
                $("#car_size").val(data['car_size']);
                $("#car_fuel").val(data['car_fuel']);
                $("#car_cost").val(data['car_cost']);
                $("#file_name").text(data['orignl_file_nm']);
                $("#delete_btn").attr("onclick", "fn_deleteFile('" + data['file_id'] + "')");

                // file이 있을경우 추가파일 등록못하게 설정
                /* console.log("test",data['file_id']);
                if(data['file_id'] != 0){
                    $(".file_add").hide();    
                    $(".file_show").show();    
                } else{
                    $(".file_add").show();
                    $(".file_show").hide();    
                } */

                var op_carseat = data['op_carseat'];
                var op_navi = data['op_navi'];
                var op_bt = data['op_bt'];
                var op_cam = data['op_cam'];
                var use_yn = data['use_yn'];

                // op_carseat, op_navi, op_bt, op_cam, use_yn에 대한 처리
                var options = ["op_carseat", "op_navi", "op_bt", "op_cam", "use_yn"];
                $.each(options, function(index, option) {
                    if (data[option] == "Y") {
                        $('input[name="' + option + '"][value="Y"]').prop("checked", true);
                    } else {
                        $('input[name="' + option + '"][value="N"]').prop("checked", true);
                    }
                });

                $("#update_user").val("${loginInfo.mem_name}");
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
        <form method="get" id="frmSearch" name="frm">
            <div class="alert alert-light bg-light text-dark sch_wrap">
                <div class="input-group col-sm-12">
                    <div class="input-group col-sm">
                        <select class="custom-select" name="type">
                            <option value="all">전체</option>
                            <option value="C" ${param.type=='C' ? 'selected' : ''}>제조사</option>
                            <option value="T" ${param.type=='T' ? 'selected' : ''}>차종</option>
                            <option value="N" ${param.type=='N' ? 'selected' : ''}>번호</option>
                        </select>
                    </div>
                    <div class="input-group col-sm app-search">
                        <input type="text" class="form-control" placeholder="검색어 입력" name="keyword" value="${param.keyword}">
                        <span class="search-icon"></span>
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="submit">검색</button>
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

        <div data-simplebar="init" class="table-responsive">
            <div class="simplebar-wrapper" style="margin: 0px;">
                <div class="simplebar-height-auto-observer-wrapper">
                    <div class="simplebar-height-auto-observer"></div>
                </div>
                <div class="simplebar-mask">
                    <div class="simplebar-offset" style="right: 0px; bottom: 0px;">
                        <div class="simplebar-content-wrapper" style="height: auto; overflow: hidden;">
                            <div class="simplebar-content" style="padding: 0px;">
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
                                                        <input type="checkbox" class="custom-control-input chk" id="chk0" emplyrid="jml8758" membertype="general">
                                                        <label class="custom-control-label" for="chk0"></label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <img src="${pageContext.request.contextPath}/resources/upload/${carInfo.unique_file_nm}" style="width: 50px; height: 50px" alt="Image">
                                                </td>
                                                <td>
                                                    <a href="javascript:void(0);" onclick="javascript:fn_carInfoModify('${carInfo.car_index}');">${carInfo.car_name}</a>
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- [ content ] End -->

<!-- 차량정보 수정 -->
<div class="row">
    <div class="col-md-12">
        <div class="modal fade" id="CarmodifyModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg " role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="messageModalLabel">차량정보 수정</h5>
                        <button type="button" class="close" data-dismiss="modal">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <form id="formModify" action="/admin/car/CarInfoModify" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="car_index" id="car_index">
                            <input type="hidden" name="update_user" id="update_user" value="${loginInfo.mem_name}">
                            <input type="hidden" name="file_id" id="file_id">
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
                                    <label for="car_number" class="form-label">차량 번호</label>
                                    <input type="text" class="form-control" id="car_number" name="car_number" required>
                                </div>
                            </div>

                            <!-- 기타 정보 -->
                            <div class="form-row">
                                <div class="form-group col-md-6 mb-3">
                                    <label for="car_company" class="form-label">제조사</label>
                                    <input type="text" class="form-control" id="car_company" name="car_company">
                                </div>

                                <div class="form-group col-md-6 mb-3">
                                    <label for="car_size" class="form-label">크기</label>
                                    <input type="text" class="form-control" id="car_size" name="car_size">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6 mb-5">
                                    <label for="car_fuel" class="form-label">연료 종류</label>
                                    <input type="text" class="form-control" id="car_fuel" name="car_fuel">
                                </div>
                                <div class="form-group col-md-6 mb-5">
                                    <label for="car_cost" class="form-label">시간당 차량 가격</label>
                                    <input type="number" class="form-control" id="car_cost" name="car_cost" required>
                                </div>
                            </div>

                            <!-- 옵션 정보 -->
                            <p class="font-weight-bold mb-5">추가 옵션</p>
                            <div class="form-row">
                                <div class="form-group col-md-3 mb-5">
                                    <label>카시트</label>
                                    <label class="custom-control custom-radio">
                                        <input name="op_carseat" value="Y" type="radio" class="custom-control-input rdoY" checked>
                                        <span class="custom-control-label">사용</span>
                                    </label>
                                    <label class="custom-control custom-radio">
                                        <input name="op_carseat" value="N" type="radio" class="custom-control-input rdoN">
                                        <span class="custom-control-label">미사용</span>
                                    </label>
                                </div>

                                <div class="form-group col-md-3 mb-5">
                                    <label>내비게이션</label>
                                    <label class="custom-control custom-radio">
                                        <input name="op_navi" value="Y" type="radio" class="custom-control-input rdoY" checked>
                                        <span class="custom-control-label">사용</span>
                                    </label>
                                    <label class="custom-control custom-radio">
                                        <input name="op_navi" value="N" type="radio" class="custom-control-input rdoN">
                                        <span class="custom-control-label">미사용</span>
                                    </label>
                                </div>

                                <div class="form-group col-md-3 mb-5">
                                    <label>블루투스</label>
                                    <label class="custom-control custom-radio">
                                        <input name="op_bt" value="Y" type="radio" class="custom-control-input rdoY" checked>
                                        <span class="custom-control-label">사용</span>
                                    </label>
                                    <label class="custom-control custom-radio">
                                        <input name="op_bt" value="N" type="radio" class="custom-control-input rdoN">
                                        <span class="custom-control-label">미사용</span>
                                    </label>
                                </div>

                                <div class="form-group col-md-3 mb-5">
                                    <label>후방 카메라</label>
                                    <label class="custom-control custom-radio">
                                        <input name="op_cam" value="Y" type="radio" class="custom-control-input rdoY" checked>
                                        <span class="custom-control-label">사용</span>
                                    </label>
                                    <label class="custom-control custom-radio">
                                        <input name="op_cam" value="N" type="radio" class="custom-control-input rdoN">
                                        <span class="custom-control-label">미사용</span>
                                    </label>
                                </div>
                            </div>

                            <!-- 기타 정보 -->
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
                                                <input name="use_yn" value="N" type="radio" class="custom-control-input rdoN">
                                                <span class="custom-control-label">미사용</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>

                            <div class="form-group">
                                <div class="file_show">
                                    <img id="file" name="image_path" style="width: 100px; height: 100px" alt="Image">
                                    <div class="file_group">
                                        <a id="delete_btn"> 
                                            <i class="fa fa-trash" style="margin-left: 10px;">
                                                <style>
                                                    .fa-trash:hover {
                                                        color: red;
                                                    }
                                                </style>
                                            </i>
                                        </a>
                                    </div>
                                </div>

                                <div class="file_add">
                                    <input type="file" id="file_name" name="image_path">
                                    <small class="form-text text-muted">차량이미지를 첨부하세요.</small>
                                </div>
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
<!-- 알림 모달 -->
<div class="row">
    <div class="col-md-12">
        <div class="modal fade" id="alertModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-sm " role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="alertModalLable">알림</h5>
                        <button type="button" class="close" data-dismiss="modal">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body"></div>
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