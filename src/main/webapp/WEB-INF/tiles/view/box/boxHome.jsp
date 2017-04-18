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
	    <li class="active">BOX</li>
	</ol>
	<!-- end:breadcrumb -->   
	
	 <div class="row">
	    <div class="col-sm-12">
	        <h3 class="page-header">
	            	BOX 목록
	        </h3>
	    </div>
	</div>
	
		<div class="row">
	    <div class="col-sm-12">
	        <section class="panel">
	            <div class="panel-body">
	            	<!-- start:search well -->
	       			<div class="well well">
	        			<form class="form-inline" role="form">
	        				<div class="row">
		        				<div class="col-sm-8 col-sm-offset-2">
		        					<div class="form-group">
				                   		<button type="button" class="btn btn-default btn-sm">당일</button>
				                   		<button type="button" class="btn btn-default btn-sm">1주일</button>
				                   		<button type="button" class="btn btn-default btn-sm">1개월</button>
				                   		<button type="button" class="btn btn-default btn-sm">1년</button>
				                   		<button type="button" class="btn btn-default btn-sm">전체</button>
				                   </div>
			       					<div class="input-group input-group-sm col-sm-3">
			                           	<span class="input-group-addon input-group-addon-info"><i class="fa fa-calendar"></i></span>
			                            <input type="text" class="form-control input-sm"  id="dp1" >
			                       </div> 
			                       ~
			                       <div class="input-group input-group-sm col-sm-3">
			                              <span class="input-group-addon input-group-addon-info"><i class="fa fa-calendar"></i></span>
			                              <input type="text" class="form-control input-sm" id="dp2">
			                       </div>
			       					<div class="form-group">
		                          		<button type="button" class="btn btn-info btn-sm">검색</button>
		                          	</div>
			       				</div>
	        				</div>
	                    </form>
	             	</div>
	             	<!-- end:search well -->
	            
                    <div style="padding: 15px 0; float: left;">
	                	<h4><span class="label label-primary">BOX 및 에어캡 가격표</span></h4>
                	</div>
                
                  <table class="table table-bordered text-center">
                      <tbody>
                          <tr>
                              <td class="info">중량</td>
                              <td>~ 2,000g</td>
                              <td>2,000g ~ 5,000g</td>
                              <td>5,000g ~ 10,000g</td>
                              <td>10,000g ~ 20,000g</td>
                              <td>20,000g ~ </td>
                          </tr>
                          <tr>
                              <td class="info">택배비 차감액</td>
                              <td>3,500원</td>
                              <td>4,000원</td>
                              <td>5,500원</td>
                              <td>7,000원</td>
                              <td>8,500원</td>
                          </tr>
                      </tbody>
                  </table>
                  
                  <div class="adv-table" style="margin-top: 20px">
                      <table  class="display table table-hover table-condensed" id="example">
                        <thead>
                        <tr>
                            <th class="text-center">접수일</th>
                            <th class="text-center">배송기사</th>
                            <th class="text-center">1호</th>
                            <th class="text-center">2호</th>
                            <th class="text-center">3호</th>
                            <th class="text-center">4호</th>
                            <th class="text-center">5호</th>
                            <th class="text-center">6호</th>
                            <th class="text-center">에어캡</th>
                            <th class="text-center">합계금액</th>
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