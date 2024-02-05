<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/top.jsp" %>

                    <!-- [ content ] Start -->
                    <div class="container-fluid flex-grow-1 container-p-y">
                        <h4 class="font-weight-bold py-3 mb-0">탈퇴회원 목록</h4>
                        <div class="text-muted small mt-0 mb-4 d-block breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#"><i class="feather icon-home"></i></a></li>
                                <li class="breadcrumb-item"><a href="#">탈퇴회원 관리</a></li>
                                <li class="breadcrumb-item active">탈퇴회원 목록</li>
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
					<!-- <div class="input-group col-sm">
						<select class="custom-select" name="searchStatus">
							<option value="" selected="">사용여부 전체</option>
							<option value="Y">사용</option>
							<option value="N">미사용</option>
						</select>
					</div> -->
					<div class="input-group col-sm">
						<select class="custom-select" name="searchCnd">
							<option value="all">전체</option>
							<option value="emplyrId">아이디</option>
							<option value="userNm">이름</option>

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
                      <th scope="col">아이디</th>
                      <th scope="col">이름</th>
                      <th scope="col">회원구분</th>
                      <th scope="col">생년월일</th>
                      <th scope="col">메일</th>
                      <th scope="col">연락처</th>
                      <th scope="col">주소</th>
                      <th scope="col">포인트</th>
                      <th scope="col">가입일</th>

                    </tr>
                  </thead>
                  <tbody>
					<c:forEach var="DelmemberVO" items="${DelMemberList}">
					<tr>
						<td>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input chk"
									id="chk0" emplyrid="jml8758" membertype="general">
								<label class="custom-control-label" for="chk0"></label>
							</div>
						</td>

						<td>${DelmemberVO.del_id}</td>
						<td>${DelmemberVO.del_name}</td>
						<td>
						    <div class="badge badge-outline-primary"><c:choose>
	            				<c:when test="${DelmemberVO.del_adminck == 0}">일반회원</c:when>
	            				<c:when test="${DelmemberVO.del_adminck == 1}">관리자</c:when>
	            				<c:when test="${DelmemberVO.del_adminck == 2}">비회원</c:when>
	            				<c:otherwise>알 수 없는 상태</c:otherwise></c:choose>
	            			</div>
						</td>
						<td>${DelmemberVO.del_birth}</td>
						<td>${DelmemberVO.del_email}</td>
						<td>${DelmemberVO.del_phone}</td>
						<td>${DelmemberVO.del_addr}</td>
						<td>${DelmemberVO.del_point}</td>
						<td>${DelmemberVO.del_ddate}</td>

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

<%@ include file="/WEB-INF/views/admin/include/bottom.jsp" %>                  