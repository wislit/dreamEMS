<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font-awesome.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/print.css" />
<style>
<c:if test="${isLabel }">
@page {
    size: 271mm 110mm;
    margin: 0;
}
@media print {
    html, body  {
    size: 271mm 106mm;
  }
}
</c:if>
<c:if test="${not isLabel }">
@page {
    size: A4;
    margin: 0;
}
</c:if>

/* IE일경우 스타일 조금 다르게.. */
<c:if test="${not fn:contains(header['User-Agent'],'Chrome')}">
.print .test1{line-height: 1.1;}
.print .invoice2 td{height: 8px; font-size: 8.5px; }
</c:if>

</style>



<body class="print">
<div class="none"> 
    <a href="#" onClick="window.print();">Print</a>
</div>
<!-- start:main -->
<!--  -->
<div id="bcTarget"></div>
   
<c:forEach var="order" items="${orderList}" varStatus="index">
<c:if test="${not index.first }">
	<div class="noprint" style="height: 10px;"></div>
</c:if>

<!-- 송장 -->
<c:if test="${not isLabel }">
<page size="A4"> 
<div class="div-a4 default">
<table class="tb-print">
</c:if>

<c:if test="${isLabel }">
<page size="label"> 
<div class="div-label-1">
<table class="tb-print2">
</c:if>

	<colgroup>
		<col style="width:3.5%;"/>
		<col style="width:8.5%;"/>
		<col style="width:17.3%;"/>
		<col style="width:6%;"/>
		<col style="width:6%;"/>
		<col style="width:6.8%;"/>
		<c:if test="${fn:contains(header['User-Agent'],'Chrome')}">
		<col style="width:3.5%;"/>
		</c:if>
		<c:if test="${not fn:contains(header['User-Agent'],'Chrome')}">
		<col style="width:20px;"/>
		</c:if>
		<col style="width:3.7%;"/>
		<col style="width:7.4%;"/>
		<col style="width:14%;"/>
		<col style="width:4.1%;"/>
		<col style="width:1%;"/>
		<col style="width:9.6%;"/>
		<col style="width:4.3%;"/>
		<col style="width:4.3%;"/>
	</colgroup>
  <tr>
    <td class="no-border" colspan="2"></td>
    <td class="no-border" colspan="5" rowspan="3" >
    	<span class="barcode-num">${order.regiNo }</span>
    	<div class="barcode_area1" data="${order.regiNo }" style="padding: 0; width: 100%;"></div>
    </td>
    <td class="no-border" colspan="8" style="height: 50px;"></td>
  </tr>
  <tr>
    <td class="no-border" colspan="2" rowspan="2">Item No.<br>우편물 번호</td>
    <td class="va-middle" colspan="4">Date & Time Posted 접수년월일시</td>
    <td class="va-middle" colspan="4"><fmt:formatDate value="${order.orderDate }" pattern="yyyy-MM-dd HH:mm:ss" timeZone="GMT+9" /></td>
  </tr>
  <tr>
    <td class="va-middle" colspan="4">Post office code 우편용국기호</td>
    <td class="va-middle" colspan="4">${order.treatPoRegiPoCd }</td>
  </tr>
  <tr>
    <td class="text-lg" rowspan="5">
    	<span style="font-size: 9px">From</span><br><br>보<br>내<br>는<br><br>사<br>람</td>
    <td class="ta-left" colspan="5">
    	<span class="text-blue">Tel. No. </span>
    	<span class="text-lg">${order.senderMobile2 }-${order.senderMobile3 }-${order.senderMobile4 }</span></td>
    <td class="text-lg" rowspan="5">
    	<span style="font-size: 9px">To</span><br><br>받<br><br>는<br><br>사<br><br>람
    </td>
    <td class="ta-left" colspan="8">
    	<span class="text-blue">Tel. No. </span>
    	<span class="text-lg">${order.receiveTelNo }</span>
    </td>
  </tr>
  <tr>
    <td class="ta-left" colspan="5">
    	<span class="text-blue">Name(영문)&nbsp;</span>
    	<span class="text-lg">${order.sender }</span>
    </td>
    <td class="ta-left" colspan="8">
    	<span class="text-blue">Name(영문)&nbsp;</span>
    	<span class="text-lg">${order.receiveName }</span>
    </td>
  </tr>
  <tr>
    <td class="no-border ta-left va-top addr-h" colspan="5">
    	<span class="text-blue">Address&nbsp;</span><br>
		<span class="text-lg">${order.senderAddr2 } ${order.senderAddr1 }</span>
    </td>
    <td class="no-border ta-left va-top br-right" colspan="8">
    	<span class="text-blue">Address&nbsp;</span><br>
		<span class="text-lg">${order.receiveAddr3 }</span>
    </td>
  </tr>
  <tr>
    <td class="va-middle no-border" style="line-height: 10px;" colspan="5">
    	<span class="text-blue ft-left">e-mail</span><br>
    	<span class="text-green ft-right" style="letter-spacing: -1.2px;">작성된 개인정보는 사전통관정보제공 시행국가에 전자적으로 전송됩니다.</span>
    </td>
    <td class="no-border br-right" colspan="8"></td>
  </tr>
  <tr>
    <td class="no-border" colspan="5">
		<span class="text-blue ft-left" style="line-height:19px;">Postal code</span>
		<span class="text-lg">${order.senderZipCode }</span>
		<span class="text-lg ft-right text-blue">Rep. of KOREA</span>
	</td>
    <td class="no-border br-right" colspan="8">
			<span class="text-blue ft-left" style="line-height:19px;">Postal code</span>
			<span class="text-lg ft-left">${order.receiveZipCode }</span>
			<span class="text-lg ft-right" style="display:inline-block; white-space: nowrap; max-width: 150px;">
			${order.countryName }
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
			${order.totWeight }<span style="font-size: 11px">g</span>
		</span>
	</td>
    <td class="va-middle" colspan="3" style="line-height: 1.1">
    	<span style="display: inline-block; padding-left: 6px; float: left">Postage<br>우편요금</span>
		<span style="display: inline-block; padding: 2px 6px 0 0; float: right; font-weight:bold;">
			${order.preRecevPrc }<span style="font-size: 11px">원</span>
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
    <td class="va-middle text-lg" style="font-size: 20px;" rowspan="2"> ${order.countryCd.charAt(0) } </td>
    <td class="va-middle text-lg" style="font-size: 20px;" rowspan="2"> ${order.countryCd.charAt(1) } </td>
  </tr>
  <tr class="item-tr">
    <td class="item-td va-middle ta-left" colspan="3">${order.contents1 }</td>
    <td class="item-td va-middle">${order.number1 }</td>
    <td class="item-td va-middle">${order.weight1 }</td>
    <td class="item-td va-middle">${order.value1 }</td>
    <td class="item-td va-middle" colspan="2">${order.hsCode1 }</td>
    <td class="item-td "></td>
  </tr>
  <tr class="item-tr">
    <td class="item-td va-middle ta-left" colspan="3">${order.contents2 }</td>
    <td class="item-td va-middle">${order.number2 }</td>
    <td class="item-td va-middle">${order.weight2 }</td>
    <td class="item-td va-middle">${order.value2 }</td>
    <td class="item-td va-middle" colspan="2">${order.hsCode2 }</td>
    <td class="item-td va-middle"></td>
    <td class="va-top ta-left " colspan="3" rowspan="3">
    	요금납부방법 및 기타
		<span class="ls-md" style="display: inline-block;"><i class="fa fa-square-o"></i>&nbsp;현금수납(<i class="fa fa-square-o"></i>감액 시 표시)</span><br>
		<span class="ls-md" style="display: inline-block;"><i class="fa fa-check-square-o"></i>&nbsp;요금후납</span>
    </td>
    <td class="va-top ta-left" colspan="3" rowspan="3">Signature 담당자서명</td>
  </tr>
  <tr class="item-tr">
    <td class="item-td va-middle ta-left" colspan="3">${order.contents3 }</td>
    <td class="item-td va-middle">${order.number3 }</td>
    <td class="item-td va-middle">${order.weight3 }</td>
    <td class="item-td va-middle">${order.value3 }</td>
    <td class="item-td va-middle" colspan="2">${order.hsCode3 }</td>
    <td class="item-td"></td>
  </tr>
  <tr class="item-tr">
    <td class="item-td va-middle ta-left" colspan="3">${order.contents4 }</td>
    <td class="item-td va-middle">${order.number4 }</td>
    <td class="item-td va-middle">${order.weight4 }</td>
    <td class="item-td va-middle">${order.value4 }</td>
    <td class="item-td va-middle" colspan="2">${order.hsCode4 }</td>
    <td class="item-td "></td>
  </tr>
  <tr>
    <td class="va-middle ls-md ls-xs" colspan="5">
    	<c:set var="isChecked" value="${order.emGubun eq 'Sample'}" />
    	<i class="fa <c:if test='${not isChecked }'>fa-square-o</c:if> <c:if test='${isChecked }'>fa-check-square-o</c:if>"></i> Sample 상품견본&nbsp;&nbsp;&nbsp;
    	<c:set var="isChecked" value="${order.emGubun eq 'Gift'}" />
    	<i class="fa <c:if test='${not isChecked }'>fa-square-o</c:if> <c:if test='${isChecked }'>fa-check-square-o</c:if>"></i> Gift 선물&nbsp;&nbsp;&nbsp;
    	<c:set var="isChecked" value="${order.emGubun eq 'Merchandise'}" />
    	<i class="fa <c:if test='${not isChecked }'>fa-square-o</c:if> <c:if test='${isChecked }'>fa-check-square-o</c:if>"></i> Merchandise 상품&nbsp;&nbsp;&nbsp;
    	<c:set var="isChecked" value="${order.emGubun eq 'Document'}" />
    	<i class="fa <c:if test='${not isChecked }'>fa-square-o</c:if> <c:if test='${isChecked }'>fa-check-square-o</c:if>"></i> 수출면장건
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



<!-- A4 & 세관신고서 형식 -->
<c:if test="${not isLabel and not isReceipt }">
<div style="height: 2%"></div>
<c:forEach begin="1" end="2" step="1">
<div class="div-a4 invoice">
	<table class="tb-print">
	<colgroup>
		<col style="width:26%;"/>
		<col style="width:3.1%;"/>
		<col style="width:18.6%;"/>
		<col style="width:3.1%;"/>
		<col style="width:15%;"/>
		<col style="width:8.5%;"/>
		<col style="width:9,5%;"/>
		<col style="width:16.2%;"/>
	</colgroup>
  <tr>
    <td class="" colspan="8"><h2>Customs Declaration(CN23) / Invoice</h2></td>
  </tr>
  <tr>
    <td class="va-top ta-left" colspan="4" rowspan="2">
    	<h4>①Shipper/Exporter</h4>
			${order.sender }<br>
			${order.senderAddr2 } ${order.senderAddr1 }<br>
			${order.senderMobile2 }-${order.senderMobile3 }-${order.senderMobile4 }
    </td>
    <td class="va-top ta-left base-h" colspan="2"><h4>⑥Carrier</h4></td>
    <td class="va-top ta-left base-h" colspan="2">
    	<h4 style="letter-spacing: -1.2px;">⑦Sailing on or about</h4>
		<span class="va-middle">
			<fmt:formatDate value="${order.orderDate }" pattern="yyyy-MM-dd" timeZone="GMT+9" />
		</span>
    </td>
  </tr>
  <tr>
    <td class="va-top ta-left base-h" colspan="4">
    	<h4>⑧No & date of invoice</h4>
		<span class="va-middle">
			<fmt:formatDate value="${order.orderDate }" pattern="yyyy-MM-dd" timeZone="GMT+9" /> &nbsp;&nbsp;
			${order.regiNo }
		</span>
    </td>
  </tr>
  <tr>
    <td class="va-top ta-left" colspan="4" rowspan="2">
    	<h4>②For account & risk of Messers</h4>
			${order.receiveName }<br>
			${order.receiveAddr3 }(${order.countryName })
			${order.receiveTelNo }
    </td>
    <td class="va-top ta-left base-h" colspan="4"><h4>⑨No & date of L/C</h4></td>
  </tr>
  <tr>
    <td class="va-top ta-left base-h" colspan="4"><h4>⑩L/C Issuing Bank</h4></td>
  </tr>
  <tr>
    <td class="va-top ta-left" colspan="4" style="height: 60px;"><h4>③Notify party</h4></td>
    <td class="va-top ta-left" colspan="4" rowspan="2"><h4>⑪Remarks</h4></td>
  </tr>
  <tr>
    <td class="va-top ta-left base-h">
    	<h4>④Port of loading</h4>
    	<span class="va-middle" style="display:block; text-align: center;">
		KOREA
    	</span>
    	<!-- <div style="text-align: center; vertical-align: middle;">
    	</div> -->
    </td>
    <td class="va-top ta-left base-h" colspan="3">
    	<h4>⑤Final destination</h4>
		${order.countryName }
    </td>
  </tr>
  <tr class="item-tr">
    <td class="" colspan="2"><h4 style="letter-spacing: -1px">⑫Description of Goods</h4></td>
    <td class=""><h4>⑬Quantity/Unit</h4></td>
    <td class="" colspan="2"><h4>⑭Unit-Price</h4></td>
    <td class="" colspan="2"><h4>⑮Amount</h4></td>
    <td class="" ><h4>HS-code</h4></td>
  </tr>
  <tr class="item-tr">
    <td class="no-border br-left ta-left" colspan="2">${order.contents1 }</td>
    <td class="no-border br-left">${order.number1 }/</td>
    <td class="no-border br-left ta-left" colspan="2">USD</td>
    <td class="no-border br-left ta-left" colspan="2">USD ${order.value1 }</td>
    <td class="no-border br-left br-right ta-left">${order.hsCode1 }</td>
  </tr>
  <tr class="item-tr">
  	<td class="no-border br-left ta-left" colspan="2">${order.contents2 }</td>
    <td class="no-border br-left">${order.number2 }</td>
    <td class="no-border br-left ta-left" colspan="2"></td>
    <td class="no-border br-left ta-left" colspan="2">${order.value2 }</td>
    <td class="no-border br-left br-right ta-left">${order.hsCode2 }</td>
  </tr>
  <tr class="item-tr">
  	<td class="no-border br-left ta-left" colspan="2">${order.contents3 }</td>
    <td class="no-border br-left">${order.number3 }</td>
    <td class="no-border br-left ta-left" colspan="2"></td>
    <td class="no-border br-left ta-left" colspan="2">${order.value3 }</td>
    <td class="no-border br-left br-right ta-left">${order.hsCode3 }</td>
  </tr>
  <tr class="item-tr">
  	<td class="no-border br-left ta-left" colspan="2">${order.contents4 }</td>
    <td class="no-border br-left"${order.number4 }></td>
    <td class="no-border br-left ta-left" colspan="2"></td>
    <td class="no-border br-left ta-left" colspan="2">${order.value4 }</td>
    <td class="no-border br-left br-right ta-left">${order.hsCode4 }</td>
  </tr>
  <tr>
    <td class="ta-left" colspan="8">
    	<div class="ft-left" style="width: 20%"><b>Total</b></div>
    	<div class="ft-left" style="width: 25%">${order.value1 + order.value2 + order.value3 + order.value4 } USD</div>
    	<div class="ft-left" style="width: 50%"><b>Signed by</b> ${order.sender }</div>
    </td>
  </tr>
</table>
</div>
</c:forEach>
</c:if>

<!-- Label & 세관신고서 형식 -->
<c:if test="${isLabel and not isReceipt }">
<div style="float: left; height: 20px; width: 20%;"> </div>
<c:forEach begin="1" end="2" step="1">
<div class="invoice2">
	<table class="tb-print">
	<colgroup>
		<col style="width:33.2%;"/>
		<col style="width:25.3%;"/>
		<col style="width:18%;"/>
		<col style="width:30%;"/>
	</colgroup>
  <tr>
    <td class="" colspan="5">Customs Declaration(CN23) / Invoice</td>
  </tr>
  <tr>
    <td class="ta-left" colspan="5">
    	<div class="test1">Shipper/Exporter : ${order.sender }</div>
    	<div class="test1" style="height: 20px;">${order.senderAddr2 } ${order.senderAddr1 }</div>
    	<div class="test1"> </div>
    	<div class="test1">${order.senderMobile2 }-${order.senderMobile3 }-${order.senderMobile4 }</div>
<!--     	<h4>Shipper/Exporter</h4>
			Hanseong Logis<br>
			서울 구로구 구로동 468 1층
		010-8292-9888 -->
    </td>
   <tr>
    <td class="ta-left" colspan="5">
    	<div class="test1">For account & risk of Messers : ${order.receiveName }</div>
    	<div class="test1" style="height: 20px;">${order.receiveAddr3 }(${order.countryName })</div>
    	<!-- <h4>②For account & risk of Messers</h4>
			温曦<br>
			上海市金山区亭林镇桃贤路11号 (CHINA(PEOPLE'S REP))
		15058111812 -->
    </td>
   </tr>
   <tr>
    <td class="" colspan="5"> 
    	<div class="test1 ta-left" style="float: left; width: 43%;">Notify party :</div>
    	<div class="test1 ta-left" style="float: left; width: 53%;">Port of loading : KOREA</div>
    	<div class="test1 ta-left" style="float: left; width: 23%;">Carrier :</div>
    	<div class="test1 ta-left" style="float: left; width: 73%;">Final destination : ${order.countryName }</div>
    	<div class="test1 ta-left" style="float: left; width: 56%;">Sailing on or about <fmt:formatDate value="${order.orderDate }" pattern="yyyy-MM-dd" timeZone="GMT+9" /></div>
    	<div class="test1 ta-left" style="float: left; width: 40%;">Remarks :</div>
    	<div class="test1 ta-left" style="float: left;">No & date of invoice : <fmt:formatDate value="${order.orderDate }" pattern="yyyy-MM-dd" timeZone="GMT+9" /> ${order.regiNo }</div>
    	<div class="test1 ta-left" style="float: left; width: 43%;">No & date of L/C :</div>
    	<div class="test1 ta-left" style="float: left; width: 53%;">L/C Issuing Bank :</div>
    	<!-- Notify party -->
    </td>
   </tr>
   <tr class="col-item">
    <td>Description of Goods</td>
    <td>Quantity/Unit</td>
    <td>Unit-Price</td>
    <td>Amount</td>
   </tr>
  <tr class="item-tr">
    <td class="no-border br-left ta-left">${order.contents1 }</td>
    <td class="no-border br-left">${order.number1 }/</td>
    <td class="no-border br-left ta-left">USD</td>
    <td class="no-border br-left br-right ta-left">USD ${order.value1 }</td>
  </tr>
  <tr class="item-tr">
  	<td class="no-border br-left ta-left">${order.contents2 }</td>
    <td class="no-border br-left">${order.number2 }</td>
    <td class="no-border br-left ta-left"></td>
    <td class="no-border br-left br-right ta-left">${order.value2 }</td>
  </tr>
  <tr class="item-tr">
  	<td class="no-border br-left ta-left">${order.contents3 }</td>
    <td class="no-border br-left">${order.number3 }</td>
    <td class="no-border br-left ta-left"></td>
    <td class="no-border br-left br-right ta-left">${order.value3 }</td>
  </tr>
  <tr class="item-tr">
  	<td class="no-border br-left ta-left">${order.contents4 }</td>
    <td class="no-border br-left">${order.number4 }</td>
    <td class="no-border br-left ta-left"></td>
    <td class="no-border br-left br-right ta-left">${order.value4 }</td>
  </tr>
   <tr>
    <td class="ta-left"><b>Total</b> ${order.value1 + order.value2 + order.value3 + order.value4 }</td>
    <td colspan="4" class="ta-left"><b>Signed by</b> ${order.sender }</td>
   </tr>
</table>
</div>
</c:forEach>
</c:if>

<c:choose>
       <c:when test="${isLabel}">
           <c:set var="receiptType" value="receipt2" />
       </c:when>
       <c:when test="${not isLabel}">
          <c:set var="receiptType" value="receipt1" />
       </c:when>
</c:choose>
   
<!-- 영수증 형식 (A4,Label 동일) -->   
<c:if test="${isReceipt }">
	<c:choose>
       <c:when test="${isLabel}">
			<div style="float: left; height: 20px; width: 20%;"> </div>
       </c:when>
       <c:when test="${not isLabel}">
       </c:when>
	</c:choose>
	
	
<c:forEach begin="1" end="2" step="1">

<div class="${receiptType }">
	<table class="tb-print">
	<colgroup>
		<col style="width:25%;"/>
		<col style="width:75%;"/>
	</colgroup>
  <tr>
    <td class="text-lg" colspan="2">영수증 (<fmt:formatDate value="${order.orderDate }" pattern="yyyy-MM-dd HH:mm" timeZone="GMT+9" />)</td>
  </tr>
  <tr>
    <td class="ta-middle"><strong>등기번호</strong></td>
    <td class="ta-left">${order.regiNo }</td>
  <tr>
  <tr>
    <td class="ta-middle"><strong>발송인명</strong></td>
    <td class="ta-left">${order.sender }</td>
  <tr>
  <tr>
    <td class="ta-middle"><strong>국가명</strong></td>
    <td class="ta-left">${order.countryName }</td>
  <tr>
  <tr>
    <td class="ta-middle"><strong>중량</strong></td>
    <td class="ta-left">${order.totWeight }g</td>
  <tr>
  <tr>
    <td class="ta-middle"><strong>우편요금</strong></td>
    <td class="ta-left">${order.preRecevPrc }원</td>
  <tr>
  <tr>
    <td class="ta-middle"><strong>수취인명</strong></td>
    <td class="ta-left">${order.receiveName }</td>
  <tr>
  <tr>
    <td class="ta-middle"><strong>수취인주소</strong></td>
    <td class="ta-left va-top addr-h">${order.receiveAddr3 }(${order.countryName })</td>
  <tr>
   <tr>
    <td class="" colspan="2" style="padding: 2px;">
    	<div class="barcode_area1 receipt-barcode" data="${order.regiNo }"></div>
	</td>
  <tr>
</table>
</div>
</c:forEach>
</c:if>

<c:if test="${not isLabel }">
<div class="div-a4 footer">
<table class="tb-print">
<colgroup>
		<col class="ft-col-gp1"/>
		<col class="ft-col-gp2"/>
		<col class="ft-col-gp3"/>
		<col class="ft-col-gp4"/>
	</colgroup>
  <tr>
    <td class="no-border br-bottom br-right">
  		<div class="ft-col1">보내는 사람(FROM)</div>  
  		<div class="ft-col2 ta-left">${order.sender }</div>  
    </td>
    <td class="no-border br-right" rowspan="2">
    	<div class="barcode_area1" data="${order.regiNo }" style="padding: 0; width: 100%;"></div>
		<h2>${order.regiNo }</h2>
	</td>
    <td class="no-border br-bottom br-right">
    	<div class="ta-left" style="line-height: 6px;">Country</div>
    	<div style="line-height: 11px; word-break:break-all;">${order.countryName }</div>
	</td>
    <td class="no-border br-bottom">
    	<div class="ta-left">Weight</div>
    	<div class="ta-right">${order.totWeight }g</div>
	</td>
  </tr>
  <tr>
    <td class="no-border br-right ">
  		<div class="ft-col1"> 받는 사람(TO)</div>  
  		<div class="ft-col2 ta-left">${order.receiveName } </div>    
    </td>
    <td class="no-border br-right"><fmt:formatDate value="${order.orderDate }" pattern="yyyy-MM-dd HH:mm" timeZone="GMT+9" /></td>
    <td class="no-border">
    	<div class="ta-left">Postage</div>
    	<div class="ta-right">${order.preRecevPrc }원</div>
    </td>
  </tr>
</table>
</div>
</c:if>

<c:if test="${isLabel }">
<div class="div-label-footer">
<table class="tb-print2">
	<tr>
    <td class="no-border br-top">
    	<div class="ta-left" style="line-height: 6px;">Country</div>
    	<div style="line-height: 11px; word-break:break-all;">${order.countryName }</div>
	</td>
	</tr>
	<tr>
    <td class="no-border br-top">
    	<div class="ta-left">Weight</div>
    	<div class="ta-right">${order.totWeight }g</div>
	</td>
  </tr>
  <tr>
    <td class="no-border br-top">
    	<div class="ta-left">Postage</div>
    	<div class="ta-right">${order.preRecevPrc }원</div>
    </td>
  </tr>
  
  <tr>
    <td class="no-border br-top"><fmt:formatDate value="${order.orderDate }" pattern="yyyy-MM-dd HH:mm" timeZone="GMT+9" /></td>
    
    </tr>
  <tr>
    <td class="no-border br-top" style="height: 160px;">
    	<div class="barcode_area2" data="${order.regiNo }" style="padding: 0; width: 100%;"></div>
		<%-- <h2>${fn:replace(order.regiNo , \\(.)\\g, "$1<br />" )}</h2> --%>
		<span style="line-height:1; margin:-30px 15px 10px 0; display:inline-block; float: right;">${order.regiNo.replaceAll('(.)', '$1<br />')}</span>
	</td>
	</tr>
  <tr>
    <td class="no-border br-top">
  		<div class="ft-col1">보내는 사람(FROM)</div>  
  		<div class="ft-col2 ta-left">${order.sender }</div>  
    </td>
  </tr>
  <tr>
    <td class="no-border br-top br-bottom">
  		<div class="ft-col1"> 받는 사람(TO)</div>  
  		<div class="ft-col2 ta-left">${order.receiveName } </div>    
    </td>
    </tr>
    
</table>
</div>
</c:if>

</page>

</c:forEach>
</body>
<script src="${pageContext.request.contextPath}/static/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-barcode.min.js"></script>
<script type="text/javascript">
var beforePrint = function() {
};
var afterPrint = function() {
   console.log('이 Function은 프린트 이후에 호출됩니다.');
   //setTimeout(function(){window.close();}, 1);
};

if (window.matchMedia) {
   var mediaQueryList = window.matchMedia('print');
   mediaQueryList.addListener(function(mql) {
       if (mql.matches) {
           beforePrint();
       } else {
           afterPrint();
       }
   });
}

window.onbeforeprint = beforePrint;
window.onafterprint = afterPrint;


	$(document).ready(function() {
		
		$(".barcode_area1").each(function(idx, obj) {
			var ems_code = $(this).attr('data');
			$(this).barcode(ems_code, "code128", {"showHRI":false, "barHeight":28, "barWidth":1, "output": 'bmp'}).removeAttr("style").children().css("width","98%");
		});
		$(".barcode_area2").each(function(idx, obj) {
			var ems_code = $(this).attr('data');
			$(this).barcode(ems_code, "code128", {"showHRI":false, "barHeight":50, "barWidth":1, "output": 'bmp'}).removeAttr("style").children().css("width","155%");
		});
		
		<c:if test="${isLabel }">
		$(".receipt-barcode").children().css("width","80%");
		</c:if>
		/* $(".barcode_area3").each(function(idx, obj) {
			var ems_code = $(this).attr('data');
			$(this).barcode(ems_code, "code128", {"showHRI":false, "barHeight":30, "barWidth":1, "output": 'bmp'});
		}); */
		//$("#bcTarget").barcode("1234567890128", "ean13");    
	    
	});
</script>
</html>