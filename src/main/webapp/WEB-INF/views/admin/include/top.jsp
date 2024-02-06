<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="material-style layout-fixed">

<head>
    <title>관리자페이지</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="Bhumlu Bootstrap admin template made using Bootstrap 4, it has tons of ready made feature, UI components, pages which completely fulfills any dashboard needs." />
    <meta name="keywords" content="Bhumlu, bootstrap admin template, bootstrap admin panel, bootstrap 4 admin template, admin template">
    <meta name="author" content="Srthemesvilla" />
    <link rel="icon" type="image/x-icon" href="/resources/assets/img/favicon.ico">

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
    <!-- <link rel="stylesheet" href="/resources/assets/css/demo/demo.css"> -->

    <!-- Libs -->
    <link rel="stylesheet" href="/resources/assets/libs/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="/resources/assets/libs/flot/flot.css">
    
    <!-- Core scripts -->
    <script src="/resources/assets/js/pace.js"></script>
    <!-- <script src="/resources/assets/js/jquery-3.3.1.min.js"></script> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>						
    <script src="/resources/assets/libs/popper/popper.js"></script>
    <script src="/resources/assets/js/bootstrap.js"></script>
    <script src="/resources/assets/js/sidenav.js"></script>
    <script src="/resources/assets/js/layout-helpers.js"></script>
    <script src="/resources/assets/js/material-ripple.js"></script>

    <!-- Libs -->
    <script src="/resources/assets/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="/resources/assets/libs/eve/eve.js"></script>
    <script src="/resources/assets/libs/flot/flot.js"></script>
    <script src="/resources/assets/libs/flot/curvedLines.js"></script>
    <script src="/resources/assets/libs/chart-am4/core.js"></script>
    <script src="/resources/assets/libs/chart-am4/charts.js"></script>
    <script src="/resources/assets/libs/chart-am4/animated.js"></script>

    <!-- Demo -->
    <script src="/resources/assets/js/demo.js"></script>
    <script src="/resources/assets/js/analytics.js"></script>
    <!-- <script src="/resources/assets/js/pages/dashboards_index.js"></script> -->
    
    <script>
   
    function TopMenuClick(href, obj) {
        console.log("href: ", href);
         $.ajax({
	        url: href,
	        success: function(data) {
	            console.log("data: ", data);
	            $("#sub_menu").html(data);

	        }
	    }); 
 
    }
   
    $(document).ready(function() {
        $("#sub_menu").on("click", ".s-link", function(e) {
        	e.stopPropagation();
        	e.preventDefault();
        	var href= $(this).attr("href");
        	$(this).parent().addClass("open");
        	TopMenuClick(href, $(this));
        });
        
    });
    
    
</script>

</head>

<body>
    <!-- [ Preloader ] Start -->
    <div class="page-loader">
        <div class="bg-primary"></div>
    </div>
    <!-- [ Preloader ] End -->

    <!-- [ Layout wrapper ] Start -->
    <div class="layout-wrapper layout-2">

        <div class="layout-inner">
            <!-- [ Layout sidenav ] Start -->
            <div id="layout-sidenav" class="layout-sidenav sidenav sidenav-vertical bg-dark">
                <!-- Brand demo (see assets/css/demo/demo.css) -->
                <div class="app-brand demo">
                    <span class="app-brand-logo demo">
                        <img src="/resources/adimg/logoY.png" alt="Brand Logo" class="" style=" width: 65px;">
                    </span>
                    <a href="/admin/" class="app-brand-text demo sidenav-text font-weight-normal ml-2">관리자페이지</a>

                </div>
                <div class="sidenav-divider mt-0"></div>

                <!-- Links -->
                <ul class="sidenav-inner py-1">

                    <!-- Dashboards -->
                    <li class="sidenav-item active">
                        <a href="/admin/menu" class="sidenav-link">
                            <i class="sidenav-icon feather icon-home"></i>
                            <div>Dashboards</div>
                            <div class="pl-1 ml-auto">
                                <div class="badge badge-danger">Hot</div>
                            </div>
                        </a>
                    </li>

                    <!-- 메뉴 -->
                    <!-- <li class="sidenav-divider mb-1"></li>
                    <li class="sidenav-header small font-weight-semibold">메뉴</li>
                    <li class="sidenav-item">
                        <a href="/admin/menu" class="sidenav-link">
                            <i class="sidenav-icon feather icon-type"></i>
                            <div>메뉴관리</div>
                        </a>
                    </li> -->
					<span id="sub_menu">
                    <!-- 관리자 -->
                    <c:forEach var="topMenu" items="${topMenuList}" varStatus="status">
	                    <li class="sidenav-item">
	                        
							    <a href="${topMenu.menu_url}?menu_id=${topMenu.menu_id}" class="sidenav-link sidenav-toggle  s-link">
							        <div>${topMenu.menu_name}</div>
							    </a>
							    <ul class="sidenav-menu">
		                        	<c:forEach var="subMenu" items="${subMenuList}" varStatus="sta">
			                            <c:if test="${subMenu.parent_menu_id eq topMenu.menu_id}"> 
						                    <li class="sidenav-item">
						                        <a href="${subMenu.menu_url}?menu_id=${subMenu.parent_menu_id}" class="sidenav-link">
						                            <div>${subMenu.menu_name}</div>
						                        </a>
						                    </li>
						                 </c:if> 
		                         	</c:forEach>
	                        	</ul>
	                    </li>
                    </c:forEach> 
                    	
                     </span>
                    
                    
                    

                    <!-- 회원관리 -->
                    <!-- <li class="sidenav-divider mb-1"></li>
                    <li class="sidenav-header small font-weight-semibold">로그인</li>
                    <li class="sidenav-item">
                        <a href="/admin/login" class="sidenav-link sidenav-toggle">
                            <i class="sidenav-icon feather icon-clipboard"></i>
                            <div>로그인</div>
                        </a>
                         <ul class="sidenav-menu">
                            <li class="sidenav-item">
                                <a href="forms_layouts.html" class="sidenav-link">
                                    <div>Layouts and elements</div>
                                </a>
                            </li>
                            <li class="sidenav-item">
                                <a href="forms_input-groups.html" class="sidenav-link">
                                    <div>Input groups</div>
                                </a>
                            </li>
                        </ul> 
                    </li> -->

                </ul>
            </div>
            <!-- [ Layout sidenav ] End -->
            
            <!-- [ Layout container ] Start -->
            <div class="layout-container">
                <!-- [ Layout navbar ( Header ) ] Start -->
                <nav class="layout-navbar navbar navbar-expand-lg align-items-lg-center bg-white container-p-x" id="layout-navbar">

                    <!-- Brand demo (see assets/css/demo/demo.css) -->
                    <a href="index.html" class="navbar-brand app-brand demo d-lg-none py-0 mr-4">
                        <span class="app-brand-logo demo">
                            <img src="/resources/assets/img/logo-dark.png" alt="Brand Logo" class="img-fluid">
                        </span>
                        <span class="app-brand-text demo font-weight-normal ml-2">Bhumlu</span>
                    </a>

                    <!-- Sidenav toggle (see assets/css/demo/demo.css) -->
                    <div class="layout-sidenav-toggle navbar-nav d-lg-none align-items-lg-center mr-auto">
                        <a class="nav-item nav-link px-0 mr-lg-4" href="javascript:">
                            <i class="ion ion-md-menu text-large align-middle"></i>
                        </a>
                    </div>

                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#layout-navbar-collapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="navbar-collapse collapse" id="layout-navbar-collapse">
                        <!-- Divider -->
                        <hr class="d-lg-none w-100 my-2">

                        <div class="navbar-nav align-items-lg-center">
                            <!-- Search -->
                            <label class="nav-item navbar-text navbar-search-box p-0 active">
                                <i class="feather icon-search navbar-icon align-middle"></i>
                                <span class="navbar-search-input pl-2">
                                    <input type="text" class="form-control navbar-text mx-2" placeholder="Search...">
                                </span>
                            </label>
                        </div>

                        <div class="navbar-nav align-items-lg-center ml-auto">
                            <div class="demo-navbar-notifications nav-item dropdown mr-lg-3">
                                <a class="nav-link dropdown-toggle hide-arrow" href="#" data-toggle="dropdown">
                                    <i class="feather icon-bell navbar-icon align-middle"></i>
                                    <span class="badge badge-danger badge-dot indicator"></span>
                                    <span class="d-lg-none align-middle">&nbsp; Notifications</span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <div class="bg-primary text-center text-white font-weight-bold p-3">
                                        4 New Notifications
                                    </div>
                                    <div class="list-group list-group-flush">
                                        <a href="javascript:" class="list-group-item list-group-item-action media d-flex align-items-center">
                                            <div class="ui-icon ui-icon-sm feather icon-home bg-secondary border-0 text-white"></div>
                                            <div class="media-body line-height-condenced ml-3">
                                                <div class="text-dark">Login from 192.168.1.1</div>
                                                <div class="text-light small mt-1">
                                                    Aliquam ex eros, imperdiet vulputate hendrerit et.
                                                </div>
                                                <div class="text-light small mt-1">12h ago</div>
                                            </div>
                                        </a>
                                    </div>
                                    <a href="javascript:" class="d-block text-center text-light small p-2 my-1">Show all notifications</a>
                                </div>
                            </div>

                            <div class="demo-navbar-messages nav-item dropdown mr-lg-3">
                                <a class="nav-link dropdown-toggle hide-arrow" href="#" data-toggle="dropdown">
                                    <i class="feather icon-mail navbar-icon align-middle"></i>
                                    <span class="badge badge-success badge-dot indicator"></span>
                                    <span class="d-lg-none align-middle">&nbsp; Messages</span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <div class="bg-primary text-center text-white font-weight-bold p-3">
                                        4 New Messages
                                    </div>
                                    <div class="list-group list-group-flush">
                                        <a href="javascript:" class="list-group-item list-group-item-action media d-flex align-items-center">
                                            <img src="/resources/assets/img/avatars/6-small.png" class="d-block ui-w-40 rounded-circle" alt>
                                            <div class="media-body ml-3">
                                                <div class="text-dark line-height-condenced">Lorem ipsum dolor consectetuer elit.</div>
                                                <div class="text-light small mt-1">
                                                    Josephin Doe &nbsp;·&nbsp; 58m ago
                                                </div>
                                            </div>
                                        </a>
                                    </div>

                                    <a href="javascript:" class="d-block text-center text-light small p-2 my-1">Show all messages</a>
                                </div>
                            </div>

                            <!-- Divider -->
                            <div class="nav-item d-none d-lg-block text-big font-weight-light line-height-1 opacity-25 mr-3 ml-1">|</div>
                            <div class="demo-navbar-user nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
                                    <span class="d-inline-flex flex-lg-row-reverse align-items-center align-middle">
                                        <img src="/resources/assets/img/avatars/1.png" alt class="d-block ui-w-30 rounded-circle">
                                        <span class="px-1 mr-lg-2 ml-2 ml-lg-0">${loginInfo.mem_name}</span>
                                    </span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
 <!--                                    <a href="javascript:" class="dropdown-item">
                                        <i class="feather icon-user text-muted"></i> &nbsp; My profile</a>
                                    <a href="javascript:" class="dropdown-item">
                                        <i class="feather icon-mail text-muted"></i> &nbsp; Messages</a>
                                    <a href="javascript:" class="dropdown-item">
                                        <i class="feather icon-settings text-muted"></i> &nbsp; Account settings</a> -->
                                    <div class="dropdown-divider"></div>
                                    <a href="javascript:" class="dropdown-item">
                                        <i class="feather icon-power text-danger"></i> &nbsp; Log Out</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>
                <!-- [ Layout navbar ( Header ) ] End -->

                <!-- [ Layout content ] Start -->
                <div class="layout-content">