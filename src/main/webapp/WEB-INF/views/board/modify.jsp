<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>   
 
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/resources/carbook-master/images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="/">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>공지사항 <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-3 bread">공지사항</h1>
          </div>
        </div>
      </div>
    </section>
   <section class="ftco-section contact-section">
      <div class="container-fluid">
      <div class="row justify-content-center">
          <div class="col-md-12 heading-section text-center ftco-animate mb-5">
            <h2 class="mb-2">HAKA렌트카 공지사항</h2>
          </div>
        </div>
<div class="row">
		<div class="col-md-2">
			</div>
			<div class="col-md-8">
				<form id="frmModify" role="form" action="/board/modify" method="post">
				<div class="form-group">
					<label for="board_title">
						제목
					</label>
					<input type="text" class="form-control" id="board_title" name="board_title" value="${boardVO.board_title}" required/>
				</div>
				<div class="form-group">
					<label for="board_content">
						내용
					</label>
					<textarea class="form-control" id="board_content" name="board_content" required>${boardVO.board_content}</textarea>
				</div>
				<button type="submit" class="btn btn-primary">
					완료
				</button>
			</form>
		</div>
		<div class="col-md-2">
		</div>
	</div>	
</div>
</section>
	

 <%@ include file="/WEB-INF/views/include/bottom.jsp" %> 