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
	    <li class="active">문의</li>
	</ol>
	<!-- end:breadcrumb -->   
	
	 <!-- <div class="row">
	    <div class="col-sm-12">
	        <h3 class="page-header">
	            	반환청구 신청서 작성
	        </h3>
	    </div>
	</div> -->
	
	<div class="row">
		<div class="col-sm-12"><div class="panel panel-primary">
		<div class="panel-heading">
			<header class="panel-title text-center">
                 <h3>
	            	문의 작성
	        </h3>                   
            </header>
		</div>
		<div class="panel-body">
		<form class="form-horizontal" role="form">
			<div class="col-sm-8 col-sm-offset-2 alert alert-warning alert-outline alert-dismissable text-center">
				<p>이용하시면서 불편한 사항이나 개선점이 있다면 언제든지 알려주세요.
				</p>
            </div>	
            
            <div class="form-group col-sm-12">
	            <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">문의유형</label>
	            <div class="col-lg-10">
                    <label class="radio-inline">
                        <input type="radio" name="optionsRadios" id="inlineCheckbox1" value="option1" checked=""> 홈페이지 이용
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="optionsRadios" id="inlineCheckbox2" value="option2"> EMS
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="optionsRadios" id="inlineCheckbox3" value="option3"> 기타
                    </label>

                </div>
	        </div>
            <div class="form-group">
               <label class="col-sm-2 control-label">제목</label>
               <div class="col-sm-9">
                   <input class="form-control" type="text">
               </div>
            </div>
            <div class="form-group">
               <label class="col-sm-2 control-label">이메일</label>
               <div class="col-sm-9">
                   <input class="form-control" type="text">
               </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">문의내용</label>
                <div class="col-sm-9">
                	<textarea class="form-control" cols="60" rows="15"></textarea>
                </div>
             </div>
             <div class="col-sm-10 col-sm-offset-2 alert alert-success alert-bordered alert-dismissable">
                	접수하신 문의는 빠른시일내에 조치하도록 하겠습니다 <br>
                 	적어주신 정보는 문의처리를 위한 용도로만 이용됩니다
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