<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
        <!-- start:main -->
        <div class="container">
            <div id="main">
                <!-- start:breadcrumb -->
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">결제</li>
                </ol>
                <!-- end:breadcrumb -->   
                
                 <div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header">
                            	결제내역 조회
                        </h2>
                    </div>
                </div>
                
                <!-- start:dynamic data table -->
                <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <div class="panel-body">
                          	<div class="col-sm-4 col-sm-offset-4">
                          			<div class="well well-sm">
	                          			<form class="form-inline" role="form">
		                                    	<div class="form-group">
		                                    		<ul class="pager">
					                                    <li class="previous"><a href="#">&larr; 이전달</a></li>
					                                    <li>
					                                    	<select class="form-control input-sm">
			                                                	<option>2016</option>
			                                                	<option>2015</option>
			                                            	</select>
			                                            	<select class="form-control input-sm">
			                                                	<option>3</option>
			                                                	<option>4</option>
			                                            	</select>
					                                    </li>
					                                    <li class="next"><a href="#">다음달 &rarr;</a></li>
					                                </ul>	
		                                    	</div>
		                                </form>
	                          		</div>
                          	</div>
		                            <table class="table table-bordered text-center">
		                                <thead>
		                                    <tr class="info">
		                                        <th> </th>
		                                        <th colspan="2">03월 입금금액 합계</th>
		                                        <th colspan="2">결제금액 합계(배송요금 + 추가요금)</th>
		                                        <th>현재잔액</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                    <tr>
		                                        <td></td>
		                                        <td colspan="2">Larry the Bird</td>
		                                        <td colspan="2">Larry the Bird</td>
		                                        <td>@twitter</td>
		                                    </tr>
		                                </tbody>
		                            </table>
                                    <table  class="display table table-hover table-bordered table-condensed" id="example">
                                      <thead>
                                      <tr>
                                          <th>날짜</th>
                                          <th>환불금액</th>
                                          <th>입금금액</th>
                                          <th>배송금액</th>
                                          <th>추가금액</th>
                                          <th>잔여금액</th>
                                      </tr>
                                      </thead>
                                      <tbody>
                                      	<tr>
	                                        <td>2016-03-01</td>
	                                        <td>125123</td>
	                                        <td>124123</td>
	                                        <td>124123213</td>
	                                        <td>32523432534</td>
	                                        <td>234324325</td>
	                                    </tr>
	                                    <tr>
	                                        <td>2016-03-02</td>
	                                        <td>12421321535</td>
	                                        <td>3463534234</td>
	                                        <td>3423423231412</td>
	                                        <td>436243</td>
	                                        <td>23423523</td>
	                                    </tr>
                                      </tbody>
                          			</table>
                          </div>
                      </section>
                  </div>
              </div>
                <!-- end:dynamic data table -->
                
        </div>
        
        <!-- end:main -->


    <!-- start:javascript for this page -->
    <!-- end:javascript for this page -->

</body>
</html>	