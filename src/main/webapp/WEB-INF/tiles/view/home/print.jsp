<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);

/* td { 
border: 1px solid gray; border-collapse: collapse;
	margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    font: inherit;
    vertical-align: baseline;
 } */
.no-border{border: none;}
.br_rg{border-right: 1px solid #000;}
.va_top { vertical-align: top }
.va_middle{vertical-align: middle;}
.col-item{letter-spacing: -1.1px; font-size: 8px; line-height: 1.1;}
.text_green { color: #1ca425 }
.text_blue{color: #1970ec; font-size: 11px;}
.text-sm{letter-spacing: -1.5px;}
.text_lg { font-size: 13px !important; font-weight: bold }
.ta_left {text-align: left !important;padding-left: 4px;}
.ta_right {text-align: right !important;padding-right: 4px;}
.tg  {border-collapse:collapse;border-spacing:0;}
td.item_td {
	border-bottom: 1px dashed #CCC;
	border-top: 1px dashed #CCC;
	font-size: 12px;
}
td{
/*overflow:hidden;
word-break:normal; */

font-family:'Noto Sans KR', 'Noto Sans SC', 'Microsoft Yahei',  sans-serif !important ;
border: 1px solid #000;
height: 19px;
text-align: center;
font-size: 10px; 
margin: 0;
padding: 0;
}
.tg h1,h2,h3,h4,h5,h6{
margin: 0;
letter-spacing: -1px;
}
@page {
    size: A4;
    margin: 0;
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
    tbody::after {
        content: ''; display: block;
        page-break-after: always;
        page-break-inside: avoid;
        page-break-before: avoid;        
    }
    div.invoice{
      width : 190mm;
    }
  
}

</style>
<body>
<div> 
    <a href="#" onClick="window.print();">Print</a>
</div>
<!-- start:main -->
<page size="A4"> 

<div class="invoice" style="padding: 5% 5% 5% 5%; height: 40%; border-bottom: 1px solid gray;">
<table class="tg">
	<colgroup> <!-- 808 * 450  189 -->
		<col style="width:3.5%;"/>
		<col style="width:8.5%;"/>
		<col style="width:17.8%;"/>
		<col style="width:6%;"/>
		<col style="width:6%;"/>
		<col style="width:6.3%;"/>
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
    <td class="no-border" colspan="5"  rowspan="3" >
    	<h1>EG710143073KR</h1>
    	<object type="image/bmp" data="data:image/bmp;base64,Qk12EwAAAAAAADYAAAAoAAAAsAAAABwAAAABABgAAAAAAEATAAATCwAAEwsAAAAAAAAAAAAA////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////////////////////////////////////////////AAAAAAAA////AAAA////////AAAA////////////////AAAA////////////AAAAAAAA////AAAA////////////AAAAAAAA////AAAA////////////AAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAAAAAAAAAA////AAAA////////AAAAAAAA////AAAA////////////////AAAAAAAA////////AAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////////AAAAAAAA////////////AAAA////////AAAA////AAAAAAAAAAAAAAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAAAAAAAAAA////////AAAA////AAAAAAAA////////////AAAAAAAAAAAA////AAAAAAAA////////////AAAA////AAAAAAAAAAAA////AAAAAAAA////////AAAA////AAAA////////////////AAAAAAAA////////////AAAAAAAAAAAA////AAAA////AAAAAAAA////////////////////////////////////////" style="width: 98%;"></object>
    </td>
    <td class="no-border" colspan="8" style="height: 40px;"></td>
  </tr>
  <tr>
    <td class="no-border" colspan="2" rowspan="2"><div class="">Item No.<br>우편물<br>번호</div></td>
    <td class="va_middle" colspan="4">Date & Time Posted 접수년월일시</td>
    <td class="va_middle" colspan="4">2016.06.20 &nbsp;&nbsp; 17:57:06</td>
  </tr>
  <tr>
    <td class="va_middle" colspan="4">Post office code 우편용국기호</td>
    <td class="va_middle" colspan="4">1000114</td>
  </tr>
  <tr>
    <td class="" rowspan="5"><span style="font-size: 9px">From</span><br><br>보<br>내<br>는<br><br>사<br>람</td>
    <td class="ta_left" colspan="5"><span class="text_blue">Tel. No. </span><span class="text_lg">010-8292-9888</span></td>
    <td class="" rowspan="5"><span style="font-size: 9px">To</span><br><br>받<br><br>는<br><br>사<br><br>람</td>
    <td class="ta_left" colspan="8"><span class="text_blue">Tel. No. </span><span class="text_lg">18606888808</span></td>
  </tr>
  <tr>
    <td class="ta_left" colspan="5"><span class="text_blue">Name(영문)&nbsp;</span><span class="text_lg">Hanseong Logis</span></td>
    <td class="ta_left" colspan="8"><span class="text_blue">Name(영문)&nbsp;</span><span class="text_lg">黄铎</span></td>
  </tr>
  <tr>
    <td class="no-border ta_left va_top" style="height: 100px;" colspan="5">
    	<span class="text_blue">Address&nbsp;</span><br>
			<span class="text_lg">서울 구로구 구로동 468 1층</span><br>
			
    </td>
    <td class="no-border ta_left br_rg va_top" colspan="8">
    	<span class="text_blue">Address&nbsp;</span><br>
			<span class="text_lg">上海市金山区亭林镇亭塔路47号</span>
    </td>
  </tr>
  <tr>
    <td class="va_middle no-border" colspan="5">
    	<span class="text_blue" style="float: left;">e-mail</span><br>
    	<span class="text_green" style="letter-spacing: -1px; float: right;">작성된 개인정보는 사전통관정보제공 시행국가에 전자적으로 전송됩니다.</span>
    </td>
    <td class="no-border br_rg" colspan="8"></td>
  </tr>
  <tr>
    <td class="no-border" colspan="5">
		<span>
				<span class="text_blue">Postal code&nbsp;&nbsp;</span>
				<span class="text_lg">08281</span>
			</span>
			<span class="text_blue" style="float: right">Rep. of KOREA&nbsp;&nbsp;</span>
	</td>
    <td class="no-border br_rg" colspan="8">
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
    <td class="va_middle ta_left" colspan="9">Customs Declaration 세관신고서 <span style="float: right;">CN23</span></td>
    <td class="va_middle" colspan="3" style="line-height: 1.1">
		<span style="display: inline-block; padding-left: 6px; float: left">Weight<br>중량</span>
			<span style="display: inline-block; padding: 2px 6px 0 0; float: right; font-size: 16px; font-weight:bold;">
				18700 <span class="text_md">g</span>
			</span>
	</td>
    <td class="va_middle" colspan="3" style="line-height: 1.1">
    	<span style="display: inline-block; padding-left: 6px; float: left">Postage<br>우편요금</span>
			<span style="display: inline-block; padding: 2px 6px 0 0; float: right; font-size: 16px; font-weight:bold;">
			79900<span class="text_md">&nbsp;원</span>
			</span>
    </td>
  </tr>
  <tr class="col-item">
    <td class="va_middle" colspan="3">Contents 내용 품명(반드시 영문으로 구체적으로 기재)</td>
    <td class="va_middle">Quantity<br>(개수)</td>
    <td class="va_middle">Net Weight<br>(순중량)</td>
    <td class="va_middle">Value<br>(가격:US$)</td>
    <td class="va_middle" colspan="2">HS Tariff<br>Number(Hs)</td>
    <td class="va_middle">Country of<br>Origin(생산지)</td>
    <td class="va_middle" colspan="3" rowspan="2">Guarantee Service<br>배달보장서비스(도착국가기준)<br>(신청시 인터넷우체국 확인가능)</td>
    <td class="va_middle" rowspan="2">Country code<br>도착국명 약호</td>
    <td class="va_middle" rowspan="2"> C </td>
    <td class="va_middle" rowspan="2"> N </td>
  </tr>
  <tr>
    <td class="item_td va_middle" colspan="3">PARTS</td>
    <td class="item_td va_middle"></td>
    <td class="item_td va_middle"></td>
    <td class="item_td va_middle">44</td>
    <td class="item_td va_middle" colspan="2"></td>
    <td class="item_td "></td>
  </tr>
  <tr>
    <td class="item_td va_middle" colspan="3"></td>
    <td class="item_td va_middle"></td>
    <td class="item_td va_middle"></td>
    <td class="item_td va_middle"></td>
    <td class="item_td va_middle" colspan="2"></td>
    <td class="item_td va_middle"></td>
    <td class="" colspan="3" rowspan="3">
    	요금납부방법 및 기타<br>
		<br>
		<span style="display: inline-block; margin-left: 10px"><i class="fa fa-square-o"></i>&nbsp;현금수납(&nbsp;<i class="fa fa-square-o"></i>감액 시 표시)</span><br>
		<span style="display: inline-block; margin-left: 10px"><i class="fa fa-check-square-o"></i>&nbsp;요금후납</span>
    </td>
    <td class="" colspan="3" rowspan="3">Signature 담당자서명</td>
  </tr>
  <tr>
    <td class="item_td va_middle" colspan="3"></td>
    <td class="item_td va_middle"></td>
    <td class="item_td "></td>
    <td class="item_td va_middle"></td>
    <td class="item_td va_middle" colspan="2"></td>
    <td class="item_td"></td>
  </tr>
  <tr>
    <td class="item_td va_middle" colspan="3"></td>
    <td class="item_td va_middle"></td>
    <td class="item_td "></td>
    <td class="item_td va_middle"></td>
    <td class="item_td va_middle" colspan="2"></td>
    <td class="item_td "></td>
  </tr>
  <tr>
    <td class="va_middle" colspan="5">
    	<i class="fa fa-square-o"></i> Sample 상품견본&nbsp;&nbsp;&nbsp;<i class="fa fa-check-square-o"></i> Gift 선물&nbsp;&nbsp;&nbsp;<i class="fa fa-square-o"></i> Merchandise 상품&nbsp;&nbsp;&nbsp;<i class="fa fa-square-o"></i> 수출면장건
    </td>
    <td class="text-sm" colspan="4" rowspan="2">Signature 발송인 서명(세관신고서,<br>보험이용여부,받는사람 전화번호 기재필)<br></td>
    <td class="text-sm" colspan="3" rowspan="2">
    	보험이용여부(음식물, 전자제품 불가)<br>(Shipping insurance)<br>
		<span style="line-height: 30px"><i class="fa fa-square-o"></i>&nbsp;YES</span>
		<span style="display: inline-block; margin-left: 38px"><i class="fa fa-check-square-o"></i>&nbsp;NO</span>
    </td>
    <td class="text-sm" colspan="3" rowspan="2">보험가액(Insurance value)</td>
  </tr>
  <tr>
    <td class="va_middle" colspan="5">
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
<div style="height: 2%">

</div>

<div class="invoice" style="float: left; padding: 0 0 0 5%; width: 42.5%">
	<table class="tg">
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
    <td class="tg-031e" colspan="8"><h2>Customs Declaration(CN23) / Invoice</h2></td>
  </tr>
  <tr>
    <td class="tg-031e" colspan="4" rowspan="2">
    	<h4>①Shipper/Exporter</h4>
			Hanseong Logis<br>
			서울 구로구 구로동 468 1층
		010-8292-9888
    </td>
    <td class="tg-yw4l" colspan="2"><h4>⑥Carrier</h4></td>
    <td class="tg-yw4l" colspan="2">
    	<h4>⑦Sailing on or about</h4><br>
		2016-06-20
    </td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="4">
    	<h4>⑧No & date of invoice</h4><br>
		2016-06-20 &nbsp;&nbsp;
		EG710143087KR
    </td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="4" rowspan="2">
    	<h4>②For account & risk of Messers</h4>
			温曦<br>
			上海市金山区亭林镇桃贤路11号 (CHINA(PEOPLE'S REP))
		15058111812
    </td>
    <td class="tg-yw4l" colspan="4"><h4>⑨No & date of L/C</h4></td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="4"><h4>⑩L/C Issuing Bank</h4></td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="4" style="height: 40px;"><h4>③Notify party</h4></td>
    <td class="tg-yw4l" colspan="4" rowspan="2"><h4>⑪Remarks</h4></td>
  </tr>
  <tr>
    <td class="tg-yw4l">
    	<h4>④Port of loading</h4>
		KOREA
    </td>
    <td class="tg-yw4l" colspan="3">
    	<h4>⑤Final destination</h4>
		CHINA(PEOPLE'S REP)
    </td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="2"><h4 style="letter-spacing: -1px">⑫Description of Goods</h4></td>
    <td class="tg-yw4l"><h4>⑬Quantity/Unit</h4></td>
    <td class="tg-yw4l" colspan="2"><h4>⑭Unit-Price</h4></td>
    <td class="tg-yw4l" colspan="2"><h4>⑮Amount</h4></td>
    <td class="tg-yw4l" ><h4>HS-code</h4></td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="2">PARTS</td>
    <td class="tg-yw4l">/</td>
    <td class="tg-yw4l" colspan="2">USD</td>
    <td class="tg-yw4l" colspan="2">USD 41</td>
    <td class="tg-yw4l"></td>
  </tr>
  <tr>
  	<td class="tg-yw4l" colspan="2"></td>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l" colspan="2"></td>
    <td class="tg-yw4l" colspan="2"></td>
    <td class="tg-yw4l"></td>
  </tr>
  <tr>
  	<td class="tg-yw4l" colspan="2"></td>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l" colspan="2"></td>
    <td class="tg-yw4l" colspan="2"></td>
    <td class="tg-yw4l"></td>
  </tr>
  <tr>
  	<td class="tg-yw4l" colspan="2"></td>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l" colspan="2"></td>
    <td class="tg-yw4l" colspan="2"></td>
    <td class="tg-yw4l"></td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="8">
    	<b>Total</b>
		41 USD
		<b>Signed by</b> Hanseong Logis
    </td>
  </tr>
</table>
</div>
<div class="invoice" style="float: left; padding: 5% 5% 0 5%; width: 90%">
<table class="tg">
<colgroup>
		<col style="width:9.5%;"/>
		<col style="width:18.9%;"/>
		<col style="width:42.5%;"/>
		<col style="width:14.8%;"/>
		<col style="width:14.3%;"/>
	</colgroup>
  <tr>
    <td class="tg-031e">보내는 사람<br>(FROM)</td>
    <td class="tg-031e"> Hanseong Logis</td>
    <td class="tg-031e" rowspan="2">바코드</td>
    <td class="tg-yw4l">Country
CHINA(PEOPLE'S REP)</td>
    <td class="tg-yw4l">Weight
18900 g</td>
  </tr>
  <tr>
    <td class="tg-031e">받는 사람<br>(TO)</td>
    <td class="tg-031e">温曦</td>
    <td class="tg-yw4l">2016-06-20
17:57</td>
    <td class="tg-yw4l">Postage
79,900 원
    </td>
  </tr>
</table>
</div>
</page>
</div>
</body>
</html>