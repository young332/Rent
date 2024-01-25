<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/top.jsp" %>

<style>
       #details-box { 
         width:25%; 
         height: 1000px; 
         margin-right: 5px;
        
/*         border: 1px solid #003458;  */
       } 
      div.left-box {
/*         width: 80%; */
        float: left;
         box-sizing: border-box; 
         
       
      }

   
	  #cars-box { 
         width:70%; 
         height: 1000px; 

       } 
       
</style>




    
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/resources/carbook-master/images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="/">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>예약하기 <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-3 bread">예약하기</h1>
          </div>
        </div>
      </div>
    </section>
	 <section class="ftco-section ftco-cart">
			<div class="container">
				<div class="row">
		   			<div id="details-box" class="jumbotron card card-block" style="background-color:white;">
		   			<section>
						<div class="left-box">
							<h6>상세검색&nbsp;&nbsp;&nbsp;<button type="button" class="reset_btn btn-secondary" id="btnreset">검색초기화</button></h6>
							
							<hr>
							<div class="form-group">
								<label for="" class="label-cartype" >차종<br>
									<input type="checkbox" id="cartypeAll" name="cartypeAll" value="전체" >전체
									<input type="checkbox" id="cartype" name="cartype" value="소형">소형
									<input type="checkbox" id="cartype" name="cartype" value="중형">중형<br>
									<input type="checkbox" id="cartype" name="cartype" value="대형">대형 
									<input type="checkbox" id="cartype" name="cartype" value="전기차">전기차
								</label>
							</div>
							<hr>
							<div class="form-group">
								<label for="" class="label-fuel" >연료<br> 
									<input type="checkbox" name="fuelAll" value="전체">전체
									<input type="checkbox"  name="fuel" value="가솔린">가솔린
									<input type="checkbox"  name="fuel" value="디젤">디젤<br>
									<input type="checkbox"  name="fuel" value="하이브리드">하이브리드
									</label>
							</div>
							<hr>
							<div class="form-group">
								<label for="" class="label-carcompany">제조사<br>
									<input type="checkbox" name="carcompanyAll" value="전체">전체
									<input type="checkbox"  name="carcompany" value="현대">현대
									<input type="checkbox"  name="carcompany" value="기아">기아
								</label>  
								
							</div>
							<hr>
							<div class="form-group">
								<label for="" class="label-otheroptions">기타옵션<br> 
									<input type="checkbox" name="otheroptionsAll" value="전체">전체
									<input type="checkbox"  name="otheroptions" value="후방카메라">후방카메라<br>
									<input type="checkbox"  name="otheroptions" value="블루투스">블루투스
									<input type="checkbox"  name="otheroptions" value="내비게이션">내비게이션
									<input type="checkbox"  name="otheroptions" value="유아카시트">유아카시트
								</label> 
								
							</div>
							<hr>
							
						</div>
						</section>
					
		   			</div>
		   			
		   			<div id="cars-box" class="jumbotron card card-block" style="background-color:white;">
	    				<div class="right-box">
								<div class="row">
				    			<div class="col-md-12">
				    					<div class="item">
				    						<div class="car-wrap rounded ftco-animate">
						    					<div class="img rounded d-flex align-items-end" style="background-image: url(/resources/carbook-master/images/hyun1.jpg);">
						    					</div>
						    					<div class="text">
						    						<h2 class="mb-0"><a href="#">엑스터</a></h2>
						    						<div class="d-flex mb-3">
							    						<span class="cat">현대자동차</span>
							    						<p class="price ml-auto">500000 <span>/day</span></p>
						    						</div>
						    						<p class="d-flex mb-0 d-block"><a href="/reserve/licenseinfo" class="btn btn-primary py-2 mr-1">예약하기</a></p>
						    					</div>
						    				</div>
				    					</div>
				    					<hr>
				    					<div class="item"> 
				    						<div class="car-wrap rounded ftco-animate">
						    					<div class="img rounded d-flex align-items-end" style="background-image: url(/resources/carbook-master/images/hyun2.jpg);">
						    					</div>
						    					<div class="text">
						    						<h2 class="mb-0"><a href="#">그랜져</a></h2>
						    						<div class="d-flex mb-3">
							    						<span class="cat">현대자동차</span>
							    						<p class="price ml-auto">500 <span>/day</span></p>
						    						</div>
						    						<p class="d-flex mb-0 d-block"><a href="/reserve/licenseinfo" class="btn btn-primary py-2 mr-1">예약하기</a></p>
						    					</div>
						    				</div>
				    					</div>
				    				
				    				</div>
				    			</div>
				    		</div>
						</div>
					</div>
    		</div>
			
		</section>
     

<%@ include file="/WEB-INF/views/include/bottom.jsp" %>

<script>
$(function() {
	 $("#btnreset").click(function(){
		 $(":checkbox").prop("checked",false);
	        var v = $("#btnreset").val();
	        console.log("v");
	    });
	 $("input[name=cartypeAll]").click(function(){
		 cartypeChked();
	    });
	 $("input[name=fuelAll]").click(function(){
		 fuelChked();
	    });
	 $("input[name=carcompanyAll]").click(function(){
		 carcompanyChked();
	    });
	 $("input[name=otheroptionsAll]").click(function(){
		 otheroptionsChked();
	    });
    
	 $("input[name=otheroptions]").click(function () {
		    var otheroptions = $(this).val();
		    console.log("otheroptions:", otheroptions);
		   
		});
	 $("input[name=fuel]").click(function () {
		    var fuel = $(this).val();
		    console.log("fuel:", fuel);
		   
		});
	 $("input[name=carcompany]").click(function () {
		    var carcompany = $(this).val();
		    console.log("carcompany:", carcompany);
		   
		});
	 $("input[name=cartype]").click(function () {
		    var cartype = $(this).val();
		    console.log("cartype:", cartype);
		   
		});
	 //체크 하나씩만 되게
// 	 $(document).on('click', "input[type='checkbox']", function(){
// 		    if(this.checked) {
// 		        const checkboxes = $("input[type='checkbox']");
// 		        for(let ind = 0; ind < checkboxes.length; ind++){
// 		            checkboxes[ind].checked = false;
// 		        }
// 		        this.checked = true;
// 		    } else {
// 		        this.checked = false;
// 		    }
// 		});
	
});
function cartypeChked(){
    var cartypeAll = $("input[name=cartypeAll]");
    var cartype = $("input[name=cartype]");
    if(cartypeAll.is(":checked")){
        $(cartype).prop("checked",true);
    } else {
        $(cartype).prop("checked",false);
    }

}
function fuelChked(){
    var fuelAll = $("input[name=fuelAll]");
    var fuel = $("input[name=fuel]");
    if(fuelAll.is(":checked")){
        $(fuel).prop("checked",true);
    } else {
        $(fuel).prop("checked",false);
    }

}
function carcompanyChked(){
    var carcompanyAll = $("input[name=carcompanyAll]");
    var carcompany = $("input[name=carcompany]");
    if(carcompanyAll.is(":checked")){
        $(carcompany).prop("checked",true);
    } else {
        $(carcompany).prop("checked",false);
    }

}
function otheroptionsChked(){
    var otheroptionsAll = $("input[name=otheroptionsAll]");
    var otheroptions = $("input[name=otheroptions]");
    if(otheroptionsAll.is(":checked")){
        $(otheroptions).prop("checked",true);
    } else {
        $(otheroptions).prop("checked",false);
    }

}



</script>



