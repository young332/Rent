<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/admin/include/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form method="post" name="frm">
<%-- <input type="hidden" name="menuType" value='<c:out value="${menuType }"/>'> --%>
<input type="hidden" name="menuType" value='1'>
<input type="hidden" name="parentMenuId" value=''>
<input type="hidden" name="emplyrId" id="emplyrId" value=''>

	<div class="col-xl-12">
		<div class="card">
			<div class="card-body">
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
										<form action="/admin/menu/topMenuAdd" method="post">
											<input type="hidden" name="parent_menu_id" value="@">
											<input type="hidden" name="menu_depth" value="1"> <input
												type="hidden" name="use_yn" value="Y">

											<div class="form-row">
												<div class="form-group col-md-6">
													<label class="form-label">Menu_id</label> <input
														type="text" class="form-control" placeholder="ex)Menu001"
														name="menu_id">
													<div class="clearfix"></div>
												</div>
												<div class="form-group col-md-6">
													<label class="form-label">Menu-type</label> <select
														name="menu_type" class="custom-select">
														<option value="1" selected>관리자</option>
														<option value="2">메인페이지</option>
													</select>
												</div>
											</div>
											<div class="form-row">
												<div class="form-group col-md-6">
													<label class="form-label">메뉴 이름</label> <input type="text"
														class="form-control" placeholder="메뉴 이름" name="menu_name">
													<div class="clearfix"></div>
												</div>
												<div class="form-group col-md-6">
													<label class="form-label">메뉴 순서</label> <input type="text"
														class="form-control" placeholder="메뉴 순서" name="orderby">
													<div class="clearfix"></div>
												</div>
											</div>
											<div class="form-group">
												<label class="form-label">메뉴 URL</label> <input type="text"
													class="form-control" placeholder="메뉴 URL" name="menu_url">
												<div class="clearfix"></div>
											</div>
											<div class="form-group">
												<div class="label">사용여부</div>
												<div class="custom-control custom-radio custom-control-inline">
													<input type="radio" id="isUseRadio1" name="menuUse"
														class="custom-control-input" value="Y" checked> <label
														class="custom-control-label" for="isUseRadio1"><span>사용</span></label>
												</div>
												<div class="custom-control custom-radio custom-control-inline">
													<input type="radio" id="isUseRadio2" name="menuUse"
														class="custom-control-input" value="N"> <label
														class="custom-control-label" for="isUseRadio2"><span>미사용</span></label>
												</div>
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
			</div>
		</div>
	</div>

</form>	
<div class="space10"></div>
<div class="board_write_btngroup alignR">
	<button type="button" class="btn btn-primary" onclick="javascript:fn_submit();">저장</button>
</div>


<%@ include file="/WEB-INF/views/admin/include/bottom.jsp" %>                 