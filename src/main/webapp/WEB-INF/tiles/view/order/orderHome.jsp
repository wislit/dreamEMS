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
        <li class="active">접수</li>
    </ol>
    <!-- end:breadcrumb -->   
    
    <!-- start:order button -->
     <div class="row">
        <div class="col-sm-3 col-sm-offset-3">
        	<a class="btn btn-primary btn-block btn-lg" href="${pageContext.request.contextPath}/order" role="button" ><i class="fa fa-edit"></i> 일반접수</a>
        </div>
        <div class="col-sm-3">
        	<a class="btn btn-primary btn-block btn-lg" href="${pageContext.request.contextPath}/order/excel" role="button" ><i class="fa fa-file-excel-o"></i> 엑셀접수</a>
        </div>
    </div>
    <!-- end:order button -->
    
    <!-- start:page header -->
    <div class="row">
        <div class="col-sm-12">
            <h3 class="page-header">
                	접수목록
            </h3>
        </div>
    </div>
    <!-- end:page header -->
    
    <!-- start:content panel -->
    <div class="row">
        <div class="col-sm-12">
            <div class="panel">
                <div class="panel-body">
                	<!-- start:tab nav -->
                    <ul id="orderTab" class="nav nav-tabs">
                        <li class="active"><a href="#beforePrint" data-toggle="tab">미출력 <span class="badge bg-important">14</span></a></li>
                        <li class=""><a href="#afterPrint" data-toggle="tab">기출력</a></li>
                        <li class=""><a href="#pickUp" data-toggle="tab">픽업목록</a></li>
                        <li class="" style="float:right">
                        	<div class="btn-group">
                       			<button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown"><i class="fa fa-print"></i> 일괄출력 <span class="caret"></span></button>
			                       <ul class="dropdown-menu dropdown-success" role="menu">
			                           <li><a href="#">A4</a></li>
			                           <li><a href="#">소형라벨</a></li>
			                       </ul>
                  			 </div><!-- /btn-group -->
                        </li>
                    </ul>
                    <!-- end:tab nav -->
                    
                    <div id="orderTabContent" class="tab-content">
                    	<!-- start:before print -->
                        <div class="tab-pane fade active in" id="beforePrint">  
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
                         <!-- end:before print -->
                         
                         <!-- start:after print -->
                        <div class="tab-pane fade" id="afterPrint">
                   			기출력        	
                        </div>
                        <!-- end:after print -->
                        
                        <!-- start:pick up -->
                        <div class="tab-pane fade" id="pickUp">
                        	픽업d
                        </div>
                        <!-- end:pick up -->
                        
                    </div><!-- /tab-content -->
                </div><!-- /panel-body -->
            </div><!-- /panel -->
        </div><!-- /col-lg-12 -->
	</div><!-- /row -->
</div>

    <!-- start:javascript for this page -->
<%-- <script src="${pageContext.request.contextPath}/static/assets/advanced-datatable_old/media/js/jquery.dataTables.js"></script> --%>
<script src="${pageContext.request.contextPath}/static/assets/advanced-datatable/media/js/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/data-tables/DT_bootstrap.js"></script>
<script type="text/javascript" charset="utf-8"> 
    $(document).ready(function() {
    	// Array holding selected row IDs
    	var rows_selected = [];
        var table = $('#example').DataTable( {
        	filter:false,
        	ordering: false,
        	columnDefs: [ {
                orderable: false,
                className: 'select-checkbox',
                targets:   0,
                render: function (data, type, full, meta){
                    return '<input type="checkbox">';
                }
            } ]
        } );
        
     	// Handle click on "Select all" control
        $('#example-select-all').on('click', function(){
           // Get all rows with search applied
           var rows = table.rows({ 'search': 'applied' }).nodes();
           // Check/uncheck checkboxes for all rows in the table
           $('input[type="checkbox"]', rows).prop('checked', this.checked);
        });

    	/* 체크된 데이터 얻는방법?
    	// Handle form submission event
        $('#frm-example').on('submit', function(e){
           var form = this;

           // Iterate over all checkboxes in the table
           table.$('input[type="checkbox"]').each(function(){
              // If checkbox doesn't exist in DOM
              if(!$.contains(document, this)){
                 // If checkbox is checked
                 if(this.checked){
                    // Create a hidden element 
                    $(form).append(
                       $('<input>')
                          .attr('type', 'hidden')
                          .attr('name', this.name)
                          .val(this.value)
                    );
                 }
              } 
           });
        });
        var data = table.$('input[type="checkbox"]').serialize(); */
    } );
</script>
    <!-- end:javascript for this page -->

</body>
</html>	