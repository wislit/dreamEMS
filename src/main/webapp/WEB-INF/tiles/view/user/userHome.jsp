<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<!-- start:main -->
<div class="container"> <!-- footer.jsp에 container </div> 있음 마지막에 닫는태그 안써도됨 -->
<div id="main">

    <!-- start:breadcrumb -->
    <%-- <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/">Home</a></li>
        <li class="active">사용자</li>
    </ol> --%>
    <!-- end:breadcrumb -->   
    
    <!-- start:page header -->
    <div class="row">
        <div class="col-sm-12">
            <h3 class="page-header"> 
                	사용자관리
            	<button id="btn-create" href="#user-modal" data-toggle="modal" class="btn btn-warning">
                    <i class="fa fa-plus"></i> 사용자 등록
                </button>
                
                <div aria-hidden="true" role="dialog" tabindex="-1" id="user-modal" class="modal fade">
	                <div class="modal-dialog">
	                    <div class="modal-content">
	                        <div class="modal-header">
	                            <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
	                            <h4 class="modal-title">사용자 등록</h4>
	                        </div>
                            <form class="form-horizontal" role="form" id="user-form" onsubmit="false">
	                        <div class="modal-body">
                                <div class="form-group">
                                    <label for="inputId" class="col-sm-3 control-label">ID</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="inputId" placeholder="ID" name="id">
                                        <input type="hidden" name="no"> 
                                    </div>
                                </div>
                                <div class="form-group" id="div-password">
                                    <label for="inputPassword" class="col-sm-3 control-label">Password</label>
                                    <div class="col-sm-9">
                                        <input type="password" class="form-control" id="inputPassword" placeholder="Password" name="password">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputUsername" class="col-sm-3 control-label">이름</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="inputUsername" placeholder="이름" name="username">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputSender" class="col-sm-3 control-label">발송인</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="inputSender" placeholder="발송인명" name="sender">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputSenderZipCode" class="col-sm-3 control-label">우편번호</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="inputSenderZipCode" name="senderZipCode" disabled>
                                    </div>
                                    <div class="col-sm-3">
                                        <a href="javascript:;" onclick="execDaumPostcode();" class="btn btn-default">우편번호 찾기</a>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputSenderAddr2" class="col-sm-3 control-label">주소</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="inputSenderAddr2" name="senderAddr2" disabled>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputSenderAddr1" class="col-sm-3 control-label">상세주소</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="inputSenderAddr1" placeholder="상세주소" name="senderAddr1">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputSenderTelNo" class="col-sm-3 control-label">발송인 연락처</label>
                                    <div class="col-sm-9">
                                        <input type="text" placeholder="010-1234-5678" data-mask="999-9999-9999" class="form-control" name="senderTelNo">
                                    </div>
                                </div>
	                        </div>
	                        <div class="modal-footer">
						        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						        <button type="button" class="btn btn-primary" id="btn-signin" >Sign in</button>
						        <button type="button" class="btn btn-primary" id="btn-update" >수정</button>
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
                 			<table class="display table table-hover table-condensed text-center" id="tb-user">
                       	<thead>
                             <tr>
                                <th class="text-center">No</th>
                                <th class="text-center">ID</th>
                                <th class="text-center">이름</th>
                                <th class="text-center">발송인</th>
                                <th class="text-center">우편번호</th>
                                <th class="text-center">주소</th>
                                <th class="text-center">상세주소</th>
                                <th class="text-center">연락처</th>
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" charset="utf-8"> 

//DAUM 주소 api
function execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			console.log(data);
			console.log(data['addressEnglish']);
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullAddr = ''; // 최종 주소 변수
			var extraAddr = ''; // 조합형 주소 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				fullAddr = data.roadAddress;

			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				fullAddr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			if(data.userSelectedType === 'R'){
				//법정동명이 있을 경우 추가한다.
				if(data.bname !== ''){
					extraAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if(data.buildingName !== ''){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			//document.getElementById('senderzipcode').disabled = false;
			document.getElementById('inputSenderZipCode').value = data.zonecode; //5자리 새우편번호 사용
			//document.getElementById('inputSenderAddr2').value = fullAddr;
			document.getElementById('inputSenderAddr2').value = data['addressEnglish'];

			// 스타일 변경
			$('#p_post, #p_address').removeClass('warning');

			// 커서를 상세주소 필드로 이동한다.
			document.getElementById('inputSenderAddr1').focus(); 
		}
	}).open();
}

    $(document).ready(function() {
        
        var btnStr = "<button href='#user-modal' data-toggle='modal' class='btn btn-info btn-sm edit'><i class='fa fa-pencil'></i></button><span> </span>"
            +"<button class='btn btn-warning btn-sm reset'><i class='fa fa-unlock '></i></button><span> </span>"
            +"<button class='btn btn-danger btn-sm delete'><i class='fa fa-trash-o '></i></button>";
        
        var t = $('#tb-user').DataTable({
        	language: {
                 url: "//cdn.datatables.net/plug-ins/1.10.15/i18n/Korean.json"
                 /* //cdn.datatables.net/plug-ins/1.10.15/i18n/Chinese.json */
                 /* //cdn.datatables.net/plug-ins/1.10.15/i18n/English.json */
        	},
        	ajax: {
        		url : "${pageContext.request.contextPath}/user", 
	        	dataSrc: ""
        	},
        	columns: [
        		{ data: null,
        			searchable: false,
                    orderable: false,
                    width : "10px"
                    
        		},
                { data: "id", width : "100px" },
                { data: "username", width : "100px" },
                { data: "sender", width : "100px", orderable: false  },
                { data: "senderZipCode", width : "80px", orderable: false  },
                { data: "senderAddr2", width : "", orderable: false  },
                { data: "senderAddr1", width : "", orderable: false },
                { data: "senderTelNo", width : "130px", orderable: false },
                {
                    data: null,
                    defaultContent: btnStr,
                    searchable: false,
                    orderable: false,
                    width : "120px"
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
        $("#btn-create").click(function() {
        	$("#user-form")[0].reset();
        	 $("#div-password").show();
        	 $("#user-form input[name=id]").removeAttr("disabled");
        	 $("#btn-signin").show();
        	 $("#btn-update").hide();
		});
      	
      	$("#btn-signin").click(function() {
      		$("#user-form :disabled").removeAttr('disabled')
        	 var create = $.create('/user', JSON.stringify($("#user-form").serializeObject()) );
        	 create.then(ajaxSuccess, ajaxError);
        	 $("#user-form input[name=senderZipCode]").attr("disabled", "true");
        	 $("#user-form input[name=senderAddr2]").attr("disabled", "true");
		});
      	
        $("#btn-update").click(function() {
        	$("#user-form :disabled").removeAttr('disabled')
       	 	var update = $.update('/user/'+ $("#user-form input[name=no]").val() , JSON.stringify($("#user-form").serializeObject()) );
       		update.then(ajaxSuccess, ajaxError);
       		$("#user-form input[name=senderZipCode]").attr("disabled", "true");
       	 	$("#user-form input[name=senderAddr2]").attr("disabled", "true");
		});
        
        $('#tb-user tbody').on('click', 'tr .edit', function () {
            var data = t.row( this.parentNode.parentNode ).data();
            $("#user-form input[name=no]").val(data.no)
            $("#user-form input[name=id]").val(data.id)
            $("#user-form input[name=username]").val(data.username)
            $("#user-form input[name=sender]").val(data.sender)
            $("#user-form input[name=senderZipCode]").val(data.senderZipCode)
            $("#user-form input[name=senderAddr1]").val(data.senderAddr1)
            $("#user-form input[name=senderAddr2]").val(data.senderAddr2)
            $("#user-form input[name=senderTelNo]").val(data.senderTelNo)
            $("#user-form input[name=id]").attr("disabled", "true");
            $("#div-password").hide();
            $("#btn-signin").hide();
       		$("#btn-update").show();
        } );
        
        //비밀번호 변경
        $('#tb-user tbody').on('click', 'tr .reset', function () {
            var data = t.row( this.parentNode.parentNode ).data();
            
            $.confirm({
                content: '' +
                '<form action="" class="formName">' +
                '<div class="form-group">' +
                '<label>초기화 비밀번호를 입력하세요</label>' +
                '<input type="text" placeholder="password" class="form-control" required />' +
                '</div>' +
                '</form>',
                buttons: {
                    formSubmit: {
                        text: 'Submit',
                        btnClass: 'btn-warning',
                        action: function () {
                            var password = this.$content.find(':text').val();
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
         
        $('#tb-user tbody').on('click', 'tr .delete', function () {
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