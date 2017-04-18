<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<!-- start:main -->
<div class="container"> <!-- footer.jsp에 container </div> 있음 마지막에 닫는태그 안써도됨 -->
<div id="main">

	<!-- start:breadcrumb -->
	<ol class="breadcrumb">
	    <li><a href="${pageContext.request.contextPath}/">Home</a></li>
	    <li class="active">민원</li>
	</ol>
	<!-- end:breadcrumb -->   
	
	 <!-- <div class="row">
	    <div class="col-sm-12">
	        <h3 class="page-header">
	            	신규 민원 접수
	        </h3>
	    </div>
	</div> -->
	
	<div class="row">
	    <div class="col-sm-12">
   			<div class="well-sm">
   				<div class="row">
	   				<div class="col-sm-3"><a class="btn btn-primary btn-block btn-lg" href="${pageContext.request.contextPath}/cs/where" role="button" >행방조사청구 </a></div>
	   				<div class="col-sm-3"><a class="btn btn-primary btn-block btn-lg" href="${pageContext.request.contextPath}/cs/return" role="button" >반환청구 </a></div>
	   				<div class="col-sm-3"><a class="btn btn-primary btn-block btn-lg" href="${pageContext.request.contextPath}/cs/changeAddr" role="button" >주소변경청구 </a></div>
	   				<div class="col-sm-3"><a class="btn btn-primary btn-block btn-lg" href="${pageContext.request.contextPath}/cs/invoice" role="button" >송장신청</a></div>
   				</div>
    		</div>
	    </div>
	</div>
	
	<div class="row">
	    <div class="col-sm-12">
	        <h3 class="page-header">
	            	민원 신청 내역
	        </h3>
	    </div>
	</div>
	
	<div class="row">
	    <div class="col-sm-12">
	        <section class="panel">
	            <div class="panel-body">
                  <div class="adv-table">
                      <table  class="display table table-hover table-condensed" id="example">
                        <thead>
                        <tr>
                            <th class="text-center">신청일</th>
                            <th class="text-center">민원종류</th>
                            <th class="text-center">우편물 번호</th>
                            <th class="text-center">발송인 이름</th>
                            <th class="text-center">상세내역</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
           			</table>
                  </div>
	            </div>
	        </section>
	    </div>
	</div>
	
</div>
<!-- end:main -->


<!-- start:javascript for this page -->
<!-- end:javascript for this page -->

</body>
</html>	