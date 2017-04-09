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
                    <li class="active">민원</li>
                </ol>
                <!-- end:breadcrumb -->   
                
                 <div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header">
                            	신규 민원 접수
                        </h2>
                    </div>
                </div>
                <!-- start:dynamic data table -->
                <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <div class="panel-body">
                          			<div class="wall text-center">
                          				<a class="btn btn-success" href="" role="button" ><i class="fa fa-camera"></i>행방조사청구 </a>
                          				<a class="btn btn-success" href="" role="button" ><i class="fa fa-camera"></i>변환청구 </a>
                          				<a class="btn btn-success" href="" role="button" ><i class="fa fa-camera"></i>주소변경청구 </a>
                          				<a class="btn btn-success" href="" role="button" ><i class="fa fa-camera"></i>송장신청</a>
	                          		</div>
                          </div>
                      </section>
                  </div>
              </div>
              
              <div class="row">
                  <div class="col-lg-12">
                      <h2 class="page-header">
                          	민원 신청 내역
                      </h2>
                  </div>
              </div>
              <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <div class="panel-body">
                                <div class="adv-table">
                                    <table  class="display table table-hover table-condensed" id="example">
                                      <thead>
                                      <tr>
                                          <th>날짜</th>
                                          <th>개수</th>
                                          <th>픽업기사</th>
                                          <th>우체국요금</th>
                                          <th>DreamEMS요금</th>
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
                <!-- end:dynamic data table -->
        </div>
        
        <!-- end:main -->


    <!-- start:javascript for this page -->
    <!-- end:javascript for this page -->

</body>
</html>	