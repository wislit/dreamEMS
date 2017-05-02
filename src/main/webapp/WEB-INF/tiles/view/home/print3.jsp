<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font-awesome.min.css" />
<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);

.no-border{border: none;}
.br-right{border-right: 1px solid #000;}
.br-left{border-left: 1px solid #000; }
.br-bottom{border-bottom: 1px solid #000;}
.va-top{ vertical-align: top }
.va-middle{vertical-align: middle;}
.text-green {color: #1ca425;}
.text-blue{color: #1970ec;}

.ls-sm{ letter-spacing: -1.5px; }
.ls-md{letter-spacing: -0.5px; }
.text-lg { font-size: 13px; font-weight: bold; }
.ft-left{float: left; padding-left: 4px;}
.ft-right{float: right; padding-right: 4px;}

.ta-left {text-align: left; padding-left: 4px;}
.ta-right {text-align: right; padding-right: 4px;}


.default{padding: 5% 5% 5% 5%; height: 40%; border-bottom: 1px dashed  #000;}
.invoice{float: left; padding: 0 0 0 5%; width: 42.5%}
.invoice td.base-h{height: 50px;}
.invoice .va-middle{line-height: 25px;}
.footer{float: left; padding: 4% 5% 0 5%; width: 90%}

.div-label{padding: 0 2%; width: 60%;}

.addr-h{height: 110px !important;}
.tb-print2 .addr-h{height: 80px !important;}

.tb-print2 .ls-xs{letter-spacing: -2px;}
.tb-print, .tb-print2{border-collapse:collapse;border-spacing:0; width: 100%;}
tr.col-item{letter-spacing: -1.1px; font-size: 8px; line-height: 1.1;}
td.item-td {
	border-bottom: 1px dashed #CCC;
	border-top: 1px dashed #CCC;
	/* font-size: 12px; */
}
td{
/*overflow:hidden;
word-break:normal; */

font-family:'Noto Sans KR', 'Noto Sans SC', 'Microsoft Yahei',  sans-serif !important ;
border: 1px solid #000;
text-align: center;

margin: 0;
padding: 0;
}
.tb-print td{height: 19px; font-size: 10px; }
.tb-print2 td{height: 14px; font-size: 8px; }
.tb-print2 .col-item{letter-spacing: -2px;}
.tb-print2 .view-a4{display: none;}

.tb-print2 .ls-sm{letter-spacing: -2px;}

.tb-print .barcode-num{font-size: 20px;}
.tb-print2 .barcode-num{font-size: 16px;}

.tb-print h1,h2,h3,h4,h5,h6,
.tb-print2 h1,h2,h3,h4,h5,h6{
margin: 0;
letter-spacing: -1px;
}
body {
  background: rgb(204,204,204); 
}
.a4 {
  background: white;
  width: 21cm;
  height: 29.7cm;
  display: block;
  margin: 0 auto;
  margin-bottom: 0.5cm;
  box-shadow: 0 0 0.5cm rgba(0,0,0,0.5);
  page: a4;
}
div.label {
  background: white;
  width: 271mm;
  height: 110mm;
  display: block;
  margin: 0 auto;
  margin-bottom: 0.5cm;
  box-shadow: 0 0 0.5cm rgba(0,0,0,0.5);
  
}

/* @page a4{
    size: A4;
    margin: 0;
}
@page main{
	size: letter;
    margin: 0;
} */
@page{
    size: 110mm 271mm;
    margin: 0;
}

@page label{
    size: 271mm 110mm;
    margin: 0;
}
div.label{page: label;}
@media print {
    body{
    margin: 0;
    box-shadow: 0;
  }
    tbody::after {
        content: ''; display: block;
        page-break-after: always;
        page-break-inside: avoid;
        page-break-before: avoid;        
    }
    .div-a4{
      width : 190mm;
    }
    div.none{
    	display: none;
    }
    .div-label{
      width : 162mm;
    }
  
}

</style>
<body>
<div class="none"> 
    <a href="#" onClick="window.print();">Print</a>
</div>
<!-- start:main -->
<!-- <page size="A4">
<div class="a4">
<div class="div-a4 default">
<table class="tb-print"> -->

<div class="label">
<div class="div-label">
<table class="tb-print2">

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
    	<span class="barcode-num">EG710143073KR</span>
    	<object type="image/bmp" style="width: 98%; height: 50px;" data="data:image/bmp;base64,Qk12EwAAAAAAADYAAAAoAAAAsAAAABwAAAABABgAAAAAAEATAAATCwAAEwsAAAAAAAAAAAAA////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////"></object>
    </td>
    <td class="no-border" colspan="8" style="height: 50px;"></td>
  </tr>
  <tr>
    <td class="no-border" colspan="2" rowspan="2">Item No.<br>우편물 번호</td>
    <td class="va-middle" colspan="4">Date & Time Posted 접수년월일시</td>
    <td class="va-middle" colspan="4">2016.06.20 &nbsp;&nbsp; 17:57:06</td>
  </tr>
  <tr>
    <td class="va-middle" colspan="4">Post office code 우편용국기호</td>
    <td class="va-middle" colspan="4">1000114</td>
  </tr>
  <tr>
    <td class="text-lg" rowspan="5">
    	<span style="font-size: 9px">From</span><br><br>보<br>내<br>는<br><br>사<br>람</td>
    <td class="ta-left" colspan="5">
    	<span class="text-blue">Tel. No. </span>
    	<span class="text-lg">010-8292-9888</span></td>
    <td class="text-lg" rowspan="5">
    	<span style="font-size: 9px">To</span><br><br>받<br><br>는<br><br>사<br><br>람
    </td>
    <td class="ta-left" colspan="8">
    	<span class="text-blue">Tel. No. </span>
    	<span class="text-lg">18606888808</span>
    </td>
  </tr>
  <tr>
    <td class="ta-left" colspan="5">
    	<span class="text-blue">Name(영문)&nbsp;</span>
    	<span class="text-lg">Hanseong Logis</span>
    </td>
    <td class="ta-left" colspan="8">
    	<span class="text-blue">Name(영문)&nbsp;</span>
    	<span class="text-lg">黄铎</span>
    </td>
  </tr>
  <tr>
    <td class="no-border ta-left va-top addr-h" colspan="5">
    	<span class="text-blue">Address&nbsp;</span><br>
		<span class="text-lg">서울 구로구 구로동 468 1층</span>
    </td>
    <td class="no-border ta-left va-top br-right" colspan="8">
    	<span class="text-blue">Address&nbsp;</span><br>
		<span class="text-lg">上海市金山区亭林镇亭塔路47号</span>
    </td>
  </tr>
  <tr>
    <td class="va-middle no-border" colspan="5">
    	<span class="text-blue ft-left">e-mail</span><br>
    	<span class="text-green ft-right" style="letter-spacing: -1px;">작성된 개인정보는 사전통관정보제공 시행국가에 전자적으로 전송됩니다.</span>
    </td>
    <td class="no-border br-right" colspan="8"></td>
  </tr>
  <tr>
    <td class="no-border" colspan="5">
		<span class="text-blue ft-left" style="line-height:19px;">Postal code</span>
		<span class="text-lg">08281</span>
		<span class="text-lg ft-right text-blue">Rep. of KOREA</span>
	</td>
    <td class="no-border br-right" colspan="8">
			<span class="text-blue ft-left" style="line-height:19px;">Postal code</span>
			<span class="text-lg ft-left"></span>
			<span class="text-lg ft-right" style="display:inline-block; white-space: nowrap; max-width: 150px;">
			CHINA(PEOPLE'S REP)
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
			18700 <span style="font-size: 11px">g</span>
		</span>
	</td>
    <td class="va-middle" colspan="3" style="line-height: 1.1">
    	<span style="display: inline-block; padding-left: 6px; float: left">Postage<br>우편요금</span>
		<span style="display: inline-block; padding: 2px 6px 0 0; float: right; font-weight:bold;">
		79900 <span style="font-size: 11px">원</span>
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
    <td class="va-middle text-lg" style="font-size: 20px;" rowspan="2"> C </td>
    <td class="va-middle text-lg" style="font-size: 20px;" rowspan="2"> N </td>
  </tr>
  <tr>
    <td class="item-td va-middle ta-left" colspan="3">PARTS</td>
    <td class="item-td va-middle"></td>
    <td class="item-td va-middle"></td>
    <td class="item-td va-middle">44</td>
    <td class="item-td va-middle" colspan="2"></td>
    <td class="item-td "></td>
  </tr>
  <tr>
    <td class="item-td va-middle ta-left" colspan="3"></td>
    <td class="item-td va-middle"></td>
    <td class="item-td va-middle"></td>
    <td class="item-td va-middle"></td>
    <td class="item-td va-middle" colspan="2"></td>
    <td class="item-td va-middle"></td>
    <td class="va-top ta-left" colspan="3" rowspan="3">
    	요금납부방법 및 기타
		<span style="display: inline-block;"><i class="fa fa-square-o"></i>&nbsp;현금수납(<i class="fa fa-square-o"></i>감액 시 표시)</span><br>
		<span style="display: inline-block;"><i class="fa fa-check-square-o"></i>&nbsp;요금후납</span>
    </td>
    <td class="va-top ta-left" colspan="3" rowspan="3">Signature 담당자서명</td>
  </tr>
  <tr>
    <td class="item-td va-middle ta-left" colspan="3"></td>
    <td class="item-td va-middle"></td>
    <td class="item-td "></td>
    <td class="item-td va-middle"></td>
    <td class="item-td va-middle" colspan="2"></td>
    <td class="item-td"></td>
  </tr>
  <tr>
    <td class="item-td va-middle ta-left" colspan="3"></td>
    <td class="item-td va-middle"></td>
    <td class="item-td "></td>
    <td class="item-td va-middle"></td>
    <td class="item-td va-middle" colspan="2"></td>
    <td class="item-td "></td>
  </tr>
  <tr>
    <td class="va-middle ls-md ls-xs" colspan="5">
    	<i class="fa fa-square-o"></i> Sample 상품견본&nbsp;&nbsp;&nbsp;
    	<i class="fa fa-check-square-o"></i> Gift 선물&nbsp;&nbsp;&nbsp;
    	<i class="fa fa-square-o"></i> Merchandise 상품&nbsp;&nbsp;&nbsp;
    	<i class="fa fa-square-o"></i> 수출면장건
    </td>
    <td class="ls-sm va-top ls-xs" colspan="4" rowspan="2">Signature 발송인 서명(세관신고서,<br>보험이용여부,받는사람 전화번호 기재필)</td>
    <td class="ls-sm va-top ls-xs" colspan="3" rowspan="2">
    	<div>보험이용여부(음식물, 전자제품 불가)(Shipping insurance)</div>
    	<div> 
			<span style="line-height: 25px;"><i class="fa fa-square-o"></i>&nbsp;YES</span>
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
<div style="height: 2%"></div>

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
			Hanseong Logis<br>
			서울 구로구 구로동 468 1층
		010-8292-9888
    </td>
    <td class="va-top ta-left base-h" colspan="2"><h4>⑥Carrier</h4></td>
    <td class="va-top ta-left base-h" colspan="2">
    	<h4 style="letter-spacing: -1.2px;">⑦Sailing on or about</h4>
		<span class="va-middle">
			2016.06.20
		</span>
    </td>
  </tr>
  <tr>
    <td class="va-top ta-left base-h" colspan="4">
    	<h4>⑧No & date of invoice</h4>
		<span class="va-middle">
			2016.06.20 &nbsp;&nbsp;
			EG710143087KR
		</span>
    </td>
  </tr>
  <tr>
    <td class="va-top ta-left" colspan="4" rowspan="2">
    	<h4>②For account & risk of Messers</h4>
			温曦<br>
			上海市金山区亭林镇桃贤路11号 (CHINA(PEOPLE'S REP))
		15058111812
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
		CHINA(PEOPLE'S REP)
    </td>
  </tr>
  <tr>
    <td class="" colspan="2"><h4 style="letter-spacing: -1px">⑫Description of Goods</h4></td>
    <td class=""><h4>⑬Quantity/Unit</h4></td>
    <td class="" colspan="2"><h4>⑭Unit-Price</h4></td>
    <td class="" colspan="2"><h4>⑮Amount</h4></td>
    <td class="" ><h4>HS-code</h4></td>
  </tr>
  <tr>
    <td class="no-border br-left ta-left" colspan="2">PARTS</td>
    <td class="no-border br-left">/</td>
    <td class="no-border br-left ta-left" colspan="2">USD</td>
    <td class="no-border br-left ta-left" colspan="2">USD 41</td>
    <td class="no-border br-left br-right ta-left"></td>
  </tr>
  <tr>
  	<td class="no-border br-left ta-left" colspan="2"></td>
    <td class="no-border br-left"></td>
    <td class="no-border br-left ta-left" colspan="2"></td>
    <td class="no-border br-left ta-left" colspan="2"></td>
    <td class="no-border br-left br-right ta-left"></td>
  </tr>
  <tr>
  	<td class="no-border br-left ta-left" colspan="2"></td>
    <td class="no-border br-left"></td>
    <td class="no-border br-left ta-left" colspan="2"></td>
    <td class="no-border br-left ta-left" colspan="2"></td>
    <td class="no-border br-left br-right ta-left"></td>
  </tr>
  <tr>
  	<td class="no-border br-left ta-left" colspan="2"></td>
    <td class="no-border br-left"></td>
    <td class="no-border br-left ta-left" colspan="2"></td>
    <td class="no-border br-left ta-left" colspan="2"></td>
    <td class="no-border br-left br-right ta-left"></td>
  </tr>
  <tr>
    <td class="ta-left" colspan="8">
    	<div class="ft-left" style="width: 20%"><b>Total</b></div>
    	<div class="ft-left" style="width: 25%">41 USD</div>
    	<div class="ft-left" style="width: 50%"><b>Signed by</b> Hanseong Logis</div>
    	
		
    </td>
  </tr>
</table>
</div>
<div class="div-a4 footer">
<table class="tb-print">
<colgroup>
		<col style="width:9.5%;"/>
		<col style="width:18.9%;"/>
		<col style="width:42.5%;"/>
		<col style="width:14.8%;"/>
		<col style="width:14.3%;"/>
	</colgroup>
  <tr>
    <td class="no-border br-bottom">보내는 사람<br>(FROM)</td>
    <td class="no-border br-bottom br-right ta-left"> Hanseong Logis</td>
    <td class="no-border br-right" rowspan="2">
    	<object type="image/bmp" data="data:image/bmp;base64,Qk12EwAAAAAAADYAAAAoAAAAsAAAABwAAAABABgAAAAAAEATAAATCwAAEwsAAAAAAAAAAAAA////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////" style="width: 98%;"></object>
		<h2>EG710143073KR</h2>
	</td>
    <td class="no-border br-bottom br-right">
    	<div class="ta-left" style="line-height: 6px;">Country</div>
    	<div style="line-height: 11px;">CHINA(PEOPLE'S REP)EOPLE'S REP</div>
    	<!-- (PEOPLE'S REP) --> 
	</td>
    <td class="no-border br-bottom">
    	<div class="ta-left">Weight</div>
    	<div class="ta-right">18900 g</div>
	</td>
  </tr>
  <tr>
    <td class="no-border">받는 사람<br>(TO)</td>
    <td class="no-border br-right ta-left">温曦</td>
    <td class="no-border br-right">2016-06-20<br>17:57</td>
    <td class="no-border">
    	<div class="ta-left">Postage</div>
    	<div class="ta-right">79,900 원</div>
    </td>
  </tr>
</table>
</div>
</div>
</body>
</html>