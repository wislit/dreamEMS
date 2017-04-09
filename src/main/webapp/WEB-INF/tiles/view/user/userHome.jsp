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
        <li class="active">사용자</li>
    </ol>
    <!-- end:breadcrumb -->   
    
    <!-- start:page header -->
    <div class="row">
        <div class="col-sm-12">
            <h3 class="page-header">
                	사용자관리
            	<a href="#myModal-1" data-toggle="modal" class="btn btn-warning">
                    <i class="fa fa-plus"></i> 사용자 등록
                </a>
                
                <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal-1" class="modal fade">
	                <div class="modal-dialog">
	                    <div class="modal-content">
	                        <div class="modal-header">
	                            <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
	                            <h4 class="modal-title">사용자 등록</h4>
	                        </div>
                            <form class="form-horizontal" role="form" id="registForm" onsubmit="false">
	                        <div class="modal-body">
                                <div class="form-group">
                                    <label for="inputId" class="col-sm-2 control-label">ID</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="inputId" placeholder="ID" name="id">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputPassword" class="col-sm-2 control-label">Password</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" id="inputPassword" placeholder="Password" name="password">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputName" class="col-sm-2 control-label">이름</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="inputName" placeholder="이름" name="username">
                                    </div>
                                </div>
                                <!-- <div class="form-group">
                                    <label class="col-sm-2 control-label">Phone</label>
                                    <div class="col-sm-10">
                                        <input type="text" placeholder="010-1234-5678" data-mask="999-9999-9999" class="form-control">
                                    </div>
                                </div> -->
	                        </div>
	                        <div class="modal-footer">
						        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						        <button type="button" class="btn btn-primary" id="test" >Sign in</button>
						      </div>
                            </form>
	                    </div>
	                </div>
	            </div>
            </h3>
        </div>
    </div>
    <!-- end:page header -->
    
    <!-- start:content panel -->
    <div class="row">
        <div class="col-sm-12">
            <div class="panel">
                <div class="panel-body">
                  <div class="tab-pane fade active in" id="beforePrint">  
              		<div class="adv-table">
                 			<table class="display table table-hover table-condensed text-center" id="example">
                       	<thead>
                             <tr>
                                <th class="text-center">No</th>
                                <th class="text-center">ID</th>
                                <th class="text-center">이름</th>
                                <th></th>
                             </tr>
                        </thead>
                      		<tbody>
                            <!-- <tr>
                            	<td>2</td>
                            	<td>2016-06-20</td>
                            	<td>아무개</td>
                                <td>
                                    <button class="btn btn-info btn-sm"><i class="fa fa-pencil"></i></button>
                                    <button class="btn btn-warning btn-sm"><i class="fa fa-unlock "></i></button>
                                    <button class="btn btn-danger btn-sm"><i class="fa fa-trash-o "></i></button>
                                </td>
                            </tr> -->
                      		</tbody>
                   	</table>
                   </div>
                  </div>
                </div><!-- /panel-body -->
            </div><!-- /panel -->
        </div><!-- /col-lg-12 -->
	</div><!-- /row -->
</div>

    <!-- start:javascript for this page -->
<%-- <script src="${pageContext.request.contextPath}/static/assets/advanced-datatable_old/media/js/jquery.dataTables.js"></script> --%>
<script src="${pageContext.request.contextPath}/static/assets/advanced-datatable/media/js/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/restful-client/jquery.rest.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/restful-client/RIP.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/data-tables/DT_bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
<script type="text/javascript" charset="utf-8"> 
    $(document).ready(function() {
    	
        $("#test").click(function() {
        	  $.create(
        			  '/user',
        			  JSON.stringify($("#registForm").serializeObject()),	
        			  function (reponse) {
        				  alert( i18n("msg."+reponse.code));
        			  },
        			  function (request,status,error){
        				  //alert("code:"+request.status+"\n"+"message:"+request.responseJSON.code);
        				  alert(i18n("error."+request.responseJSON.code) );
        			  });  
		});
        
        var btnStr = "<button class='btn btn-info btn-sm'><i class='fa fa-pencil'></i></button><span> </span>"
            +"<button class='btn btn-warning btn-sm'><i class='fa fa-unlock '></i></button><span> </span>"
            +"<button class='btn btn-danger btn-sm'><i class='fa fa-trash-o '></i></button>";
        
        var t = $('#example').DataTable({
        	ajax: {
        		url : "${pageContext.request.contextPath}/user", 
	        	dataSrc: ""
        	},
        	columns: [
        		{ data: null,
        			searchable: false,
                    orderable: false
        		},
                { data: "id" },
                { data: "username" },
                {
                    data: null,
                    defaultContent: btnStr,
                    searchable: false,
                    orderable: false,
                  }
            ],
            order: [[ 1, 'asc' ]]
        });
        
        t.on( 'order.dt search.dt', function () {
            t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
                cell.innerHTML = i+1;
            } );
        } ).draw();
       
        /* 
        
        success : function(data) {
    //  do something}
error: function (xhr, ajaxOptions, thrownError) {
    alert(xhr.status); //This will be 500
    alert(xhr.responseText); // your message
    //do stuff
  }
        */
    } );
</script>
    <!-- end:javascript for this page -->

</body>
</html>	