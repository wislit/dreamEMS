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
        <li class="active">요금표</li>
    </ol>
    <!-- end:breadcrumb -->   

    <!-- start:page header -->    
     <div class="row">
        <div class="col-sm-12">
            <h3 class="page-header">
                	국가별 배송요금 조회
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
        					<div class="col-sm-3 col-sm-offset-1">
	        					<div class="btn-group">
	                                <button type="button" class="btn btn-info active" >EMS 일반</button>
	                                <button type="button" class="btn btn-info">EMS 프리미엄</button>
	                            </div>
                            </div>
                            <div class="col-sm-5">
	                            <div class="form-group">
	                            	<label class="control-label col-sm-1">국가</label>
	                            	<div class="col-sm-5">
			                            <select class="form-control">
		                                     <option>w34kuwlfjas;ldjasasdasfdasdas;flajw;dqewwqrof</option>
		                                     <option>2</option>
		                                     <option>3</option>
		                                     <option>4</option>
		                                     <option>5</option>
			                            </select>
	                            	</div>
	                            </div>
	                        </div>
	                        <div class="col-sm-3">
			                      	<label class="control-label">무게</label>
	                            <div class="input-group col-sm-7">
	                                <input type="text" class="form-control">
	                                <span class="input-group-addon input-group-addon-default">g</span>
	                            </div>
			                   <div class="form-group">
	                         		<button type="button" class="btn btn-info">검색</button>
	                         	</div>
		                   </div>
        				</div>
                    </form>
             	</div>
             	<!-- end:search well -->
             	
             	<!-- start:table -->
             	<div class="col-sm-8 div-test">
             		<div class="col-sm-12 div-test">
             			<div class="col-sm-4">
							<h4><span class="label label-primary">최대규격</span></h4>
						</div>
             			<div class="col-sm-8">sfwdawdawdaw</div>
             		</div>
             		<div class="col-sm-12 div-test">
             			<div class="col-sm-4">
							<h4><span class="label label-primary">최대중량</span></h4>
						</div>
             			<div class="col-sm-8">wafawdawdawdawd</div>
             		</div>
             		<div class="col-sm-6 div-test">
             			<table  class="display table table-hover table-condensed text-center" id="example">
		                  <thead>
		                  <tr>
		                      <th class="text-center">무게</th>
		                      <th class="text-center">우체국요금</th>
		                  </tr>
		                  </thead>
		                  <tbody>
		                  </tbody>
		      			</table>
             		</div>
             		<div class="col-sm-6 div-test">
             			<table  class="display table table-hover table-condensed text-center" id="example">
		                  <thead>
		                  <tr>
		                      <th class="text-center">무게</th>
		                      <th class="text-center">우체국요금</th>
		                  </tr>
		                  </thead>
		                  <tbody>
		                  </tbody>
		      			</table>
             		</div>
             	
             	</div>
             	<div class="col-sm-4 div-test">
             		<img alt="" src="${pageContext.request.contextPath}/static/img/EMS_example.png">
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