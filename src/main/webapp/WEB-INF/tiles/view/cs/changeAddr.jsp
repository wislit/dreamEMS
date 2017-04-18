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
	    <li><a href="${pageContext.request.contextPath}/cs">민원</a></li>
	    <li class="active">주소변경청구</li>
	</ol>
	<!-- end:breadcrumb -->   
	
	 <!-- <div class="row">
	    <div class="col-sm-12">
	        <h3 class="page-header">
	            	행방조사청구 신청서 작성
	        </h3>
	    </div>
	</div>
	 -->
	<div class="row">
		<div class="col-sm-12"><div class="panel panel-primary">
		<div class="panel-heading">
			<header class="panel-title text-center">
                 <h3>
	            	주소변경청구 신청서 작성
	        </h3>                   
            </header>
		</div>
		<div class="panel-body">
		<form class="form-horizontal" role="form">
			<div class="col-sm-8 col-sm-offset-2 alert alert-danger alert-outline alert-dismissable text-center">
				<p><strong>변경 전(前)</strong> 수취인의 주소와 <strong>변경 후(后)</strong> 수취인의 주소가 <br>
					동일한 성(省), 동일한 시(市) 내에 있을 경우에만주소변경청구가 가능합니다.</p>
            </div>	
			<div class="col-sm-12 div-test">
				<div class="form-group">
	                <label class="col-sm-2 col-sm-2 control-label">우편물 번호</label>
	                <div class="col-sm-5">
	                	<div class="input-group">
                            <input type="text" class="form-control">
                            <span class="input-group-btn">
                                <button class="btn btn-primary" type="button">조회</button>
                            </span>
                        </div>
	                    <p class="help-block">EMS 우편물만 청구가능, 우편물 번호는 영문자 E로 시작됩니다.<br> ex) EM900900900KR</p>
	                </div>
				</div>
            </div>	
			
			<div class="col-sm-6 div-test">
				<div class="form-group">
                      <label class="col-sm-4 control-label">발송인 이름</label>
                      <div class="col-sm-8">
                          <input class="form-control" type="text" disabled="">
                          <p class="help-block">발송인 이름은 반드시 영문으로 기재해 주시기 <br>바랍니다.
												(일본 및 중국에 한하여 한자 가능)</p>
                      </div>
                  </div>
                  
			</div>
			<div class="col-sm-6 div-test">
				<div class="form-group">
                      <label class="col-sm-3 control-label">발송인 주소</label>
                      <div class="col-sm-9">
                          <textarea class="form-control" disabled=""></textarea>
                          <p class="help-block">발송인 주소는 반드시 영문으로 기재해 주시기 <br>바랍니다.
												(일본 및 중국에 한하여 한자 가능)</p>
                      </div>
                   </div>
				
			</div>
			<div class="col-sm-12 div-test"><hr></div>
			<div class="col-sm-6 div-test">
				<div class="col-sm-11">
					<div class="form-group">
	                      <label class="col-sm-4 control-label">수취인 이름</label>
	                      <div class="col-sm-8">
	                          <input class="form-control" type="text" disabled="">
	                          <p class="help-block">수취인 이름은 반드시 영문으로 기재해 주시기 바랍니다.
													(일본 및 중국에 한하여 한자 가능)</p>
	                      </div>
	                   </div>
					<div class="form-group">
	                      <label class="col-sm-4 control-label">수취인 주소</label>
	                      <div class="col-sm-8">
	                          <textarea class="form-control" disabled=""></textarea>
	                          <p class="help-block">수취인 주소는 반드시 영문으로 상세주소까지 정확히 <br>기재해 주셔야
													행방조사 진행이 가능합니다.<br>(일본 및 중국에 한하여 한자 가능)</p>
	                      </div>
	                   </div>
				</div>
				<div class="col-sm-1"> 
					<div class="form-group"><i class="fa fa-exchange icon-circle icon-danger"></i></div>
					<div class="form-group"><i class="fa fa-exchange icon-circle icon-danger"></i></div>
						
				</div>
			</div>
			<div class="col-sm-6 div-test">
				<div class="form-group">
                      <label class="col-sm-3 control-label"><input type="checkbox" value=""> 변경할 <br>수취인 이름</label>
                      <div class="col-sm-9">
                          <input class="form-control" type="text" disabled="">
                          <p class="help-block">수취인 이름은 반드시 영문으로 기재해 주시기 바랍니다.
												<br>(일본 및 중국에 한하여 한자 가능)</p>
                      </div>
                   </div>
				<div class="form-group">
                      <label class="col-sm-3 control-label"><input type="checkbox" value=""> 변경할 <br>수취인 주소</label>
                      <div class="col-sm-9">
                          <textarea class="form-control" disabled=""></textarea>
                          <p class="help-block">수취인 주소는 반드시 영문으로 상세주소까지 정확히 <br>기재해 주셔야
												행방조사 진행이 가능합니다.<br>(일본 및 중국에 한하여 한자 가능)</p>
                      </div>
                   </div>
			</div>
            <div class="col-sm-4 col-sm-offset-4">
				<button type="button" class="btn btn-block btn-default">작성완료</button>
            </div>
		</form>
		</div></div></div>
	</div>
</div>
</body>
</html>