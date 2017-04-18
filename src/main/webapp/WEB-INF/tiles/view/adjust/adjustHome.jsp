<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<!-- start:main -->
<div class="container"><!-- footer.jsp에 container </div> 있음 마지막에 닫는태그 안써도됨 -->
<div id="main">
    
    <!-- start:breadcrumb -->
    <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/">Home</a></li>
        <li class="active">조정처리</li>
    </ol>
    <!-- end:breadcrumb -->   

    <!-- start:page header -->    
     <div class="row">
        <div class="col-sm-12">
            <h3 class="page-header">
                	조정 처리 내역
            </h3>
        </div>
    </div>
    <!-- end:page header -->
    
    <!-- start:content panel -->
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
             	
             	<!-- start:table -->
                <div class="adv-table">
                    <table  class="display table table-hover table-condensed text-center" id="example">
                      <thead>
                      <tr>
                          <th class="text-center">처리일</th>
                          <th class="text-center">접수일</th>
                          <th class="text-center">송장번호</th>
                          <th class="text-center">조정사유</th>
                          <th class="text-center">우체국요금</th>
                          <th class="text-center">DreamEMS요금</th>
                          <th class="text-center">DreamEMS요금</th>
                          <th class="text-center">정당요금</th>
                          <th class="text-center">차액</th>
                          <th class="text-center">할인율</th>
                          <th class="text-center">요금</th>
                      </tr>
                      </thead>
                      <tbody>
                      </tbody>
          			</table>
                </div>
                <!-- end:table -->
                
              </div>
          </section>
      </div>
  </div>
</div>
<!-- end:main -->

<!-- start:javascript for this page -->
<script src="${pageContext.request.contextPath}/static/assets/advanced-datatable/media/js/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/data-tables/DT_bootstrap.js"></script>
<script type="text/javascript" charset="utf-8">
//var t = $('#example').DataTable({});
</script>

<!-- javascript for this page -->
<!-- bootstrap date picker -->
<script src="${pageContext.request.contextPath}/static/assets/datepicker/js/bootstrap-datepicker.js"></script>

<script type="text/javascript">
 $(document).ready(function() {
 		$('#dp1,#dp2').datepicker({});

var nowTemp = new Date();
      var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

 });
 
 </script>
<!-- end:javascript for this page -->

</body>
</html>	