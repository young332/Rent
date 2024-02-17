<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<form id="frmCriteria" action="/board/list" method="get">
			<input type="hidden" name="pageNum" value="${pageDTO.criteria.pageNum}">
			<input type="hidden" name="amount" value="${pageDTO.criteria.amount}">
			<input type="hidden" name="board_no" value="${param.board_no}">
			<input type="hidden" name="keyword" value="${pageDTO.criteria.keyword}">
			<input type="hidden" name="type" value="${pageDTO.criteria.type}">
		</form>