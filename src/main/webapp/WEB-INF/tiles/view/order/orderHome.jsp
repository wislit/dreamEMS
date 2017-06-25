<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/print.css" />
<body>
<!-- start:main -->
<div class="container"> <!-- footer.jsp에 container </div> 있음 마지막에 닫는태그 안써도됨 -->
<div id="main">

    <!-- start:breadcrumb -->
    <%-- <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/">Home</a></li>
        <li class="active">접수</li>
    </ol> --%>
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
                        <li class=""><a href="#beforePrint" data-toggle="tab">미출력<!-- <span class="badge bg-important">14</span> --></a></li>
                        <li class=""><a href="#afterPrint" data-toggle="tab">기출력</a></li>
                        <!-- <li class=""><a href="#pickUp" data-toggle="tab">픽업목록</a></li> -->
                        <li class="" style="float:right">
                        	<div class="btn-group">
                       			<button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown"><i class="fa fa-print"></i> 일괄출력 <span class="caret"></span></button>
			                       <ul class="dropdown-menu dropdown-success" role="menu">
			                           <li onclick='printAll(false,"A4")'><a href="#">A4</a></li>
			                           <li onclick='printAll(true,"label")'><a href="#">소형라벨</a></li>
			                       </ul>
                  			 </div><!-- /btn-group -->
                        </li>
                    </ul>
                    <!-- end:tab nav -->
                    
                    <div id="orderTabContent" class="tab-content">
                    	<!-- start:before print -->
                        <div class="tab-pane fade active in" id="beforePrint">  
	                   		<div class="adv-table">
                       			<table class="display table table-hover table-condensed text-center" id="orderList">
	                            	<thead>
		                                 <tr>
		                                 	<th class="text-center"><input class="example-select-all" type="checkbox"></th>
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
                            		</tbody>
	                        	</table>
	                        </div>
                        </div>
                         <!-- end:before print -->
                         
                         <!-- start:after print -->
                        <div class="tab-pane fade" id="afterPrint">
                   			<div class="adv-table">
                       			<table class="display table table-hover table-condensed text-center" id="printList">
	                            	<thead>
		                                 <tr>
		                                 	<th class="text-center"><input class="example-select-all" type="checkbox"></th>
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
                            		</tbody>
	                        	</table>
	                        </div>        	
                        </div>
                        <!-- end:after print -->
                        
                        <!-- start:pick up -->
                        <!-- <div class="tab-pane fade" id="pickUp">
                        	픽업d
                        </div> -->
                        <!-- end:pick up -->
                        
                    </div><!-- /tab-content -->
                </div><!-- /panel-body -->
            </div><!-- /panel -->
        </div><!-- /col-lg-12 -->
	</div><!-- /row -->
</div>

<div aria-hidden="true" role="dialog" tabindex="-1" id="user-modal" class="modal fade">
  <div class="modal-dialog modal-lg">
      <div class="modal-content">
          <div class="modal-header">
              <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
              <h6 class="modal-title">&nbsp;</h6>
          </div>
          <div class="modal-body print">
          	<div class="div-a4 default1">
				<table class="tb-print3">
				<colgroup>
					<col style="width:3.5%;"/>
					<col style="width:8.5%;"/>
					<col style="width:17.3%;"/>
					<col style="width:6%;"/>
					<col style="width:6%;"/>
					<col style="width:6.8%;"/>
					<col style="width:3.5%;"/>
					<col style="width:3.7%;"/>
					<col style="width:7.4%;"/>
					<col style="width:14%;"/>
					<col style="width:5.1%;"/>
					<col style="width:1%;"/>
					<col style="width:9.6%;"/>
					<col style="width:4.3%;"/>
					<col style="width:4.3%;"/>
				</colgroup>
			  <tr>
			    <td class="no-border" colspan="2"></td>
			    <td class="no-border" colspan="5" rowspan="3" >
			    	<span class="barcode-num" id="regiNo"></span>
			    	<div class="barcode_area1" data="" style="padding: 0; width: 100%;" id="regiNoBcd"></div>
			    </td>
			    <td class="no-border" colspan="8" style="height: 50px;"></td>
			  </tr>
			  <tr>
			    <td class="no-border" colspan="2" rowspan="2">Item No.<br>우편물 번호</td>
			    <td class="va-middle" colspan="4">Date & Time Posted 접수년월일시</td>
			    <td class="va-middle" colspan="4" id="orderDate">2016.06.20 &nbsp;&nbsp; 17:57:06</td>
			  </tr>
			  <tr>
			    <td class="va-middle" colspan="4">Post office code 우편용국기호</td>
			    <td class="va-middle" colspan="4" id="treatPoRegiPoCd">1000114</td>
			  </tr>
			  <tr>
			    <td class="text-lg" rowspan="5">
			    	<span style="font-size: 9px">From</span><br><br>보<br>내<br>는<br><br>사<br>람</td>
			    <td class="ta-left" colspan="5">
			    	<span class="text-blue">Tel. No. </span>
			    	<span class="text-lg" id="senderTelNo">010-8292-9888</span></td>
			    <td class="text-lg" rowspan="5">
			    	<span style="font-size: 9px">To</span><br><br>받<br><br>는<br><br>사<br><br>람
			    </td>
			    <td class="ta-left" colspan="8">
			    	<span class="text-blue">Tel. No. </span>
			    	<span class="text-lg" id="receiveTelNo">18606888808</span>
			    </td>
			  </tr>
			  <tr>
			    <td class="ta-left" colspan="5">
			    	<span class="text-blue">Name(영문)&nbsp;</span>
			    	<span class="text-lg" id="sender">Hanseong Logis</span>
			    </td>
			    <td class="ta-left" colspan="8">
			    	<span class="text-blue">Name(영문)&nbsp;</span>
			    	<span class="text-lg" id="receiveName">黄铎</span>
			    </td>
			  </tr>
			  <tr>
			    <td class="no-border ta-left va-top addr-h" colspan="5">
			    	<span class="text-blue">Address&nbsp;</span><br>
					<span class="text-lg" id="senderAddr">서울 구로구 구로동 468 1층</span>
			    </td>
			    <td class="no-border ta-left va-top br-right" colspan="8">
			    	<span class="text-blue">Address&nbsp;</span><br>
					<span class="text-lg" id="receiveAddr3">上海市金山区亭林镇亭塔路47号</span>
			    </td>
			  </tr>
			  <tr>
			    <td class="va-middle no-border" style="line-height: 10px;" colspan="5">
			    	<span class="text-blue ft-left">e-mail</span><br>
			    	<span class="text-green ft-right" style="letter-spacing: -1px;">작성된 개인정보는 사전통관정보제공 시행국가에 전자적으로 전송됩니다.</span>
			    </td>
			    <td class="no-border br-right" colspan="8"></td>
			  </tr>
			  <tr>
			    <td class="no-border" colspan="5">
					<span class="text-blue ft-left" style="line-height:19px;">Postal code</span>
					<span class="text-lg" id="senderZipCode">08281</span>
					<span class="text-lg ft-right text-blue">Rep. of KOREA</span>
				</td>
			    <td class="no-border br-right" colspan="8">
						<span class="text-blue ft-left" style="line-height:19px;">Postal code</span>
						<span class="text-lg ft-left" id="receiveZipCode"></span>
						<span class="text-lg ft-right" id="countryName" style="display:inline-block; white-space: nowrap; max-width: 150px;">
						</span>
						<span class="text-blue ft-right" style="line-height:19px;">Country</span>
				</td>
			  </tr>
			  <tr>
			    <td class="va-middle ta-left text-lg" colspan="9">
			    	Customs Declaration 세관신고서 <span class="ft-right">CN23</span>
			    </td>
			    <td class="va-middle" colspan="3" style="line-height: 1.1">
					<span style="display: inline-block; padding-left: 6px; float: left">Weight<br>중량</span>
					<span style="display: inline-block; padding: 2px 6px 0 0; float: right; font-weight:bold;">
						<span id="totWeight">18700</span> <span style="font-size: 11px">g</span>
					</span>
				</td>
			    <td class="va-middle" colspan="3" style="line-height: 1.1">
			    	<span style="display: inline-block; padding-left: 6px; float: left">Postage<br>우편요금</span>
					<span style="display: inline-block; padding: 2px 6px 0 0; float: right; font-weight:bold;">
						<span id="preRecevPrc">79900</span>  <span style="font-size: 11px">원</span>
					</span>
			    </td>
			  </tr>
			  <tr class="col-item">
			    <td class="va-middle" colspan="3">Contents 내용 품명(반드시 영문으로 구체적으로 기재)</td>
			    <td class="va-middle">Quantity<br>(개수)</td>
			    <td class="va-middle">Net Weight<br>(순중량)</td>
			    <td class="va-middle">Value<br>(가격:US$)</td>
			    <td class="va-middle" colspan="2">HS Tariff<br>Number(Hs)</td>
			    <td class="va-middle">Country of<br>Origin(생산지)</td>
			    <td class="va-middle ta-left ls-md ls-xs" colspan="3" rowspan="2">Guarantee Service<br>배달보장서비스(도착국가기준)<br>(신청시 인터넷우체국 확인가능)</td>
			    <td class="va-middle ls-md" rowspan="2">Country code<br>도착국명 약호</td>
			    <td class="va-middle text-lg" style="font-size: 20px;" rowspan="2" id="countryCd1">  </td>
			    <td class="va-middle text-lg" style="font-size: 20px;" rowspan="2" id="countryCd2">  </td>
			  </tr>
			  <tr class="item-tr">
			    <td class="item-td va-middle ta-left" colspan="3" id="contents1"></td>
			    <td class="item-td va-middle" id="number1"></td>
			    <td class="item-td va-middle" id="weight"></td>
			    <td class="item-td va-middle" id="value1"></td>
			    <td class="item-td va-middle" colspan="2" id="hsCode1"></td>
			    <td class="item-td "></td>
			  </tr>
			  <tr class="item-tr">
			    <td class="item-td va-middle ta-left" colspan="3" id="contents2"></td>
			    <td class="item-td va-middle" id="number2"></td>
			    <td class="item-td va-middle" id="weight2"></td>
			    <td class="item-td va-middle" id="value2"></td>
			    <td class="item-td va-middle" colspan="2" id="hsCode2"></td>
			    <td class="item-td va-middle"></td>
			    <td class="va-top ta-left " colspan="3" rowspan="3">
			    	요금납부방법 및 기타
					<span class="ls-md" style="display: inline-block;"><i class="fa fa-square-o"></i>&nbsp;현금수납(<i class="fa fa-square-o"></i>감액 시 표시)</span><br>
					<span class="ls-md" style="display: inline-block;"><i class="fa fa-check-square-o"></i>&nbsp;요금후납</span>
			    </td>
			    <td class="va-top ta-left" colspan="3" rowspan="3">Signature 담당자서명</td>
			  </tr>
			  <tr class="item-tr">
			    <td class="item-td va-middle ta-left" colspan="3" id="contents3"></td>
			    <td class="item-td va-middle" id="number3"></td>
			    <td class="item-td va-middle" id="weight3"></td>
			    <td class="item-td va-middle" id="value3"></td>
			    <td class="item-td va-middle" colspan="2" id="hsCode3"></td>
			    <td class="item-td"></td>
			  </tr>
			  <tr class="item-tr">
			    <td class="item-td va-middle ta-left" colspan="3" id="contents4"></td>
			    <td class="item-td va-middle" id="number4"></td>
			    <td class="item-td va-middle" id="weight4"></td>
			    <td class="item-td va-middle" id="value4"></td>
			    <td class="item-td va-middle" colspan="2" id="hsCode4"></td>
			    <td class="item-td "></td>
			  </tr>
			  <tr>
			    <td class="va-middle ls-md ls-xs" colspan="5" id="emGubun">
			    	<i class="fa fa-square-o" id="Sample"></i> Sample 상품견본&nbsp;&nbsp;&nbsp;
			    	<i class="fa fa-check-square-o" id="Gift"></i> Gift 선물&nbsp;&nbsp;&nbsp;
			    	<i class="fa fa-square-o" id="Merchandise"></i> Merchandise 상품&nbsp;&nbsp;&nbsp;
			    	<i class="fa fa-square-o" id="Document"></i> 수출면장건
			    </td>
			    <td class="ls-sm va-top ls-xs" colspan="4" rowspan="2">Signature 발송인 서명(세관신고서,보험이용여부,받는사람 전화번호 기재필)</td>
			    <td class="ls-sm va-top ls-xs" colspan="3" rowspan="2">
			    	<div>보험이용여부(음식물, 전자제품 불가)(Shipping insurance)</div>
			    	<div> 
						<span><i class="fa fa-square-o"></i>&nbsp;YES</span>
						<span style="display: inline-block; margin-left: 38px"><i class="fa fa-check-square-o"></i>&nbsp;NO</span>
					</div>
					
			    </td> 
			    <td class="ls-sm va-top ta-left ls-xs" colspan="3" rowspan="2">보험가액(Insurance value)</td>
			  </tr>
			  <tr>
			    <td class="va-middle ls-xs" colspan="5">
			    	<div style="float: left; width: 70%">
			    		<span style="display: inline-block; border-bottom: 1px solid #000 ">순번(Specify each shipment. Shipment No.)</span>
			    		<span style="display: inline-block;">총물수(Total item quantity)</span>
			    	</div>
			    	<div style="float: left; width: 1%; line-height: 27px;">:</div>
			    	<div class="view-a4" style="float: left; width: 1%; line-height: 23px; padding-left: 3px;">:</div>
			    	<div style="float: left; width: 20%">
			    		<span style="display: inline-block; border-bottom: 1px solid #000; ">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)번째</span><br>
			    		<span style="display: inline-block; ">(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)개</span>
			    	</div>
			    
			    	<!-- <span style="display: inline-block; border-bottom: 1px solid #000 ">순번(Specify each shipment. Shipment No.)</span>
					<span style="display: inline-block; position: relative; top: 10px; font-weight: bold">:</span>
					&nbsp;<span style="display: inline-block; border-bottom: 1px solid #000; float: right; margin-right: 10px;">&nbsp;(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)번째&nbsp;</span><br>
					<span style="display: inline-block;">총물수(Total item quantity)</span>
					&nbsp;<span style="display: inline-block; float: right; margin-right: 10px;">&nbsp;(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)개</span> -->
			    
			    	<!-- <span style="display: inline-block; padding: 0 0 4px 0; margin-left:6px; border-bottom: 1px solid #000">순번(Specify each shipment. Shipment No.)</span>
					<span style="display: inline-block; position: relative; top: 10px; font-weight: bold">:</span>
					&nbsp;<span style="display: inline-block; padding: 0 0 4px 0; margin-left:4px; border-bottom: 1px solid #000">&nbsp;(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)번째&nbsp;</span><br>
					<span style="display: inline-block; margin-left:46px;">총물수(Total item quantity)</span>
					&nbsp;<span style="display: inline-block; margin-left:52px;">&nbsp;(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)개</span> -->
			    
			    </td>
			  </tr>
			</table>
			</div>
          </div>
          <div class="modal-footer">
          	<div class="col-sm-8 col-sm-offset-2 text-center">
		    	<div class="radio">
		           <label>
		           		<input type="radio" name="emGubun" value="false" checked="checked">세관신고서 형식(基本形)
		           </label>
		           <label>
		           		<input type="radio" name="emGubun" value="true">영수증 형식
		           </label>
		        </div>
	        </div>
	        <div class="col-sm-8 col-sm-offset-2 text-center">
			  <button type="button" class="btn btn-primary btn-lg" onclick="print(false)"> <i class="fa fa-print"></i> A4용지 출력</button>
			  <button type="button" class="btn btn-primary btn-lg" onclick="print(true)"> <i class="fa fa-print"></i> 소형라벨지 출력</button>
			  <button type="button" class="btn btn-default btn-lg" data-dismiss="modal">Close</button>
		    </div>
		 </div>
     </div>
  </div>
</div>

    <!-- start:javascript for this page -->
<%-- <script src="${pageContext.request.contextPath}/static/assets/advanced-datatable_old/media/js/jquery.dataTables.js"></script> --%>
<script src="${pageContext.request.contextPath}/static/assets/advanced-datatable/media/js/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/data-tables/DT_bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/restful-client/jquery.rest.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-barcode.min.js"></script>
<script type="text/javascript" charset="utf-8">
var selectOrder;

function print(label) {
	
	//receipt label
	var receipt = $(":radio[name='emGubun']:checked").val();
	window.open(
			"/order/print?label="+label+"&receipt="+receipt+"&orderNoList="+ selectOrder
		);
}

function updateDialog(orderNo) {
	
	selectOrder = orderNo;
	
	$.read(
			  '/order/'+orderNo,
			  function (rep) {
			    $("#regiNo").html(rep.regiNo);
			    $("#regiNoBcd").attr("data",rep.regiNo);
			    $("#treatPoRegiPoCd").html(rep.treatPoRegiPoCd);
				$("#orderDate").html(rep.orderDate);
				$("#senderTelNo").html(rep.senderMobile2 +"-"+ rep.senderMobile3 +"-"+ rep.senderMobile4);
				$("#receiveTelNo").html(rep.receiveTelNo);
				$("#sender").html(rep.sender);
				$("#receiveName").html(rep.receiveName);
				$("#senderAddr").html(rep.senderAddr2 + rep.senderAddr1);
				$("#receiveAddr3").html(rep.receiveAddr3);
				$("#senderZipCode").html(rep.senderZipCode);
				$("#receiveZipCode").html(rep.receiveZipCode);
				$("#countryCd1").html(rep.countryCd.charAt(0));
				$("#countryCd2").html(rep.countryCd.charAt(1));
				$("#countryName").html(rep.countryName);
				$("#emGubun i").removeClass("fa-check-square-o"); //fa-check-square-o
				$("#emGubun i").addClass("fa-square-o");
				$("#"+rep.emGubun).removeClass("fa-square-o"); 
				$("#"+rep.emGubun).addClass("fa-check-square-o"); 
				$("#totWeight").html(rep.totWeight);
				$("#preRecevPrc").html(rep.preRecevPrc);
				$("#totWeight").html(rep.totWeight);
				
				$("#contents1").html(rep.contents1);
				$("#number1").html(rep.number1);
				$("#weight1").html(rep.weight1);
				$("#value1").html(rep.value1);
				$("#hsCode1").html(rep.hsCode1);

				$("#contents2").html(rep.contents2);
				$("#number2").html(rep.number2);
				$("#weight2").html(rep.weight2);
				$("#value2").html(rep.value2);
				$("#hsCode2").html(rep.hsCode2);
				
				$("#contents3").html(rep.contents3);
				$("#number3").html(rep.number3);
				$("#weight3").html(rep.weight3);
				$("#value3").html(rep.value3);
				$("#hsCode3").html(rep.hsCode3);
				
				$("#contents4").html(rep.contents4);
				$("#number4").html(rep.number4);
				$("#weight4").html(rep.weight4);
				$("#value4").html(rep.value4);
				$("#hsCode4").html(rep.hsCode4);
				
				$(".barcode_area1").barcode(rep.regiNo, "code128", {"showHRI":false, "barHeight":25, "barWidth":1, "output": 'bmp'}).removeAttr("style").children().css("width","98%");
			  }
			);
	
	//var update = $.update('/user/'+ $("#user-form input[name=no]").val() , JSON.stringify($("#user-form").serializeObject()) );
	//update.then(ajaxSuccess, ajaxError);
	
}

    $(document).ready(function() {
    	// Array holding selected row IDs
    	var btnStr = //"<button class='btn btn-info btn-sm' onclick='ready()'><i class='fa fa-pencil'></i></button> " +
            "<button class='btn btn-danger btn-sm' onclick='ready()'><i class='fa fa-trash-o '></i></button> "
            +"<div class='btn-group'>"
            +"<button type='button' class='btn btn-success dropdown-toggle btn-sm' data-toggle='dropdown'><i class='fa fa-print'></i><span class='caret'></span></button>"
            +"<ul class='dropdown-menu dropdown-success' role='menu'>"
            +"<li name='printA4'><a>A4</a></li>"
            +"<li name='printLabel'><a>소형라벨</a></li>"
            +"</ul>"
            +"</div>";
            
       var btnStr2 = //"<button class='btn btn-danger btn-sm' onclick='ready()'><i class='fa fa-trash-o '></i></button> " +
           "<div class='btn-group'>"
           +"<button type='button' class='btn btn-success dropdown-toggle btn-sm' data-toggle='dropdown'><i class='fa fa-print'></i><span class='caret'></span></button>"
           +"<ul class='dropdown-menu dropdown-success' role='menu'>"
           +"<li name='printA4'><a>A4</a></li>"
           +"<li name='printLabel'><a>소형라벨</a></li>"
           +"</ul>"
           +"</div>";     
            
    	var rows_selected = [];
    	
    	//https://datatables.net/manual/server-side
        var table = $('#orderList').DataTable( {
        	filter:false,
        	ordering: false,
        	serverSide: true,
        	ajax: {
    			'contentType': 'application/json',
    			'url':  "${pageContext.request.contextPath}/order/list",
     			'type': 'POST',
     			'data': function(d) {
    				return JSON.stringify(d);
    			}
    		},
        	columnDefs: [ {
                orderable: false,
                className: 'select-checkbox',
                targets:   0,
                render: function (data, type, full, meta){
                    return '<input type="checkbox" value="'+data.orderNo+'">';
                }
            } ],
            columns: [
        		{ data: null
        		},
        		{ data: null,
                    orderable: false
        		},
                { data: "orderDate",
                	render: function ( data, type, full, meta ) {
                        return data.substring(0,10);
                    	}
        		},
                { data: "regiNo",
                	render: function ( data, type, full, meta ) {
                    return '<a href=" #user-modal" class="detail" data-toggle="modal"><strong>'+data+'</strong></a>';
                	}
                },
                { data: "receiveName"},
                { data: "countryCd"},
                { data: "totWeight"},
                { data: "preRecevPrc"},
                { data: "preRecevPrc"},
                {
                    data: null,
                    defaultContent: btnStr,
                  }
            ]
        } );
        
        var table2 = $('#printList').DataTable( {
        	filter:false,
        	ordering: false,
        	autoWidth : false,
        	ajax: {
        		url : "${pageContext.request.contextPath}/order/printList", 
	        	dataSrc: ""
        	},
        	columnDefs: [ {
                orderable: false,
                className: 'select-checkbox',
                targets:   0,
                render: function (data, type, full, meta){
                	return '<input type="checkbox" value="'+data.orderNo+'">';
                }
            } ],
            columns: [
        		{ data: null
        		},
        		{ data: null,
                    orderable: false
        		},
                { data: "orderDate",
                	render: function ( data, type, full, meta ) {
                        return data.substring(0,10);
                    	}
        		},
                { data: "regiNo",
                	render: function ( data, type, full, meta ) {
                        return '<a href=" #user-modal" class="detail" data-toggle="modal"><strong>'+data+'</strong></a>';
                    	}
                },
                { data: "receiveName"},
                { data: "countryCd"},
                { data: "totWeight"},
                { data: "preRecevPrc"},
                { data: "preRecevPrc"},
                {
                    data: null,
                    defaultContent: btnStr2,
                  }
            ]
        } );
        
        table.on( 'draw.dt', function () {
        	table.column(1, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
                cell.innerHTML = i+1;
            } );
        } ).draw();
        
        table2.on( 'draw.dt', function () {
        	table2.column(1, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
                cell.innerHTML = i+1;
            } );
        } ).draw();
        
     	// Handle click on "Select all" control
        $('.example-select-all').on('click', function(){
           // Get all rows with search applied
           var tableId = $(this).parents("table").attr("id");
           var table = $("#"+tableId).dataTable().api();
           var rows = table.rows({ 'search': 'applied' }).nodes();
           // Check/uncheck checkboxes for all rows in the table
           $('input[type="checkbox"]', rows).prop('checked', this.checked);
        });
     	
        $('tbody').on('click', 'tr .detail', function () {
        	var tableId = $(this).parents("table").attr("id");
        	var t = $("#"+tableId).dataTable().api();
        	var data = t.row( this.parentNode.parentNode ).data();
            updateDialog(data.orderNo);
        } );
        
        $('tbody').on('click', '[name=printLabel], [name=printA4]', function () {
        	var tableId = $(this).parents("table").attr("id");
        	var t = $("#"+tableId).dataTable().api();
        	var data = t.row( this.parentNode.parentNode.parentNode ).data();
        	var type = $(this).attr("name") == "printLabel" ?  "A4" : "label" ;
        	var isLabel = $(this).attr("name") == "printLabel" ?  true : false ;
        	
        	confirmPrint(type,isLabel,data.orderNo);
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
    
function printAll(isLabel,type) {
  	var tableId = $(".tab-pane.active").find("table").attr("id");
  	alert(tableId);
  	
  	var sel = $('#'+tableId+' input[type=checkbox]:checked').map(function(_, el) {
        return $(el).val();
    }).get();
  	
	confirmPrint(type, isLabel, sel);
}

function confirmPrint(type, isLabel, orderNo){
	$.confirm({
	    content:'<label>'+type+'에 송장을 출력하시겠습니까?</label><br><br>' +
		        '<div><label><input type="radio" name="emGubun2" value="false" checked="checked">세관신고서 형식(基本形)</label></div>' +
		        '<label><input type="radio" name="emGubun2" value="true">영수증 형식</label>'
    	,
	    buttons: {
		    confirm : {
		    	btnClass: 'btn-info',				    	
		    	action : function () {
		    		//receipt label
		    		var receipt = $(":radio[name='emGubun2']:checked").val();
		    		window.open(
		    				"/order/print?label="+isLabel+"&receipt="+receipt+"&orderNoList="+orderNo
		    			);
		        } 
		    }, 
	        cancel: function () {
	        }
	    }
	});
}
</script>
    <!-- end:javascript for this page -->

</body>
</html>	