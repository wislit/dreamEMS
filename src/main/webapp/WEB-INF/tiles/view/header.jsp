<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<title>Srikandi - Responsive Admin Templates</title>
	<meta name="description" content="Srikandi Responsive Admin Templates" />
	<meta name="keywords" content="resposinve, admin dashboard, admin page, admin template" />
	<meta name="author" content="Candra Dwi Waskito" />
	<link rel="shortcut icon" href="../favicon.ico">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font-awesome.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap-reset.css">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
    <!-- css for this page -->
    <link href="${pageContext.request.contextPath}/static/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/owl.theme.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/owl.transitions.css">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/bootstrap-table/bootstrap-table.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/data-tables/DT_bootstrap.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/jquery-confirm/jquery-confirm.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/datepicker/css/bootstrap-datepicker3.css" />
</head>

<sec:authorize access="hasAuthority('ADMIN')" var="isAdmin" />

<!-- start:wrapper -->
    <div id="wrapper">
        <div class="header-top">
            <!-- start:navbar -->
            <nav class="navbar navbar-inverse navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="container">
                    <!-- start:navbar-header -->
                    <div class="navbar-header">
                        <a class="navbar-brand" href="/"><i class="fa  fa-paper-plane"></i><span> </span> Dream<strong>EMS</strong></a>
                    </div>
                    <!-- end:navbar-header -->
                    <!-- <ul class="nav navbar-nav navbar-left top-menu">
                        start dropdown 1
                        <li class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <i class="fa fa-tasks"></i>
                                <span class="badge bg-success">6</span>
                            </a>
                            <ul class="dropdown-menu extended tasks-bar">
                                <div class="notify-arrow notify-arrow-green"></div>
                                <li>
                                    <p class="green">You have 6 pending tasks</p>
                                </li>
                                <li>
                                     <a href="#">
                                        <div class="task-info">
                                            <div class="desc">Dashboard v1.3</div>
                                            <div class="percent">40%</div>
                                        </div>
                                        <div class="progress progress-striped">
                                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                                <span class="sr-only">40% Complete (success)</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="task-info">
                                            <div class="desc">Database Update</div>
                                            <div class="percent">60%</div>
                                        </div>
                                        <div class="progress progress-striped">
                                            <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                                <span class="sr-only">60% Complete (warning)</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="external">
                                    <a href="#">See All Tasks</a>
                                </li>
                            </ul>
                        </li> -->
                        <!-- end dropdown 1 -->
                        <!-- start dropdown 3 -->
                        <!-- <li id="header_notification_bar" class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <i class="fa fa-bell-o"></i>
                                <span class="badge bg-warning">7</span>
                            </a>
                            <ul class="dropdown-menu extended notification">
                                <div class="notify-arrow notify-arrow-yellow"></div>
                                <li>
                                    <p class="yellow">You have 7 new notifications</p>
                                </li>
                                <li>
                                    <a href="#">
                                        <span class="label label-danger"><i class="fa fa-bolt"></i></span>
                                        Server #3 overloaded.
                                        <span class="small italic">34 mins</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <span class="label label-warning"><i class="fa fa-bell"></i></span>
                                        Server #10 not respoding.
                                        <span class="small italic">1 Hours</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <span class="label label-danger"><i class="fa fa-bolt"></i></span>
                                        Database overloaded 24%.
                                        <span class="small italic">4 hrs</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <span class="label label-success"><i class="fa fa-plus"></i></span>
                                        New user registered.
                                        <span class="small italic">Just now</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <span class="label label-info"><i class="fa fa-bullhorn"></i></span>
                                        Application error.
                                        <span class="small italic">10 mins</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">See all notifications</a>
                                </li>
                            </ul>
                        </li> -->
                        <!-- end dropdown 3 -->
                    </ul>
                    <ul class="nav navbar-nav navbar-right top-menu">
                        <li> 
                        	<form class="form-inline" role="form">
                       		<div class="form-group">
                       			<div class="form-group">
                       			 <font color="white"><strong>EMS 행방조회 &ensp;</strong></font>
                       			</div>
                       			<div class="input-group">
								  <input type="text" class="form-control input-sm search" id="inputWhereEMS" placeholder="송장번호">
								</div>
								<div class="form-group">
							      <button class="btn btn-default" type="button"><i class="fa fa-search"></i></button>
								</div>
                              <!-- <label for="inputWhereEMS" class="col-lg-4 col-sm-4 control-label">EMS 행방조회</label> -->
                              	 <!-- <input type="text" class="form-control input-sm search" id="inputWhereEMS" placeholder="송장번호"> -->
                           </div>
                           </form>
                        </li>
                        <!-- user login dropdown start-->
                        <li class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <i class="fa fa-user icon-circle icon-success"></i>
                                <span class="username"><sec:authentication property="principal.username"/></span>
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <div class="log-arrow-up"></div>
                                <!-- <li><a href="#"><i class=" fa fa-suitcase"></i>Profile</a></li>
                                <li><a href="#"><i class="fa fa-cog"></i> Settings</a></li>
                                <li><a href="#"><i class="fa fa-bell-o"></i> Notification</a></li> -->
                                <li><a href="${pageContext.request.contextPath}/logout"><i class="fa fa-key"></i> Log Out</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
            <!-- end:navbar -->
        </div>
        <!-- start:header -->
        <div id="header">
            <div class="overlay">
                <nav class="navbar" role="navigation">
                    <div class="container">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="btn-block btn-drop navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                                <strong>MENU</strong>
                            </button>
                        </div>
                    
                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse navbar-ex1-collapse">
                            <ul class="nav nav-pills nav-justified"> <!-- nav nav-pills nav-justified -->
                            	<c:if test="${isAdmin}">
								  <li>
	                                    <a href="${pageContext.request.contextPath}/user/home">
	                                        <div class="text-center">
	                                            <i class="fa fa-user fa-3x"></i><br>
	                                            	사용자
	                                        </div>
	                                    </a>
	                                </li>
								</c:if>
                            
                                <li> <!-- class="active" -->
                                    <a href="${pageContext.request.contextPath}/order/home">
                                        <div class="text-center">
                                            <i class="fa fa-desktop fa-3x"></i><br>
                                            	접수
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ship/home">
                                        <div class="text-center">
                                            <i class="fa fa-truck fa-3x"></i><br>
                                            	발송
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/payment/home">
                                        <div class="text-center">
                                            <i class="fa fa-krw fa-3x"></i><br>
                                            	결제
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/cs/home">
                                        <div class="text-center">
                                            <i class="fa fa-pencil-square-o fa-3x"></i><br>
                                            	민원
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/return/home">
                                        <div class="text-center">
                                            <i class="fa fa-sign-in fa-3x"></i><br>
                                            	반송
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/adjust/home">
                                        <div class="text-center">
                                            <i class="fa  fa-spinner fa-3x"></i><br>
                                            	조정처리
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/box/home">
                                        <div class="text-center">
                                            <i class="fa fa-inbox fa-3x"></i><br>
                                            	BOX
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/fee/home">
                                        <div class="text-center">
                                            <i class="fa fa-th-list fa-3x"></i><br>
                                            	요금표
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/qna/home">
                                        <div class="text-center">
                                            <i class="fa fa-comments fa-3x"></i><br>
                                            	문의
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div><!-- /.navbar-collapse -->
                    </div>
                </nav>
            </div>
        </div>
        <!-- end:header -->
        
<%-- <!-- Credentials display -->
Your password is <sec:authentication property="credentials"/>
...
 
<!-- Roles display -->
<sec:authentication property="authorities" var="roles" scope="page" />
Your roles are:
<ul>
    <c:forEach var="role" items="${roles}">
    <li>${role}</li>
    </c:forEach>
</ul>
 
<!-- Username display -->
Your username is <sec:authentication property="principal.username"/>
isadmin ${isAdmin}
 --%>

<!-- start:javascript -->
<!-- javascript default for all pages-->
<script src="${pageContext.request.contextPath}/static/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.i18n.properties.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>

<!-- javascript for Srikandi admin -->
<script src="${pageContext.request.contextPath}/static/js/themes.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.scrollTo.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.nicescroll.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.sparkline.js" type="text/javascript"></script>
<script class="include" type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/jquery.dcjqaccordion.2.7.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/respond.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/dreamEMS.common.js"></script>

<script src="${pageContext.request.contextPath}/static/assets/advanced-datatable/media/js/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/data-tables/DT_bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/jquery-confirm/jquery-confirm.js"></script>
<%-- <script src="${pageContext.request.contextPath}/static/assets/bootstrap-table/bootstrap-table.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/static/assets/bootstrap-table/bootstrap-table-locale-all.min.js"></script> --%>
<script type="text/javascript">
$(document).ready(function() {
	loadBundles('${pageContext.response.locale}');
});
</script>
<!-- end:javascript -->
