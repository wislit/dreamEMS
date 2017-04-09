<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<!-- start:main -->
<div class="container"> <!-- footer.jsp에 container </div> 있음 마지막에 닫는태스 안써도됨 -->
<div id="main">

    <!-- start:breadcrumb -->
    <ol class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li class="active">접수</li>
    </ol>
    <!-- end:breadcrumb -->   
    
    <!-- start:order button -->
     <div class="row">
     	<div class="col-lg-3"></div>
        <div class="col-lg-3">
        	<a class="btn btn-primary btn-block btn-lg" href="${pageContext.request.contextPath}/order" role="button" ><i class="fa fa-edit"></i> 일반접수</a>
        </div>
        <div class="col-lg-3">
        	<a class="btn btn-primary btn-block btn-lg" href="${pageContext.request.contextPath}/order/excel" role="button" ><i class="fa fa-file-excel-o"></i> 엑셀접수</a>
        </div>
        <div class="col-lg-3"></div>
    </div>
    <!-- end:order button -->
    
    <!-- start:page header -->
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">
                	접수목록
            </h3>
        </div>
    </div>
    <!-- end:page header -->
    
    <!-- start:content panel -->
    <div class="row">
        <div class="col-lg-12">
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
                    	
                    	<table id="eventsTable" class="table table-hover table-no-bordered"
						       data-toggle="table"
						       data-url="/static/data/order.json"
						       data-pagination="true"
						       data-search="true"
						       data-show-refresh="true"
						       data-show-pagination-switch="true"
						       data-show-columns="true"
						       data-toolbar="#toolbar">
						    <thead>
						    <tr>
						        <th data-field="status" data-checkbox="true"></th>
						        <th data-field="no">NO</th>
						        <th data-field="date">날짜</th>
						        <th data-field="invoice">송장</th>
						        <th data-field="name">받는사람</th>
						        <th data-field="state">국가</th>
						        <th data-field="weight">중량</th>
						        <th data-field="postFee">우체국요금</th>
						        <th data-field="emsFee">DreamEMS요금</th>
						        <th data-field="" data-formatter="functionFormatter"></th>
						    </tr>
						    </thead>
						</table>
                    	
                    	<!-- start:before print -->
                        <div class="tab-pane fade active in" id="beforePrint">  
	                   		<div class="">
	                   			총 4 건
	                   		</div>
	                   		<div class="adv-table">
                       			<table class="display table table-hover table-condensed text-center" id="example">
	                            	<thead>
		                                 <tr>
		                                 	<th class="text-center"><input type="checkbox"></th>
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
		                                	<td><input type="checkbox"></td>
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
		                                	<td><input type="checkbox"></td>
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
                        	픽업
                        </div>
                        <!-- end:pick up -->
                        
                    </div><!-- /tab-content -->
                </div><!-- /panel-body -->
            </div><!-- /panel -->
        </div><!-- /col-lg-12 -->
	</div><!-- /row -->
</div>
<!-- end:main -->


    <!-- start:javascript for this page -->
    <script src="${pageContext.request.contextPath}/static/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/owl.carousel.js" ></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.customSelect.min.js" ></script>
    <script src="${pageContext.request.contextPath}/static/js/sparkline-chart.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/easy-pie-chart.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/count.js"></script>
    <script>
        //owl carousel
        $(document).ready(function() {
            $("#owl-demo").owlCarousel({
                navigation : true,
                slideSpeed : 300,
                paginationSpeed : 400,
                singleItem : true,
                autoPlay:true
            });
        });

        //custom select box

        $(function(){
            $('select.styled').customSelect();
        });

        if ($(".custom-bar-chart")) {
        $(".bar").each(function () {
            var i = $(this).find(".value").html();
            $(this).find(".value").html("");
            $(this).find(".value").animate({
                height: i
            }, 2000)
        })
    }
    </script>
    
    <script>
    function functionFormatter(value, row) {
        //var icon = row.id % 2 === 0 ? 'glyphicon-star' : 'glyphicon-star-empty'
        //return '<i class="glyphicon ' + icon + '"></i> ' + value;
        return '<button class="btn btn-info btn-sm"><i class="fa fa-pencil"></i></button>'+
		        '<button class="btn btn-danger btn-sm"><i class="fa fa-trash-o "></i></button>'+
		        '<div class="btn-group">'+
		           '<button type="button" class="btn btn-success dropdown-toggle btn-sm" data-toggle="dropdown"><i class="fa fa-print"></i><span class="caret"></span></button>'+
		           '<ul class="dropdown-menu dropdown-info" role="menu">'+
		               '<li><a href="#">A4</a></li>'+
		               '<li><a href="#">소형라벨</a></li>'+
		           '</ul>'+
		      '</div>';
    }
    function priceFormatter(value) {
        // 16777215 == ffffff in decimal
        var color = '#'+Math.floor(Math.random() * 6777215).toString(16);
        return '<div  style="color: ' + color + '">' +
                '<i class="glyphicon glyphicon-usd"></i>' +
                value.substring(1) +
                '</div>';
    }
</script>
    <!-- end:javascript for this page -->

</body>
</html>	