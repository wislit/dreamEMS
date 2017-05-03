



<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>

.no-border{border: none;}
.br-right{border-right: 1px solid #000;}
.va-top{ vertical-align: top }
.va-middle{vertical-align: middle;}
.text-green {color: #1ca425;}
.text-blue{color: #1970ec;}

.ls-sm{ letter-spacing: -1.5px; }
.text-lg { font-size: 13px !important; font-weight: bold }
.ft-bold{font-weight: bold}

.ta_left {text-align: left; padding-left: 4px;}
.ta_right {text-align: right; padding-right: 4px;}

div.invoice{padding: 5% 5% 5% 5%; height: 40%;}

/* 송장 */
	/* .td{font-family: 'Noto Sans KR', 'Noto Sans SC', 'Microsoft Yahei', sans-serif !important}
	.text_green { color: #1ca425 }
	.text_blue { color: #1970ec; font-size: 11px; }
	.text_sm { font-size: 8px; letter-spacing: -1.5px; }
	.text_md { font-size: 11px }
	.text_lg { font-size: 13px !important; font-weight: bold }
	.text_xl { font-size: 28px !important; font-weight: bold }
	.va_middle { vertical-align: middle }
	.va_top { vertical-align: top }
	.ta_left {text-align: left !important;padding-left: 4px;}
	.ta_right {text-align: right !important;padding-right: 4px;}

	.eg_template_upper {
		width: 720px;
		position: relative;
		padding: 15px 25px;
		margin: 5px;
		background: #FFF;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
		/*box-shadow: 0 3px 8px rgba(0, 0, 0, 0.5);*/
	}
/*
	.eg_ems_code {
		display: inline-block;
		margin: 13px 0 7px 123px;
		font-size: 23px;
		float: left;
	}

	.eg_detail_table { width: 100%; }
	.eg_detail_table td {
		border: 1px solid #000;
		height: 19px;
		text-align: center;
		font-size: 10px;
	}
	.eg_detail_table p { word-break: break-all; }

	.barcode {
		width: 227px;
		height: 42px;
		margin: 7px 0 0 0;
	}
	.item_header td {
		font-size: 9px;
		letter-spacing: -1.2px;
	}
	td.item_td {
		border-bottom: 1px dashed #CCC;
		border-top: 1px dashed #CCC;
		font-size: 12px;
	}
	td.item_detailed { font-size: 11px; letter-spacing: -1px; }
	td.item_detailed i { font-size: 14px; }

	input[type=checkbox] {
		position: relative;
		top: 4px;
		width: 20px;
		height: 20px;
	} */
	
/* .eg_ems_code {
	display: inline-block;
	margin: 13px 0 7px 123px;
	font-size: 23px;
	float: left;
} */

.va_middle { vertical-align: middle }
td.item_detailed { font-size: 11px; letter-spacing: -1.2px; }
td.item_detailed i { font-size: 14px; }
td.item_td {
		border-bottom: 1px dashed #CCC;
		border-top: 1px dashed #CCC;
		font-size: 12px;
	}
.barcode {
	width: 227px;
	height: 42px;
	margin: 7px 0 0 0;
}
.item_header td {
	font-size: 9px;
	letter-spacing: -1.2px;
}
	
table.fixed { 
	table-layout:fixed;
	word-break : break-all; 
	margin: 0 5%;
	}
	
table.fixed td{ 
	table-layout:fixed; 
	border: 1px solid #000;
	 overflow: hidden;
	 font-size: 10px;
	}	

body {
  background: rgb(204,204,204); 
}
page[size="A4"] {
  background: white;
  width: 21cm;
  height: 29.7cm;
  display: block;
  margin: 0 auto;
  margin-bottom: 0.5cm;
  box-shadow: 0 0 0.5cm rgba(0,0,0,0.5);
}
@media print {
  body, page[size="A4"] {
    margin: 0;
    box-shadow: 0;
  }
  
	table { 
	width: 19cm;
	}  
  
}
</style>
<body>
<!-- start:main -->

<div> 
    <a href="#" onClick="window.print();">Print</a>
</div>

<page size="A4"> 
	<span class="eg_ems_code"> EG710143113KR </span>
	<table class="fixed">
	<colgroup> <!-- 808 * 450  189 -->
	<!-- 8 -->
	<col style="width:3.5%;"/>
	<!-- 51 -->
	<col style="width:8.5%;"/>
	<col style="width:17.8%;"/>
	<!-- 40 -->
	<col style="width:6%;"/>
	<col style="width:6%;"/>
	<col style="width:6.3%;"/>
	
	<!-- 8 -->
	<col style="width:3.5%;"/>
	
	<!-- 23 -->
	<col style="width:3.7%;"/>
	<col style="width:7.4%;"/>
	<!-- 153 -->
	<col style="width:14%;"/>
	<col style="width:5.1%;"/>
	<col style="width:9.6%;"/>
	<!-- 16 -->
	<col style="width:4.3%;"/>
	<col style="width:4.3%;"/>
	</colgroup>
	<tr>
		<td colspan="2" rowspan="3" style="border: 0">
			<div style="font-size:12px;">Item No.<br>우편물<br>번호</div>
		</td>
		<td colspan="5" rowspan="3" style="border: 0">
			<div class="barcode">바코드</div>
			<img src="" width="270" height="50" alt="barcode" style="position: absolute; top: 54px; left:96px;" />
		</td>
		<td colspan="7" style="height: 12px; border: 0">
			<img src="" style="position: absolute; right: 4px; top: 15px;"/>
		</td>
	</tr>
	<tr>
		<td colspan="3" class="va_middle">Date & Time Posted 접수년월일시</td>
		<td colspan="4" class="va_middle"> 2016-06-20 17:57:06 </td>
	</tr>
	<tr>
		<td colspan="3" class="va_middle">Post office code 우편용국기호</td>
		<td colspan="4" class="va_middle">1000114</td>
	</tr>
	<tr style="font-size: 14px;">
		<td rowspan="5" style="line-height: 1.3">
			<br><span style="font-size: 9px">From</span><br><br>보<br>내<br>는<br><br>사<br>람
		</td>
		<td colspan="5" class="ta_left">
			<span class="text_blue">Tel. No. </span><span class="text_lg">010-8292-9888</span>
		</td>
		<td rowspan="5" style="line-height: 1.2">
			<br><span style="font-size: 9px">To</span><br><br>받<br><br>는<br><br>사<br><br>람
		</td>
			<td colspan="7" class="ta_left">
			<span class="text_blue">Tel. No. </span><span class="text_lg">18606888808</span>
		</td>
	</tr>
	<tr style="font-size: 14px;">
		<td colspan="5" class="ta_left" style="padding-top: 2px;">
			<span class="text_blue">Name(영문)&nbsp;</span><span class="text_lg">Hanseong Logis</span>
		</td>
		<td colspan="7" class="ta_left">
			<span class="text_blue">Name(영문)&nbsp;</span><span class="text_lg">黄铎</span>
		</td>
	</tr>
	<tr style="font-size: 14px;">
		<td colspan="5" class="ta_left va_top" style="border-bottom: 0; padding-top: 4px;">
			<span class="text_blue">Address&nbsp;</span><br>
			<p class="text_lg" style="height:64px;">서울 구로구 구로동 468 1층</p>
			<p><span class="text_blue">e-mail</span></p>
		</td>
		<td colspan="7" class="ta_left va_top" style="border-bottom: 0">
			<span class="text_blue">Address&nbsp;</span><br>
			<p class="text_lg">上海市金山区亭林镇亭塔路47号</p>
		</td>
	</tr>
	<tr style="font-size: 9px; letter-spacing: -1px">
		<td colspan="5" class="ta_right va_middle" style="border-bottom: 0; border-top: 0">
			<span class="text_green">작성된 개인정보는 사전통관정보제공 시행국가에 전자적으로 전송됩니다.</span>
		</td>
		<td colspan="7" style="border-top: 0; border-bottom: 0"></td>
	</tr>
	<tr style="font-size: 14px;">
		<td colspan="5" style="border-top: 0">
			<span>
				<span class="text_blue">Postal code&nbsp;&nbsp;</span>
				<span class="text_lg">08281</span>
			</span>
			<span class="text_blue" style="float: right">Rep. of KOREA&nbsp;&nbsp;</span>
		</td>
		<td colspan="7" style="border-top: 0">
			<span style="float: left">
				<span class="text_blue">&nbsp;&nbsp;Postal code&nbsp;&nbsp;</span>
				<span class="text_lg"></span>
			</span>
			<span style="float: right">
				<span class="text_blue" style="letter-spacing: -1px;">Country&nbsp;&nbsp;</span>
				<span style="display:inline-block; white-space: nowrap; max-width: 150px;"><span>CHINA(PEOPLE'S REP)</span></span>
			</span>
		</td>
	</tr>
	<tr>
		<td colspan="9" class="va_middle" style="height: 23px; font-size:15px;">Customs Declaration 세관신고서 CN23</td>
		<td colspan="2" class="va_middle">
			<span style="display: inline-block; padding-left: 6px; float: left">Weight<br>중량</span>
			<span style="display: inline-block; padding: 2px 6px 0 0; float: right; font-size: 16px; font-weight:bold;">
				18700 <span class="text_md">g</span>
			</span>
		</td>
		<td colspan="3" class="va_middle">
			<span style="display: inline-block; padding-left: 6px; float: left">Postage<br>우편요금</span>
			<span style="display: inline-block; padding: 2px 6px 0 0; float: right; font-size: 16px; font-weight:bold;">
			79900<span class="text_md">&nbsp;원</span>
			</span>
		</td>
	</tr>
	<tr style="font-size:8px; letter-spacing: -1px" class="item_header">
		<td colspan="3" class="va_middle" style="height: 25px">Contents 내용 품명(반드시 영문으로 구체적으로 기재)</td>
		<td class="va_middle">Quantity<br>(개수)</td>
		<td class="va_middle">Net Weight<br>(순중량)</td>
		<td class="va_middle">Value<br>(가격:US$)</td>
		<td colspan="2" class="va_middle">HS Tariff<br>Number(Hs)</td>
		<td class="va_middle">Country of<br>Origin(생산지)</td>
		<td colspan="2" rowspan="2" class="va_middle ta_left" style="line-height: 1.2">Guarantee Service<br>배달보장서비스(도착국가기준)<br>(신청시 인터넷우체국 확인가능)</td>
		<td rowspan="2" class="va_middle" style="line-height: 1.2">Country code<br>도착국명 약호</td>
		<td rowspan="2" class="va_middle text_xl" style="font-size: 24px"> C </td>
		<td rowspan="2" class="va_middle text_xl" style="font-size: 24px"> N </td>
	</tr>
	<tr>
		<td colspan="3" class="item_td va_middle ta_left"> PARTS </td>
		<td class="item_td va_middle"></td>
		<td class="item_td"></td>
		<td class="item_td va_middle"> 44</td>
		<td colspan="2" class="item_td va_middle"></td>
		<td class="item_td"></td>
	</tr>
	<tr>
		<td colspan="3" class="item_td va_middle ta_left"></td>
		<td class="item_td va_middle"></td>
		<td class="item_td"></td>
		<td class="item_td va_middle"></td>
		<td colspan="2" class="item_td va_middle"></td>
		<td class="item_td"></td>
		<td colspan="2" rowspan="3" class="ta_left" style="letter-spacing: -1px; padding-top: 2px;">
		요금납부방법 및 기타<br>
		<br>
		<span style="display: inline-block; margin-left: 10px"><i class="fa fa-square-o"></i>&nbsp;현금수납(&nbsp;<i class="fa fa-square-o"></i>감액 시 표시)</span><br>
		<span style="display: inline-block; margin-left: 10px"><i class="fa fa-check-square-o"></i>&nbsp;요금후납</span>
		</td>
		<td colspan="3" rowspan="3" class="ta_left va_top">&nbsp;&nbsp;Signature 담당자서명</td>
	</tr>
	<tr>
		<td colspan="3" class="item_td va_middle ta_left"></td>
		<td class="item_td va_middle"></td>
		<td class="item_td"></td>
		<td class="item_td va_middle"></td>
		<td colspan="2" class="item_td va_middle"></td>
		<td class="item_td"></td>
	</tr>
	<tr>
		<td colspan="3" class="item_td"></td>
		<td class="item_td"></td>
		<td class="item_td"></td>
		<td class="item_td"></td>
		<td colspan="2" class="item_td"></td>
		<td class="item_td"></td>
	</tr>
	<tr>
		<td colspan="5" class="va_middle ta_left item_detailed">
			<i class="fa fa-square-o"></i> Sample 상품견본&nbsp;&nbsp;&nbsp;<i class="fa fa-check-square-o"></i> Gift 선물&nbsp;&nbsp;&nbsp;<i class="fa fa-square-o"></i> Merchandise 상품&nbsp;&nbsp;&nbsp;<i class="fa fa-square-o"></i> 수출면장건
		</td>
		<td colspan="4" rowspan="2" class="text_sm" style="line-height: 1.2">
		Signature 발송인 서명(세관신고서,<br>보험이용여부,받는사람 전화번호 기재필)<br>
		</td>
		<td colspan="2" rowspan="2" class="text_sm" style="line-height: 1.2">
		보험이용여부(음식물, 전자제품 불가)<br>(Shipping insurance)<br>
		<span style="line-height: 30px"><i class="fa fa-square-o"></i>&nbsp;YES</span>
		<span style="display: inline-block; margin-left: 38px"><i class="fa fa-check-square-o"></i>&nbsp;NO</span>
		</td>
		<td colspan="3" rowspan="2" class="text_sm ta_left va_top" style="line-height: 1.2">
		&nbsp;&nbsp;보험가액(Insurance value)
		</td>
	</tr>
	<tr>
	<td colspan="5" class="va_middle ta_left" style="height: 36px;">
	<span style="display: inline-block; padding: 0 0 4px 0; margin-left:6px; border-bottom: 1px solid #000">순번(Specify each shipment. Shipment No.)</span>
	<span style="display: inline-block; position: relative; top: 10px; font-weight: bold">:</span>
	<span style="display: inline-block; position: relative; top: 8px; font-weight: bold">:</span>
	&nbsp;<span style="display: inline-block; padding: 0 0 4px 0; margin-left:4px; border-bottom: 1px solid #000">&nbsp;(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)번째&nbsp;</span><br>
	<span style="display: inline-block; margin-left:46px;">총물수(Total item quantity)</span>
	&nbsp;<span style="display: inline-block; margin-left:52px;">&nbsp;(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)개</span>
	</td>
	</tr>
	</table>
	</div>
	
	
	<div class="eg_template_lower">
		<table class="cn23_table">
			<colgroup>
				<col style="width:1px;"/>
				<col style="width:35px;"/>
				<col style="width:60px;"/>
				<col style="width:19px;"/>
				<col style="width:33px;"/>
				<col style="width:33px;"/>
				<col style="width:25px;"/>
				<col style="width:60px;"/>
			</colgroup>
			<tr>
				<td colspan="8" class="va_middle" style="font-size: 14px;">
					<h2>Customs Declaration(CN23) / Invoice</h2>
				</td>
			</tr>
			<tr>
				<td colspan="4" rowspan="2" class="ta_left va_top">
					<h3>①Shipper/Exporter</h3>
					<p style="height:58px;">
						<span class="sender_name'+idx+'"></span><br>
						<span class="sender_addr'+idx+'"></span>
					</p>
					<p class="sender_phone'+idx+'"></p>
				</td>
				<td colspan="2" class="ta_left va_top"><h3>⑥Carrier</h3></td>
				<td colspan="2" class="ta_left va_top" style="letter-spacing: -1px">
					<h3>⑦Sailing on or about</h3><br>
					<span style="font-size: 14px;" class="add_date'+idx+'"></span>
				</td>
			</tr>
			<tr>
				<td colspan="4" class="ta_left va_top">
					<h3>⑧No & date of invoice</h3><br>
					<span class="text_md add_date'+idx+'"></span>&nbsp;&nbsp;
					<span class="text_md ems_code'+idx+'"></span>
				</td>
			</tr>
			<tr>
				<td colspan="4" rowspan="2" class="ta_left va_top">
					<h3>②For account & risk of Messers</h3>
					<p style="height:58px;">
						<span class="receiver_name'+idx+'"></span><br>
						<span class="receiver_addr'+idx+'"></span>
					</p>
					<p class="receiver_phone'+idx+'"></p>
				</td>
				<td colspan="4" class="ta_left va_top"><h3>⑨No & date of L/C</h3></td>
			</tr>
			<tr>
				<td colspan="4" class="ta_left va_top"><h3>⑩L/C Issuing Bank</h3></td>
			</tr>
			<tr>
				<td colspan="4" class="ta_left va_top" style="height:60px;"><h3>③Notify party</h3></td>
				<td colspan="4" rowspan="2" class="ta_left va_top"><h3>⑪Remarks</h3></td>
			</tr>
			<tr>
				<td class="ta_left va_top" style="letter-spacing: -1px; height: 40px">
					<h3>④Port of loading</h3>
					<span class="text_md" style="line-height: 18px;">KOREA</span>
				</td>
				<td colspan="3" class="ta_left va_top" style="letter-spacing: -1px">
					<h3>⑤Final destination</h3>
					<span class="text_md country_name'+idx+'"></span>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="text_sm va_middle"><h3>⑫Description of Goods</h3></td>
				<td class="va_middle"><h3>⑬Quantity/Unit</h3></td>
				<td class="va_middle" colspan="2"><h3>⑭Unit-Price</h3></td>
				<td class="va_middle" colspan="2"><h3>⑮Amount</h3></td>
				<td class="va_middle"><h3>HS-code</h3><h3></td>
			</tr>
			<tr>
				<td colspan="2" class="ta_left" style="height: 65px;word-break:break-all;"><span class="goods'+idx+'"></span></td>
				<td class="ta_left"><span class="quantity'+idx+'"></span></td>
				<td colspan="2" class="ta_left"><span class="price'+idx+'"></span></td>
				<td colspan="2" class="ta_left"><span class="amount'+idx+'"></span></td>
				<td class="hscode'+idx+'"></td>
			</tr>
			<tr>
				<td colspan="8" class="ta_left va_middle" style="height: 24px;">
					'&nbsp;&nbsp;<b>Total</b>
					<span style="display:inline-block;padding-left:28px;"><span class="total'+idx+'"></span>&nbsp;USD</span>
					<span style="display:inline-block;padding-left:28px;"><b>Signed by</b>&nbsp;<span class="sender_name'+idx+'"></span></span>
				</td>
			</tr>
		</table>
		<table class="cn23_table">
			<colgroup>
				<col style="width:1px;"/>
				<col style="width:35px;"/>
				<col style="width:60px;"/>
				<col style="width:19px;"/>
				<col style="width:33px;"/>
				<col style="width:33px;"/>
				<col style="width:25px;"/>
				<col style="width:60px;"/>
			</colgroup>
			<tr>
				<td colspan="8" class="va_middle" style="font-size: 14px;">
					<h2>Customs Declaration(CN23) / Invoice</h2>
				</td>
			</tr>
			<tr>
				<td colspan="4" rowspan="2" class="ta_left va_top">
					<h3>①Shipper/Exporter</h3>
					<p style="height:58px;">
						<span class="sender_name'+idx+'"></span><br>
						<span class="sender_addr'+idx+'"></span>
					</p>
					<p class="sender_phone'+idx+'"></p>
				</td>
				<td colspan="2" class="ta_left va_top"><h3>⑥Carrier</h3></td>
				<td colspan="2" class="ta_left va_top" style="letter-spacing: -1px">
					<h3>⑦Sailing on or about</h3><br>
					<span style="font-size: 14px;" class="add_date'+idx+'"></span>
				</td>
			</tr>
			<tr>
				<td colspan="4" class="ta_left va_top">
					<h3>⑧No & date of invoice</h3><br>
					<span class="text_md add_date'+idx+'"></span>&nbsp;&nbsp;
					<span class="text_md ems_code'+idx+'"></span>
				</td>
			</tr>
			<tr>
				<td colspan="4" rowspan="2" class="ta_left va_top">
					<h3>②For account & risk of Messers</h3>
					<p style="height:58px;">
						<span class="receiver_name'+idx+'"></span><br>
						<span class="receiver_addr'+idx+'"></span>
					</p>
					<p class="receiver_phone'+idx+'"></p>
				</td>
				<td colspan="4" class="ta_left va_top"><h3>⑨No & date of L/C</h3></td>
			</tr>
			<tr>
				<td colspan="4" class="ta_left va_top"><h3>⑩L/C Issuing Bank</h3></td>
			</tr>
			<tr>
				<td colspan="4" class="ta_left va_top" style="height:60px;"><h3>③Notify party</h3></td>
				<td colspan="4" rowspan="2" class="ta_left va_top"><h3>⑪Remarks</h3></td>
			</tr>
			<tr>
				<td class="ta_left va_top" style="letter-spacing: -1px; height: 40px">
					<h3>④Port of loading</h3>
					<span class="text_md" style="line-height: 18px;">KOREA</span>
				</td>
				<td colspan="3" class="ta_left va_top" style="letter-spacing: -1px">
					<h3>⑤Final destination</h3>
					<span class="text_md country_name'+idx+'"></span>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="text_sm va_middle"><h3>⑫Description of Goods</h3></td>
				<td class="va_middle"><h3>⑬Quantity/Unit</h3></td>
				<td class="va_middle" colspan="2"><h3>⑭Unit-Price</h3></td>
				<td class="va_middle" colspan="2"><h3>⑮Amount</h3></td>
				<td class="va_middle"><h3>HS-code</h3><h3></td>
			</tr>
			<tr>
			<td colspan="2" class="ta_left" style="height: 65px;word-break:break-all;"><span class="goods'+idx+'"></span></td>
			<td class="ta_left"><span class="quantity'+idx+'"></span></td>
			<td colspan="2" class="ta_left"><span class="price'+idx+'"></span></td>
			<td colspan="2" class="ta_left"><span class="amount'+idx+'"></span></td>
			<td class="hscode'+idx+'"></td>
			</tr>
			<tr>
				<td colspan="8" class="ta_left va_middle" style="height: 24px;">
					'&nbsp;&nbsp;<b>Total</b>
					<span style="display:inline-block;padding-left:28px;"><span class="total'+idx+'"></span>&nbsp;USD</span>
					<span style="display:inline-block;padding-left:28px;"><b>Signed by</b>&nbsp;<span class="sender_name'+idx+'"></span></span>
				</td>
			</tr>
		</table>
	</div>';
</page>

</body>
</html>