<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
    <title>관리자페이지 로그인</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="Bhumlu Bootstrap admin template made using Bootstrap 4, it has tons of ready made feature, UI components, pages which completely fulfills any dashboard needs." />
    <meta name="keywords" content="Bhumlu, bootstrap admin template, bootstrap admin panel, bootstrap 4 admin template, admin template">
    <meta name="author" content="Srthemesvilla" />
    <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico">

    <!-- Google fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">

    <!-- Icon fonts -->
    <link rel="stylesheet" href="/resources/assets/fonts/fontawesome.css">
    <link rel="stylesheet" href="/resources/assets/fonts/ionicons.css">
    <link rel="stylesheet" href="/resources/assets/fonts/linearicons.css">
    <link rel="stylesheet" href="/resources/assets/fonts/open-iconic.css">
    <link rel="stylesheet" href="/resources/assets/fonts/pe-icon-7-stroke.css">
    <link rel="stylesheet" href="/resources/assets/fonts/feather.css">

    <!-- Core stylesheets -->
    <link rel="stylesheet" href="/resources/assets/css/bootstrap-material.css">
    <link rel="stylesheet" href="/resources/assets/css/shreerang-material.css">
    <link rel="stylesheet" href="/resources/assets/css/uikit.css">

    <!-- Libs -->
    <link rel="stylesheet" href="/resources/assets/libs/perfect-scrollbar/perfect-scrollbar.css">
    <!-- Page -->
    <link rel="stylesheet" href="/resources/assets/css/pages/authentication.css">
</head>

<body>
    <!-- [ Preloader ] Start -->
    <div class="page-loader">
        <div class="bg-primary"></div>
    </div>
    <!-- [ Preloader ] End -->

    <!-- [ content ] Start -->
    <div class="authentication-wrapper authentication-1 px-4">
        <div class="authentication-inner py-5">

            <!-- [ Logo ] Start -->
            <div class="d-flex justify-content-center align-items-center">
                <div class="ui-w-150">
                    <div class="w-100 position-relative">
                        <img src="/resources/adimg/HAKA-logo-black.png" alt="Brand Logo" class="img-fluid">
                    </div>
                </div>
            </div>
            <!-- [ Logo ] End -->

            <!-- [ Form ] Start -->
            <form class="my-5" action="/admin/loginPost" method="post">
                <div class="form-group">
                    <label class="form-label">아이디</label>
                    <input type="text" class="form-control" name="mem_id" id="mem_id">
                    <div class="clearfix"></div>
                </div>
                <div class="form-group">
                    <label class="form-label d-flex justify-content-between align-items-end">
                        <span>패스워드</span>
                        <a href="pages_authentication_password-reset.html" class="d-block small">비밀번호 찾기</a>
                    </label>
                    <input type="password" class="form-control" name="mem_pw" id="mem_pw">
                    <div class="clearfix"></div>
                </div>
                <div class="d-flex justify-content-between align-items-center m-0">
                    <label class="custom-control custom-checkbox m-0">
                        <input type="checkbox" class="custom-control-input">
                        <span class="custom-control-label">아이디 기억하기</span>
                    </label>
                    <button type="submit" class="btn btn-primary">로그인</button>
                </div>
            </form>
            <!-- [ Form ] End -->
<!-- 
            <div class="text-center text-muted">
                Don't have an account yet?
                <a href="pages_authentication_register-v1.html">회원가입</a>
            </div> -->

        </div>
    </div>
    <!-- [ content ] End -->

    <!-- Core scripts -->
    <script src="/resources/assets/js/pace.js"></script>
    <script src="/resources/assets/js/jquery-3.3.1.min.js"></script>
    <script src="/resources/assets/libs/popper/popper.js"></script>
    <script src="/resources/assets/js/bootstrap.js"></script>
    <script src="/resources/assets/js/sidenav.js"></script>
    <script src="/resources/assets/js/layout-helpers.js"></script>
    <script src="/resources/assets/js/material-ripple.js"></script>

    <!-- Libs -->
    <script src="/resources/assets/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <!-- <!-- Demo -->
    <script src="/resources/assets/js/demo.js"></script><script src="assets/js/analytics.js"></script> -->
    
    <script>
$(function(){
	var loginResult = "${loginFailure}";
	if(loginResult == "true"){
		alert("아이디와 비밀번호를 다시 확인해주세요");
			$("#mem_id").focus();
		}

	//쿠키 아이디
	var cookie = document.cookie;
		console.log("cookie:",cookie);
		var cookies = cookie.split(";");
		console.log("cookies:" , cookies);
		for (var v = 0; v < cookies.length; v++) {
			var aCookie = cookies[v].split("=");
			if (aCookie[0].trim() == "savedId") {
				var savedId = aCookie[1];
				console.log("savedId:", savedId);
				$("#mem_id").val(savedId);
				$("#mem_pw").focus();
				break;
			}
		}
	
	});

</script>
    
    
</body>              