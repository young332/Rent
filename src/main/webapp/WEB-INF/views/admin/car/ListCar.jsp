<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/include/top.jsp" %>

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
					<c:forEach var="memberVO" items="${MemberList}">
					<tr>
						<td>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input chk"
									id="chk0" emplyrid="jml8758" membertype="general">
								<label class="custom-control-label" for="chk0"></label>
							</div>
						</td>

						<td>${memberVO.mem_id}</td>
						<td><a href="javascript:void(0);"
						onclick="javascript:fn_memberModify('${memberVO.mem_id}');">${memberVO.mem_name}</a>
						</td>
						<td>
						    <div class="badge badge-outline-primary">
						    <c:choose>
	            				<c:when test="${memberVO.mem_adminck == 0}">일반회원</c:when>
	            				<c:when test="${memberVO.mem_adminck == 1}">관리자</c:when>
	            				<c:when test="${memberVO.mem_adminck == 2}">비회원</c:when>
	            				<c:otherwise>알 수 없는 상태</c:otherwise>
	            			</c:choose>
	            			</div>
						</td>
						<td>${memberVO.mem_birth}</td>
						<td>${memberVO.mem_email}</td>
						<td>${memberVO.mem_phone}</td>
						<td>${memberVO.mem_addr}</td>
						<td>${memberVO.mem_point}</td>
						<td>${memberVO.mem_cdate}</td>
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

<%@ include file="/WEB-INF/views/admin/include/bottom.jsp" %> 