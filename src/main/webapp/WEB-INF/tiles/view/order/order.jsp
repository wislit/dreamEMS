<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
td{
overflow:hidden;
word-break:normal;

font-family:'Noto Sans KR', 'Noto Sans SC', 'Microsoft Yahei',  sans-serif !important ;
border: 1px solid #000;
text-align: center;

margin: 0;
padding: 3px;
}

tr.col-item{letter-spacing: -1.7px; line-height: 1.1;}

.no-border{border: none;}
.br-right{border-right: 1px solid #000;}
.br-left{border-left: 1px solid #000; }
.br-bottom{border-bottom: 1px solid #000;}
.va-top{ vertical-align: top }
.va-middle{vertical-align: middle;}
.ft-left{float: left; padding-left: 4px;}
.ft-right{float: right; padding-right: 4px;}

.text-green {color: #1ca425;}
.text-blue{color: #1970ec;}
.ta-left {text-align: left; padding-left: 4px;}
.ta-right {text-align: right; padding-right: 4px;}
.text-lg { font-size: 16px; font-weight: bold; }
.ls-sm{ letter-spacing: -1.5px; }
.ls-md{letter-spacing: -0.5px; }

.warning { border: 1px solid rgb(243, 57, 70); background-color: rgb(253, 250, 245);}
</style>
        <!-- start:main -->
        <div class="container">
            <div id="main">
                <!-- start:breadcrumb -->
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">접수</a></li>
                    <li class="active">일반접수</li>
                </ol>
                <!-- end:breadcrumb -->   
                
                <div class="row">
                    <div class="col-lg-12">
                        <h3 class="page-header">
                            	일반접수
                        </h3>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-md-12"><!-- TODO : col-md-12 가 뭔지모름  -->
                        <div class="panel">
                            <div class="panel-body">
                            	 <form class="form-horizontal" role="form" id="registForm">
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
    <td class="no-border" colspan="2">
    	<input type="hidden" name="userNo" value="<sec:authentication property="principal.no"/>">
    	<input type="hidden" name="premiumCd" value="31">
    	<!-- TODO : 이건 어떻게 구분하나 -->
    	<input type="hidden" name="emEE" value="em">
    </td>
    <td class="no-border" colspan="5" rowspan="3" >
    </td>
    <td class="no-border" colspan="8" style="height: 50px;"></td>
  </tr>
  <tr>
    <td class="no-border" colspan="2" rowspan="2"></td>
    <td class="va-middle" colspan="4">Date & Time Posted 접수년월일시</td>
    <td class="va-middle" colspan="4">
           	<!-- <span class="input-group-addon input-group-addon-info"><i class="fa fa-calendar"></i></span> -->
           <!--  <input type="text" class="form-control input-sm" id="dp1" name="orderDate" > -->
           <jsp:useBean id="now" class="java.util.Date"/>    
			<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />
    </td>
  </tr>
  <tr>
    <td class="va-middle" colspan="4">Post office code 우편용국기호</td>
    <td class="va-middle" colspan="4"></td>
  </tr>
  <tr>
    <td class="text-lg" rowspan="3">
    	<span style="font-size: 9px">From</span><br><br>보<br>내<br>는<br><br>사<br>람</td>
    <td class="" colspan="5">
            <label for="" class="col-sm-3 control-label text-blue">Tel. No.</label>
            <div class="col-sm-8 control-label" style="text-align: left;">
            	<sec:authentication property="principal.senderTelNo"/>
                <input type="hidden" class="form-control" disabled="" name="senderTelNo" value="<sec:authentication property="principal.senderTelNo"/>">
            </div>
    <td class="text-lg" rowspan="3">
    	<span style="font-size: 9px">To</span><br><br>받<br><br>는<br><br>사<br><br>람
    </td>
    <td class="" colspan="8">
            <label for="" class="col-sm-3 control-label text-blue">Tel. No.</label>
            <div class="col-sm-8"> 
                <input type="text" placeholder="수취인연락처" class="form-control warning" name="receiveTelNo" value="">
            </div>
    </td>
  </tr>
  <tr>
    <td class="" colspan="5">
            <label for="" class="col-sm-3 control-label text-blue">Name(영문)</label>
            <div class="col-sm-8 control-label" style="text-align: left;">
            	<sec:authentication property="principal.sender"/>
                <input type="hidden" class="form-control" id="" name="sender" disabled="" value="<sec:authentication property="principal.sender"/>"> 
            </div>
    </td>
    <td class="" colspan="8">
            <label for="" class="col-sm-3 control-label text-blue">Name(영문)</label>
            <div class="col-sm-8">
                <input type="text" class="form-control warning" id="" placeholder="수취인 이름" name="receiveName" value="">
            </div>
    </td>
  </tr>
  <tr>
    <td class="no-border va-top addr-h" colspan="5">
    	<div class="col-sm-12" style="margin-bottom: 5px; padding: 0px;">
    		<label for="" class="col-sm-3 control-label text-blue">우편번호</label>
            <div class="col-sm-4 control-label" style="text-align: left;">
            	<sec:authentication property="principal.senderZipCode"/>
                <input type="hidden" class="form-control" id="" disabled="" name="senderZipCode" value="<sec:authentication property="principal.senderZipCode"/>">
            </div>
    	</div> 
            <label for="" class="col-sm-3 control-label text-blue">Address</label>
            <div class="col-sm-8 control-label" style="text-align: left;"> 
            	<sec:authentication property="principal.senderAddr1"/> <sec:authentication property="principal.senderAddr2"/>
            	<input type="hidden" class="form-control" id="" disabled="" name="senderZipCode" value="<sec:authentication property="principal.senderTelNo"/>">
            </div>
    </td>
    <td class="no-border ta-left va-top br-right" colspan="8">
    		<label for="inputEmail1" class="col-sm-3 control-label text-blue">국가</label>
            <div class="col-sm-4">
            	<div class="col-sm-12" style="margin-bottom: 5px; padding: 0px;">
	                <select class="form-control warning" id="nation" style="width:140px !important;" name="countryCd">
	                	<option value="">국가선택</option>
	                	<optgroup label="[ 자주 보내는 국가 목록 ]">
							<option value="CN">[CN] 중국 (CHINA)</option>
							<option value="HK">[HK] 홍콩 (HONG KONG)</option>
							<option value="MO">[MO] 마카오 (MACAO)</option>
							<option value="US">[US] 미국 (USA)</option>
							<option value="JP">[JP] 일본 (JAPAN)</option>
							<option value="AU">[AU] 호주 (AUSTRALIA)</option>
							<option value="CA">[CA] 캐나다 (CANADA)</option>
							<option value="RU">[RU] 러시아 (RUSSIAN FEDERATION)</option>
							<option value="TW">[TW] 대만 (TAIWAN)</option>
							<option value="SG">[SG] 싱가폴 (SINGAPORE)</option>
							<option value="GB">[GB] 영국 (UNITED KINGDOM)</option>
							<option value="MY">[MY] 말레이시아 (MALAYSIA)</option>
							<option value="FR">[FR] 프랑스 (FRANCE)</option>
							<option value="TH">[TH] 태국 (THAILAND)</option>
							<option value="NZ">[NZ] 뉴질랜드 (NEW ZEALAND)</option>
							<option value="DE">[DE] 독일 (GERMANY)</option>
							<option value="ES">[ES] 스페인 (SPAIN)</option>
							<option value="VN">[VN] 베트남 (VIET NAM)</option>
							<option value="CH">[CH] 스위스 (SWITZERLAND)</option>
							<option value="ID">[ID] 인도네시아 (INDONESIA)</option>
							<option value="AE">[AE] 아랍에미리트 (U.A.E)</option>
							<option value="PH">[PH] 필리핀 (PHILIPPINES)</option>
							<option value="KZ">[KZ] 카자흐스탄 (KAZAKHSTAN)</option>
							<option value="IL">[IL] 이스라엘 (ISRAEL)</option>
							<option value="IN">[IN] 인도 (INDIA)</option>
						</optgroup>
	                </select>
            	</div>
            </div>
            <div class="col-sm-12" style="margin-bottom: 5px; padding: 0px;">
    			<label for="" class="col-sm-3 control-label text-blue">우편번호</label>
	            <div class="col-sm-4">
	                <input type="text" class="form-control" id="" placeholder="수취인 우편번호" name="receiveZipCode">
	            </div>
	    	</div> 
	    	<div class="col-sm-12" style="margin-bottom: 5px; padding: 0px;">
		    	<label for="" class="col-sm-3 control-label text-blue">Address</label>
	            <div class="col-sm-8">
	                <textarea class="form-control warning" rows="5" placeholder="수취인 주소" name="receiveAddr3"></textarea>
	            </div>
            </div>
            <div class="col-sm-6 col-sm-offset-3 ">
            <a href="#myModal" data-toggle="modal" class="btn btn-block btn-default" onclick='ready()'>
            	받는사람 불러오기
       		 </a>
       		 </div>
    </td>
  </tr>
  <tr>
    <td class="ta-left text-lg" colspan="9">
    	Customs Declaration 세관신고서 <span class="ft-right">CN23</span>
    </td>
    <td class="va-middle" colspan="3"  rowspan="2">
    	<div class="col-sm-4" style="padding: 0px;">Weight<br>중량</div>
    	<div class="input-group">
            <input type="text" class="form-control warning" name="totWeight" value="">
            <span class="input-group-addon input-group-addon-default">g</span>
        </div>
	</td>
    <td class="va-middle" colspan="3" rowspan="2">
    	<div class="col-sm-4" style="padding: 0px;">Postage<br>우편요금</div>
    	<div class="input-group">
            <input type="text" class="form-control warning" disabled="" value="" name="proc">
            <span class="input-group-addon input-group-addon-default">원</span>
        </div>
    </td>
  </tr>
  <tr class="col-item">
  	
    <td class="va-middle" colspan="3">Contents 내용 품명(반드시 영문으로 구체적으로 기재)
    </td>
    <td class="va-middle">Quantity<br>(개수)</td>
    <td class="va-middle">Net Weight<br>(순중량)</td>
    <td class="va-middle">Value<br>(가격:US$)</td>
    <td class="va-middle" colspan="2">HS Tariff<br>Number(Hs)</td>
    <td class="va-middle">Country of<br>Origin(생산지)</td>
  </tr>
  <tr class="">
    <td class="" colspan="3">
    <input type="hidden" name="contents" />
  	<input type="hidden" name="number" />
  	<input type="hidden" name="value" />
  	<input type="hidden" name="hsCode" />
    <input type="text" class="form-control warning" id="" placeholder="내용품명" name="contents1" value=""></td>
    <td class=""><input type="text" class="form-control" id="" value="1" name="number1"></td>
    <td class=""></td>
    <td class=""><input type="text" class="form-control warning" id="" placeholder="USD" name="value1" value=""></td>
    <td class="" colspan="2"><input style="font-size: 11px;" type="text" class="form-control" id="" placeholder="HSCODE" name="hsCode1"></td>
    <td class=""></td>
    <td class="" colspan="3" rowspan="6">
    </td>
    <td class="va-middle ls-md" rowspan="2">Country code<br>도착국명 약호</td>
    <td class="va-middle text-lg" style="font-size: 20px;" rowspan="2" id="countryCd1">  </td>
    <td class="va-middle text-lg" style="font-size: 20px;" rowspan="2" id="countryCd2">  </td>
  </tr>
  <tr class="">
    <td class="" colspan="3"><input type="text" class="form-control" id=""  name="contents2"></td>
    <td class=""><input type="text" class="form-control" id="" disabled="" name="number2"></td>
    <td class=""></td>
    <td class=""><input type="text" class="form-control" id="" disabled="" name="value2"></td>
    <td class="" colspan="2"><input type="text" style="font-size: 11px;" class="form-control" id="" disabled=""  name="hsCode2"></td>
    <td class=""></td>
  </tr>
  <tr class="">
    <td class="" colspan="3"><input type="text" class="form-control" id=""  name="contents3"></td>
    <td class=""><input type="text" class="form-control" id="" disabled="" name="number3"></td>
    <td class=""></td>
    <td class=""><input type="text" class="form-control" id="" disabled="" name="value3"></td>
    <td class="" colspan="2"><input type="text" style="font-size: 11px;" class="form-control" id="" disabled=""  name="hsCode3"></td>
    <td class=""></td>
    <td class="va-middle ls-md" colspan="3" rowspan="4"></td>
  </tr>
  <tr class="">
    <td class="" colspan="3"><input type="text" class="form-control" id=""  name="contents4"></td>
    <td class=""><input type="text" class="form-control" id="" disabled="" name="number4"></td>
    <td class=""></td>
    <td class=""><input type="text" class="form-control" id="" disabled="" name="value4"></td>
    <td class="" colspan="2"><input type="text" style="font-size: 11px;" class="form-control" id="" disabled=""  name="hsCode4"></td>
    <td class=""></td>
  </tr>
  <tr class="">
    <td class="" colspan="6">
    	 <div class="col-sm-8 col-sm-offset-2">
           <a href="#myModal" data-toggle="modal" class="btn btn-block btn-default" onclick='ready()'>
           		세관신고서 품목 불러오기
      		</a>
     	</div>
    </td>
    <td class="" colspan="3">
    	<div class="col-sm-12">
           <a href="javascript:;" onclick="window.open('http://ems.epost.go.kr/front.EmsSearchHscode.postal','','width=600,height=550,left=0,top=0,scrollbars=yes')" class="btn btn-block btn-default">
           		<i class="fa fa-search"></i>
           		HS CODE
      		</a>
     	</div>
    </td>
  </tr>
  <tr>
    <td class="va-middle" colspan="9">
	         <div class="col-sm-12">
    	<div class="radio">
           <label>
           		<input type="radio" name="emGubun" id="optionsRadios1" value="Sample" checked="checked"> Sample 상품견본
           </label>
           <label>
           		<input type="radio" name="emGubun" id="optionsRadios1" value="Gift"> Gift 선물
           </label>
           <label>
           		<input type="radio" name="emGubun" id="optionsRadios1" value="Merchandise"> Merchandise 상품
           </label>
           <label>
           		<input type="radio" name="emGubun" id="optionsRadios1" value="Document"> 수출면장건
           </label>
        </div>
        </div>
    </td>
  </tr>
</table>
</form>
<div class="col-sm-4 col-sm-offset-4">
	<button class="btn btn-primary btn-block btn-lg" id="submitOrder"><i class="fa fa-edit"></i> 접수</button>
</div>
                            </div>
                        </div>
                    </div>

            </div>
        </div>
        <!-- end:main -->


    <!-- start:javascript for this page -->
    <script src="${pageContext.request.contextPath}/static/assets/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/datepicker/js/bootstrap-datepicker.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/restful-client/jquery.rest.js"></script>
    
    <script>
    
    function getDesc() {
        $.getJSON("${pageContext.request.contextPath}/nationList",
        	function(data) {
        	var html =  $('select#nation').html();
        	html += '<optgroup label="[ 가나다순 ]">';
            var len = data.length;
            			
            for (var i = 0; i < len; i++) {
                html += '<option value="' + data[i].nationCd + '">['
                        + data[i].nationCd +"] "+ data[i].nationNm + " (" +data[i].nationFn + ')</option>';
            }
            html += '</optgroup>';
            $('select#nation').html(html);
        });
        
    }
        //owl carousel
        $(document).ready(function() {
        	
        	$("input[name=contents2], input[name=contents3], input[name=contents4]").on("change", function() {
				if( $(this).val() != "" ){
					$(this).parent().parent().find("input").removeAttr("disabled");
					$(this).parent().parent().find("input[name*=value]").addClass("warning");
				}else{
					$(this).parent().parent().find("input").val("");
					$(this).parent().parent().find("input").attr("disabled", "true");
					$(this).removeAttr("disabled");
				}
				
			} );
        	
        	getDesc();
        	$('#dp1').datepicker({});
        	
        	$("#submitOrder").click(function() {
        		
        		var contents = $('input[name=contents1]').val() + ";" +
				        		$('input[name=contents2]').val() + ";" +
				        		$('input[name=contents3]').val() + ";" +
				        		$('input[name=contents4]').val();
        		var value  = $('input[name=value1]').val() + ";" +
				        		$('input[name=value2]').val() + ";" +
				        		$('input[name=value3]').val() + ";" +
				        		$('input[name=value4]').val();
        		var number = $('input[name=number1]').val() + ";" +
				        		$('input[name=number2]').val() + ";" +
				        		$('input[name=number3]').val() + ";" +
				        		$('input[name=number4]').val();
        		var hsCode = $('input[name=hsCode1]').val() + ";" +
				        		$('input[name=hsCode2]').val() + ";" +
				        		$('input[name=hsCode3]').val() + ";" +
				        		$('input[name=hsCode4]').val();

        		/* contents = contents.replace(/;{1,3}$/,"");
        		value = value.replace(/;{1,3}$/,"");
        		number = number.replace(/;{1,3}$/,"");
        		hsCode = hsCode.replace(/;{1,3}$/,""); */
				        		
				        		
				$('input[name=contents]').val(contents);
				$('input[name=value]').val(value);
				$('input[name=number]').val(number);
				$('input[name=hsCode]').val(hsCode);
				        		
           	 var create = $.create('/order', JSON.stringify($("#registForm").serializeObject()) );
           	 create.then(function(reponse) {
           		$.alert({
           		    content:  i18n("msg."+reponse.code),
           		    type: 'green',
           		    buttons: {
           		        ok: {
           		            btnClass: 'btn-success',
           		            action: function(){
           		            	location.href = "/order/home";
           		            }
           		        }
           		    }
           		});
			}, function(xhr){
           		 
           		var errors = xhr.responseJSON;
           		for ( var index in errors) {
           			$('[name='+errors[index]+']').attr("title","error").tooltip('fixTitle').tooltip('show');
				}
           	 });
   		});
        	
        	$("body").on("change", ".warning" , function() {
        		
        		 var input = $(this);
				 var value = input.val();
				 var propertyName = input.attr("name");
				 
				 var data = {};
				 data[propertyName] = value;
				 data["property"] = propertyName;
				 
				 $.ajax({
		            	//url: '/order/validate?property='+propertyName,
		            	url: '/order/validate/'+propertyName,
		                data: JSON.stringify(data),
		                type: 'POST',
		                success: function(data) {
		                    if(!data){
		                    	input.removeClass("warning");
		                    	input.removeAttr("title").tooltip('destroy');
		                    }else{
		                    	input.addClass("warning");
		                    	input.attr("title","error").tooltip('fixTitle').tooltip('show');
		                    }
		                }
		            });
			});
        	
        	
        	$('.form-control').tooltip({placement: 'left'});
        	
        	$("select[name=countryCd]").on("change", function() {
        		var cd = $(this).val();
        		$("#countryCd1").html(cd.charAt(0));
				$("#countryCd2").html(cd.charAt(1));
				checkProc();
			});
        	
        	$("input[name=totWeight]").on("change", function() {
        		checkProc();
        	});
      });
        
        function checkProc() {
        	var totWeight = $("input[name=totWeight]").val();
    		var countryCd = $("#nation option:selected").val();
    		
    		if( countryCd != "" && totWeight > 0){
        		$.read(  '/order/proc/'+ countryCd + "/" + totWeight,
        				  function (proc) {
        			$("input[name=proc]").val(proc);
        		} );
    		}
		}

    </script>
    <!-- end:javascript for this page -->

</body>
</html>	