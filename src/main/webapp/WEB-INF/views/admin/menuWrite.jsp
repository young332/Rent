<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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
					<div class="col-lg-6">
						<div class="form-group">
							<label><i class="fad fa-check"></i>메뉴명</label> <input type="text"
								name="menuTitle" class="form-control" required>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="form-group">
							<label>&nbsp;</label> <input type="text" class="form-control"
								readonly>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="form-group">
							<label>&nbsp;</label> <input type="text" class="form-control"
								readonly>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="form-group">
							<label><i class="fad fa-check"></i>메뉴설명</label> <input
								type="text" name="menuDesc" class="form-control" required>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6">
						<div class="form-group">
							<label>메뉴 콘텐츠</label> <input type="text" name="menuUrl"
								id="menuUrl" class="form-control" readonly>
						</div>
					</div>
					<div class="col-lg-2">
						<div class="form-group">
							<label>&nbsp;</label>
							<button type="button" class="btn btn-block btn-primary"
								data-toggle="modal" data-target="#modal01"
								onclick="fn_contentModal();">콘텐츠</button>
						</div>
					</div>
					<div class="col-lg-2">
						<div class="form-group">
							<label>&nbsp;</label>
							<button type="button" class="btn btn-block btn-secondary"
								data-toggle="modal" data-target="#modal01"
								onclick="fn_bbsModal();">게시판</button>
						</div>
					</div>
					<div class="col-lg-2">
						<div class="form-group">
							<label>&nbsp;</label>
							<button type="button" class="btn btn-block btn-success"
								onclick="fn_insertUrlSelf();">URL입력</button>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-3">
						<div class="form-group">
							<label>페이지 담당부서</label> <input type="text" class="form-control"
								id="mngDepart" readonly value="">
						</div>
					</div>
					<div class="col-lg-2">
						<div class="form-group">
							<label>담당자</label> <input type="text" class="form-control"
								id="mngName" readonly value="">
						</div>
					</div>
					<div class="col-lg-3">
						<div class="form-group">
							<label>담당자(연락처)</label> <input type="text" class="form-control"
								id="mngPhone" readonly value="">
						</div>
					</div>
					<div class="col-lg-2">
						<div class="form-group">
							<label>&nbsp;</label>
							<button type="button" class="btn btn-block btn-primary"
								data-toggle="modal" data-target="#modal01"
								onclick="fn_pageMngModal();">선택</button>
						</div>
					</div>
					<div class="col-lg-2">
						<div class="form-group">
							<label>&nbsp;</label>
							<button type="button" class="btn btn-block btn-danger"
								onclick="fn_deletePageMng();">삭제</button>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="form-group">
							<div class="label">메뉴 이동방식</div>
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" id="isBlankRadio1" name="isBlank"
									class="custom-control-input" value="N" checked> <label
									class="custom-control-label" for="isBlankRadio1"><span>페이지
										이동</span></label>
							</div>
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" id="isBlankRadio2" name="isBlank"
									class="custom-control-input" value="Y"> <label
									class="custom-control-label" for="isBlankRadio2"><span>새창
										이동</span></label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="form-group">
							<div class="label">마우스 우클릭 차단</div>
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" id="isRmouseRadio1" name="isRmouse"
									class="custom-control-input" value="Y" checked> <label
									class="custom-control-label" for="isRmouseRadio1"><span>허용</span></label>
							</div>
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" id="isRmouseRadio2" name="isRmouse"
									class="custom-control-input" value="N"> <label
									class="custom-control-label" for="isRmouseRadio2"><span>차단</span></label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
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


                