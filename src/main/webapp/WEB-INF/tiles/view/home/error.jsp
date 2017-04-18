<%@ page isErrorPage="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<title>Srikandi - Responsive Admin Templates</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font-awesome.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap-reset.css">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
</head>
<body id="wrapper-500">

    <!-- start:wrapper -->
    <div class="container">
        <div class="errorpage">
            <i class="fa fa-flash fa-4x"></i>
            <h1>Ouch!</h1>
            <p>500 Page Error</p>
            <h5>Looks like Something went wrong. <a href="#" class="btn btn-sm btn-danger">Return Home</a></h5>
		    <br><br>
		    <h4>Application has encountered an error. Please contact support on ...</h4>
		    Failed URL: ${url}
		    <h2>Error Message</h2>
		    ${message}
		    <h2>Error Code</h2>
		    ${code} : ${error}
		    <h2>Error Trace</h2>
		    ${ex.message}
		    ${ex}
		    <c:forEach items="${ex.stackTrace}" var="st">
		   	 	${st} 
	        </c:forEach>
        </div>
    </div>
    <!-- end:wrapper -->

	<!-- start:javascript -->
	<!-- javascript default for all pages-->
	<script src="${pageContext.request.contextPath}/static/js/jquery-1.11.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>

    <!-- javascript for Srikandi admin -->
    <script src="${pageContext.request.contextPath}/static/js/themes.js"></script>
	<!-- end:javascript -->

</body>
</html>	