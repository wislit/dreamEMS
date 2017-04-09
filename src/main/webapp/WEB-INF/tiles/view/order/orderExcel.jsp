<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- start:main -->
<div class="container"><!-- footer.jsp에 container </div> 있음 마지막에 닫는태그 안써도됨 -->
    <div id="main">
    
        <!-- start:breadcrumb -->
        <ol class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/order/home">접수</a></li>
            <li class="active">엑셀접수</li>
        </ol>
        <!-- end:breadcrumb -->   
        
        <!-- start:page header -->
        <div class="row">
            <div class="col-sm-12">
                <h3 class="page-header">
                    	엑셀접수
                </h3>
            </div>
        </div>
        <!-- end:page header -->
        
        <!-- start:file upload -->
        <div class="row">
            <div class="col-sm-12">
            	<!-- start:info -->
                <section class="panel">
                    <div class="panel-body">
                    	<!-- start:excel download info -->
				         <div class="row">
				         	<div class="col-sm-12"> 
				                	<div style="margin: 15px 0;">
					                	<h4><span class="label label-danger">접수하기전에 읽어주세요</span></h4>
				                	</div>
				                    <ul>
				                        <li>엑셀양식을 다운로드 받아 작성해 주시기 바랍니다<br>
				                         	<a class="btn btn-info btn-sm" href="" role="button" ><i class="fa fa-download"></i> ems간편 템플릿 <span class="label label-warning">추천</span></a>
				                         	<a class="btn btn-info btn-sm" href="" role="button" ><i class="fa fa-download"></i> 기존 우체국용 템플릿</a>
				                         	</li>
				                         <li>비서류 일반EMS 배송헤대해 대량접수가 가능합니다</li>
				                         <li>EMS 프리미엄 배송을 원하실 경우 사무실로 연락주시기 바랍니다.</li>
				                    </ul>
				            </div>
				        </div>
				        <!-- end:excel download info -->
				        
				        <!-- start:excel file uploader -->
				        <div class="row">
				        	<div class="col-sm-6 col-sm-offset-3">
				        		<section class="panel panel-info">
				        			<div class="panel-heading">
				        				파일 업로드
				        			</div>
                    				<div class="panel-body">
                    					<form class="" role="form">
                    						<div class="form-group">
                    							<div class="col-sm-8">
	                    							<div class="fileupload fileupload-new" data-provides="fileupload">
			                                             <span class="btn btn-info btn-file">
			                                             <span class="fileupload-new"><i class="fa fa-paperclip"></i> Select file</span>
			                                             <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
			                                             <input type="file" class="default" />
			                                             </span>
			                                                 <span class="fileupload-preview" style="margin-left:5px;"></span>
			                                                 <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
				                                    </div> 
                    							</div>
			                                    <div class="col-sm-4">
			                                 	 <button class="btn btn-block btn-success" type="button"><i class="fa fa-upload"></i> 업로드</button>
			                                    </div>
                    						</div>
			                     		 </form>
                    				</div>
                   				</section>
				        	</div>
				        </div>
				        <!-- end:excel file uploader -->
                   </div>
                </section>
                <!-- end:info -->
                
                <!-- start:data -->
                <section class="panel">
                    <div class="panel-body">
                    	<div class="adv-table">
                       			<table class="display table table-hover table-condensed text-center" id="example">
	                            	<thead>
		                                 <tr>
		                                 	<th class="text-center"><input id="example-select-all" type="checkbox"></th>
		                                    <th class="text-center">No</th>
		                                    <th class="text-center">날짜</th>
		                                    <th class="text-center">송장번호</th>
		                                    <th class="text-center">받는사람</th>
		                                    <th class="text-center">국가</th>
		                                    <th class="text-center">중량(g)</th>
		                                    <th class="text-center">우체국요금</th>
		                                    <th class="text-center">DreamEMS요금</th>
		                                    <th></th>
		                                 </tr>
		                            </thead>
                            		<tbody>
		                                <tr>
		                                	<td></td>
		                                	<td>1</td>
		                                	<td>2016-06-20</td>
		                                	<td><a href="#"><strong>EG710143161KR</strong></a></td>
		                                	<td>아무개</td>
		                                	<td>CN</td>
		                                	<td>19750g</td>
		                                	<td>83300원</td>
		                                	<td>64974원</td>
		                                    <td>
		                                        <button class="btn btn-info btn-sm"><i class="fa fa-pencil"></i></button>
		                                        <button class="btn btn-danger btn-sm"><i class="fa fa-trash-o "></i></button>
		                                        <div class="btn-group">
					                               <button type="button" class="btn btn-success dropdown-toggle btn-sm" data-toggle="dropdown"><i class="fa fa-print"></i><span class="caret"></span></button>
					                               <ul class="dropdown-menu dropdown-info" role="menu">
					                                   <li><a href="#">A4</a></li>
					                                   <li><a href="#">소형라벨</a></li>
					                               </ul>
					                           </div>
		                                    </td>
		                                </tr>
		                                <tr>
		                                	<td></td>
		                                	<td>2</td>
		                                	<td>2016-06-20</td>
		                                	<td><a href="#"><strong>EG71124213KR</strong></a></td>
		                                	<td>아무개</td>
		                                	<td>CN</td>
		                                	<td>12350g</td>
		                                	<td>2300원</td>
		                                	<td>14974원</td>
		                                    <td>
		                                        <button class="btn btn-info btn-sm"><i class="fa fa-pencil"></i></button>
		                                        <button class="btn btn-danger btn-sm"><i class="fa fa-trash-o "></i></button>
		                                        <div class="btn-group">
					                               <button type="button" class="btn btn-success dropdown-toggle btn-sm" data-toggle="dropdown"><i class="fa fa-print"></i><span class="caret"></span></button>
					                               <ul class="dropdown-menu dropdown-info" role="menu">
					                                   <li><a href="#">A4</a></li>
					                                   <li><a href="#">소형라벨</a></li>
					                               </ul>
					                           </div>
		                                    </td>
		                                </tr>
                            		</tbody>
	                        	</table>
	                        </div>
                   </div>
                </section>
                <!-- end:data -->
            </div>
        </div>
        <!-- end:file upload -->
</div>
<!-- end:main -->

    <!-- start:javascript for this page -->
    <script src="${pageContext.request.contextPath}/static/assets/dropzone/dropzone.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/bootstrap-fileupload/bootstrap-fileupload.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/assets/bootstrap-fileupload/bootstrap-fileupload.css">

</body>
</html>	