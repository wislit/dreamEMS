<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>

.tb-excel > tbody > tr > td{padding: 3px 15px; font-size: 12px; line-height: 1.2;}

#excel_container {
		border: 1px solid #C3C3C3;
		height: 360px;
		position: relative;
		overflow: scroll;
	}
.item-warning{background: rgb(254, 221, 219); color: #FF0000;}
/* table.tb-excel{border: 0px; position: absolute; left: -2px;} */
</style>
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
				                        <li>엑셀양식을 다운로드 받아 작성해 주시기 바랍니다
				                         	<a class="btn btn-info btn-sm" href="${pageContext.request.contextPath}/download/dreamEMS_template" role="button" ><i class="fa fa-download"></i> ems간편 템플릿 </a>
				                         	<%-- <a class="btn btn-info btn-sm" href="${pageContext.request.contextPath}/download/ems_template" role="button" ><i class="fa fa-download"></i> 기존 우체국용 템플릿</a> <span class="label label-warning">추천</span>--%>
				                         	</li>
				                         <li>비서류 일반EMS 배송헤대해 대량접수가 가능합니다</li>
				                         <li>EMS 프리미엄 배송을 원하실 경우 사무실로 연락주시기 바랍니다.</li>
				                    </ul>
				            </div>
				        </div>
				        <!-- end:excel download info -->
				        		 <div class="alert alert-info alert-outline alert-dismissable" style="height: 70px; margin-top: 20px;">
			                          <form class="" role="form" enctype="multipart/form-data" method="post" 
                               				 id="excelUploadForm" name="excelUploadForm"
                               				 action= "${pageContext.request.contextPath}/order/excelUpload"> 
                    							<div class="col-sm-8">
	                    							<div class="fileupload fileupload-new" data-provides="fileupload">
			                                             <span class="btn btn-info btn-file" >
			                                             <span class="fileupload-new"><i class="fa fa-paperclip" style="color: white;"></i> Select file</span>
			                                             <span class="fileupload-exists"><i class="fa fa-undo"  style="color: white;"></i> Change</span>
			                                             <input type="file" class="default" id="excelFile" name="excelFile" />
			                                             </span>
			                                                 <span class="fileupload-preview" style="margin-left:5px;"></span>
			                                                 <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
				                                    </div> 
                    							</div>
			                                    <div class="col-sm-3">
			                                 	 <button class="btn btn-block btn-success" type="button" onclick="check()" ><i class="fa fa-upload"  style="color: white;"></i> 업로드</button>
			                                    </div>
			                     		 </form>
			                      </div>
                   </div>
                </section>
                <!-- end:info -->
                
                <!-- start:data -->
                <section class="panel">
                    <div class="panel-body">
                    		<table class="table table-bordered table-condensed tb-excel" id="example">
	                            	<thead>
		                                 <tr>
		                                 	<th class="text-center"><input id="example-select-all" type="checkbox"></th>
		                                    <th class="text-center">No.</th>
		                                    <th class="text-center">상품구분</th>
		                                    <th class="text-center">수취인명</th>
		                                    <th class="text-center">수취인 연락처</th>
		                                    <th class="text-center">수취인 국가코드</th>
		                                    <th class="text-center">수취인 우편번호</th>
		                                    <th class="text-center">수취인 주소</th>
		                                    <th class="text-center">총중량</th>
		                                    <th class="text-center">내용품명</th>
		                                    <th class="text-center">내용품 1개당가격</th>
		                                    <th class="text-center">개수</th>
		                                    <th class="text-center">HSCODE</th>
		                                    <th class="text-center">주문인 우편번호</th>
		                                    <th class="text-center">주문인 주소</th>
		                                    <th class="text-center">주문인명</th>
		                                    <th class="text-center">주문인 연락처</th>
		                                 </tr>
		                            </thead>
                            		<tbody>
                            		</tbody>
	                        	</table>
                   </div>
                   <div class="row">
            			<div class="col-sm-4 col-sm-offset-4">
				        	<a class="btn btn-primary btn-block btn-lg" href="${pageContext.request.contextPath}/order" role="button" >엑셀 접수</a>
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

<script type="text/javascript">
function checkFileType(filePath) {
    var fileFormat = filePath.split(".");
    if (fileFormat.indexOf("xlsx") > -1) {
        return true;
    } else {
        return false;
    }

}

function check() {
    var file = $("#excelFile").val();
    if (file == "" || file == null) {
        alert("파일을 선택해주세요.");
        return false;
    } else if (!checkFileType(file)) {
        alert("엑셀 파일만 업로드 가능합니다.");
        return false;
    }

    if (confirm("업로드 하시겠습니까?")) {
    	
    	//var form = $('#excelUploadForm')[0];
        //var formData = new FormData(form);
        var formData =  new FormData($('#excelUploadForm')[0]);
        //formData.append("fileObj", $("#excelFile")[0].files[0]);
        
        $.ajax({
            	url: '/order/excelUpload',
                processData: false,
                contentType: false,
                data: formData,
                type: 'POST',
                success: function(data) {
                    drawEMSExcelTable(data);
                }
            });

    }
}

function checkErrorCell(td, cellData, rowData, row, col, item){
	if(rowData.errorList[item]){
        $(td).addClass("item-warning");
        $(td).attr("contenteditable", true);
	} 
}

function drawEMSExcelTable(data) {
	
	var t = $('#example').DataTable({
		destroy: true,
		/* scrollY:        "500px",
        scrollX:        true, */
        /* scrollCollapse: true, */
        paging:         false,
		filter:false,
    	ordering: false,
    	columnDefs: [ {
            className: 'select-checkbox',
            targets:   0,
            render: function (data, type, full, meta){
                return '<input type="checkbox">';
            }
        }
        ],
		data: data,
    	columns: [
    		{ data: null},
    		{ data: null, sortable: false},
            { data: "emGubun",
            	createdCell: function (td, cellData, rowData, row, col) {
            		checkErrorCell(td, cellData, rowData, row, col, "emGubun");
            	}
    		},
            { data: "receiveName",
            	createdCell: function (td, cellData, rowData, row, col) {
            		checkErrorCell(td, cellData, rowData, row, col, "receiveName");
            	}
    		},
            { data: "receiveTelNo",
            	createdCell: function (td, cellData, rowData, row, col) {
            		checkErrorCell(td, cellData, rowData, row, col, "receiveTelNo");
            	}
    		 },
            { data: "countryCd",
            	createdCell: function (td, cellData, rowData, row, col) {
            		checkErrorCell(td, cellData, rowData, row, col, "countryCd");
            	}
    		 },
            { data: "receiveZipCode",
            	createdCell: function (td, cellData, rowData, row, col) {
            		checkErrorCell(td, cellData, rowData, row, col, "receiveZipCode");
            	}
    		 },
            { data: "receiveAddr3",
            	createdCell: function (td, cellData, rowData, row, col) {
            		checkErrorCell(td, cellData, rowData, row, col, "receiveAddr3");
            	}
    		 },
            { data: "totWeight",
            	createdCell: function (td, cellData, rowData, row, col) {
            		checkErrorCell(td, cellData, rowData, row, col, "totWeight");
            	}
    		 },
            { data: "contents" ,
            	createdCell: function (td, cellData, rowData, row, col) {
            		checkErrorCell(td, cellData, rowData, row, col, "contents");
            	}
    		},
            { data: "value" ,
            	createdCell: function (td, cellData, rowData, row, col) {
            		checkErrorCell(td, cellData, rowData, row, col, "value");
            	}
    		},
            { data: "number" ,
            	createdCell: function (td, cellData, rowData, row, col) {
            		checkErrorCell(td, cellData, rowData, row, col, "number");
            	}
    		},
            { data: "hsCode" ,
            	createdCell: function (td, cellData, rowData, row, col) {
            		checkErrorCell(td, cellData, rowData, row, col, "hsCode");
            	}
    		},
            { data: "orderPrsnZipCd",
            	createdCell: function (td, cellData, rowData, row, col) {
            		checkErrorCell(td, cellData, rowData, row, col, "orderPrsnZipCd");
            	}
    		 },
            { data: "orderPrsnAddr2",
            	createdCell: function (td, cellData, rowData, row, col) {
            		checkErrorCell(td, cellData, rowData, row, col, "orderPrsnAddr2");
            	}
    		 },
            { data: "orderPrsnNm" ,
            	createdCell: function (td, cellData, rowData, row, col) {
            		checkErrorCell(td, cellData, rowData, row, col, "orderPrsnNm");
            	}
    		},
            { data: "orderPrsnTelNo" ,
            	createdCell: function (td, cellData, rowData, row, col) {
            		checkErrorCell(td, cellData, rowData, row, col, "orderPrsnTelNo");
            	}
    		}
        ]
    });
	
	t.on( 'draw.dt', function ( e, settings ) {
		$("[contenteditable=true]").on("focusout", function(){
			 var cell = $(this);
			 var cell2 = t.cell(this).node();
			 var value = this.textContent;
			 var propertyName = t.columns(this).dataSrc()[0];
			 
			 var data = {};
			 data[propertyName] = value;
			 data["property"] = propertyName;
			 
			 $.ajax({
	            	url: '/order/validate',
	                data: data ,
	                type: 'POST',
	                success: function(data) {
	                    if(!data){
	                    	cell.removeClass("item-warning");
	                    	cell.attr("contenteditable", false);
	                    }
	                }
	            });
        });
	} );
	
	
    t.on(  'draw.dt', function () {
        t.column(1, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
    } ).draw();
}

$(document).ready(function() {
	
	var rows_selected = [];
	$('#example-select-all').on('click', function(){
        // Get all rows with search applied
        var rows = $('#example').DataTable().rows({ 'search': 'applied' }).nodes();
        // Check/uncheck checkboxes for all rows in the table
        $('input[type="checkbox"]', rows).prop('checked', this.checked);
     });
	
	/* 
	// 접수
	var prevent_submit = false;
	$(document).on('click', '#btn_submit_order', function(){

		if ($(this).hasClass('disabled')) return false;

		var submit_check = [];
		$(".submit_check:checked").each(function() {
			submit_check.push(this.value);
		});

		var data = {'excelData': excelData, 'submit_check': submit_check};
		console.log(data);
		if(!prevent_submit) {
			prevent_submit = true;
			$.ajax({
				url: __HOST__ + "/api/v1/order/new/excel_order/type/" + excelType,
				type: "POST",
				data: JSON.stringify(data),
				headers: {"Authorization": getCookieByName("coo_wizboard_user_token")},
				dataType: 'json',
				success: function (ret) {
					console.log(ret);
					if (ret.type == "SUCC_SUBMIT") {
						alert_modal(ret.count + " 건 접수되었습니다.", function() {
							location.reload();
							prevent_submit = false;
						});
					}
				},
				error: function (response) {
					prevent_submit = false;
					console.log("ERROR", response.responseText);
				},
				beforeSend: function () {
					var loading_span = '<span id="loading_span" style="top:150px; left: 50%; font-size: 30px;"><i class="fa fa-spinner fa-pulse"></i></span>';
					$('#excel_container').append(loading_span);
				},
				complete: function () {
					if ($('#loading_span').length != 0)
						$('#loading_span').fadeOut(100).remove();
				}
			});
		}
	});
	
	*/
	
} );	
</script>

</body>
</html>	