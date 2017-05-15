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
                                <div class="form-group">
                                    <label for="inputName" class="col-sm-2 control-label">발송인</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="inputName" placeholder="이름" name="username">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputName" class="col-sm-2 control-label">우편번호</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="inputName" placeholder="이름" name="username">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputName" class="col-sm-2 control-label">주소</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="inputName" placeholder="이름" name="username">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputName" class="col-sm-2 control-label">주소상세</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="inputName" placeholder="이름" name="username">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">발송인 연락처</label>
                                    <div class="col-sm-10">
                                        <input type="text" placeholder="010-1234-5678" data-mask="999-9999-9999" class="form-control">
                                    </div>
                                </div>
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
                      		</tbody>
                   	</table>
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
        
        var btnStr = "<button class='btn btn-info btn-sm edit'><i class='fa fa-pencil'></i></button><span> </span>"
            +"<button class='btn btn-warning btn-sm reset'><i class='fa fa-unlock '></i></button><span> </span>"
            +"<button class='btn btn-danger btn-sm delete'><i class='fa fa-trash-o '></i></button>";
        
        var t = $('#example').DataTable({
        	ajax: {
        		url : "${pageContext.request.contextPath}/user", 
	        	dataSrc: ""
        	},
        	columns: [
        		{ data: null,
        			searchable: false,
                    orderable: false,
                    width: "10%" 
        		},
                { data: "id" ,  width: "20%" },
                { data: "username",  width: "50%" },
                {
                    data: null,
                    defaultContent: btnStr,
                    searchable: false,
                    orderable: false,
                    width: "20%"
                  }
            ],
            order: [[ 1, 'asc' ]]
        });
        
        t.on( 'order.dt search.dt', function () {
            t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
                cell.innerHTML = i+1;
            } );
        } ).draw();
        
        
      	//https://craftpip.github.io/jquery-confirm/#callbacks
      	//https://github.com/alassek/jquery.rest
        $("#test").click(function() {
        	 var create = $.create('/user', JSON.stringify($("#registForm").serializeObject()) );
        	 create.then(ajaxSuccess, ajaxError);
		});
        
        $('#example tbody').on('click', 'tr .edit', function () {
            var data = t.row( this.parentNode.parentNode ).data();
            alert( 'You clicked on '+data.no+'\'s row' );
        } );
        
        $('#example tbody').on('click', 'tr .reset', function () {
            var data = t.row( this.parentNode.parentNode ).data();
            
            $.confirm({
                content: '' +
                '<form action="" class="formName">' +
                '<div class="form-group">' +
                '<label>초기화 비밀번호를 입력하세요</label>' +
                '<input type="text" placeholder="password" class="name form-control" required />' +
                '</div>' +
                '</form>',
                buttons: {
                    formSubmit: {
                        text: 'Submit',
                        btnClass: 'btn-warning',
                        action: function () {
                            var password = this.$content.find('.name').val();
                            if(!password){
                                $.alert('provide a valid name');
                                return false;
                            }
                            var create = $.create('/user/resetPwd', JSON.stringify({ "no": data.no , "password": password}) );
                       	 	create.then(ajaxSuccess, ajaxError);
                        }
                    },
                    cancel: function () {
                        //close
                    },
                },
                onContentReady: function () {
                    // bind to events
                    var jc = this;
                    this.$content.find('form').on('submit', function (e) {
                        // if the user submits the form by pressing enter in the field.
                        e.preventDefault();
                        jc.$$formSubmit.trigger('click'); // reference the button and click it
                    });
                }
            });
        } );
         
        $('#example tbody').on('click', 'tr .delete', function () {
            var data = t.row( this.parentNode.parentNode ).data();
            $.confirm({
				    content:  "<label>사용자를 삭제하시겠습니까?</label>",
				    buttons: {
					    confirm : {
					    	btnClass: 'btn-danger',
					    	action : function () {
						    	var destroy = $.destroy('/user/'+data.no);
						    	destroy.then(ajaxSuccess, ajaxError);
					        } 
					    }, 
				        cancel: function () {
				        }
				    }
				});
        } );
        
       
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