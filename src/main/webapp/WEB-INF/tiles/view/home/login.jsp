<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<title>Dream EMS Login</title>
	<link rel="shortcut icon" href="../favicon.ico">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font-awesome.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap-reset.css">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
</head>
<body>
    <!-- start:form login -->
    <div class="container">
        <form class="form-login" action="login-process"  method="post">
            <h2 class="form-login-heading"><spring:message code="web.login.form.lable.signin" /></h2>
            <spring:message code="web.form.language"/> : <a href="?lang=en_US">English</a> | <a href="?lang=ko_KR">한국어</a>
            <%-- Current Locale : ${pageContext.response.locale } --%>
            <div class="login-wrap">
                <input type="text" class="form-control" placeholder="User ID" autofocus name="id">
                <input type="password" class="form-control" placeholder="Password" name="password">
                <label class="checkbox">
                    <input type="checkbox" value="remember-me">
                    	<spring:message code="web.login.form.fields.rememberme"/>
                    <span class="pull-right">
                        <a data-toggle="modal" href="#myModal"><spring:message code="web.login.form.lable.resetLink"/></a>
                    </span>
                </label>
                <button class="btn btn-lg btn-login btn-block" type="submit"><spring:message code="web.login.form.lable.signin" /></button>
                <div class="registration">
                    <spring:message code="web.login.form.lable.register.text"/>
                    <a class="" href="register.html">
                        <spring:message code="web.login.form.lable.register"/>
                    </a>
                </div>
            </div>

            <!-- Modal -->
            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title"><spring:message code="web.login.form.lable.resetLink"/></h4>
                        </div>
                        <div class="modal-body">
                            <p><spring:message code="web.login.form.lable.resetLink.text"/></p>
                            <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">
                        </div>
                        <div class="modal-footer">
                            <button data-dismiss="modal" class="btn btn-default" type="button"><spring:message code="web.form.cancel"/></button>
                            <button class="btn btn-success" type="button"><spring:message code="web.form.submit"/></button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- modal -->
        </form>
    </div>
    <!-- end:form login -->
    
   	<!-- start:javascript -->
	<!-- javascript default for all pages-->
	<script src="${pageContext.request.contextPath}/static/js/jquery-1.11.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>

    <!-- javascript for Srikandi admin -->
    <script src="${pageContext.request.contextPath}/static/js/themes.js"></script>
	<!-- end:javascript -->

</body>
</html>	