


 

















<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>도로명주소 검색</title>
<link type="text/css" rel="stylesheet" href="http://ems.epost.go.kr/np2assets/css/pop_sub.css" />

<script type="text/javascript" src="http://ems.epost.go.kr/postal/jscripts/constant.js"></script>


<script type="text/javascript" src="http://ems.epost.go.kr/parcel/js/common/common.js"></script> 
<script type="text/javascript" > 
//<![CDATA[
	$(document).ready(function(){
		//검색창 안내문구
		$('#keyword').bind("focus blur",function(e){
			var value = $(this).val();
			var element = $(this).siblings('label');
			if (e.type == "focus"){
			//	if (value == ""){
					element.hide();
			//	}
			}else if(e.type == "blur"){
				if (value == ""){
					element.show();
				}
			}			
		});
		
		//2016.06 인터넷우체국고도화 - 건물번호 지정 엔터키 입력 추가
		enterSubmit("bdRangeNumber", applyRange);
	});
	
	$(document).ready(function() {
        $("#layer_pop").hide();
		$("#cont > a").click(function(){
			$("#cont > a").blur();
			$("#layer_pop").show();
			$("#layer_pop a").focus();
			return false;
		});
		$("#layer_pop a").keydown(function(e){
			if(e.shiftKey && e.keyCode == 9){
				$("#cont > a").focus();
				$("#layer_pop").hide();
				return false;
			}
		});
		$("#layer_pop a.btn_m").click(function(){
			$("#cont > a").focus();
			$("#layer_pop").hide();
		});
    });

(function(){
 /*Use Object Detection to detect IE6*/
 var  m = document.uniqueID /*IE*/
 && document.compatMode  /*>=IE6*/
 && !window.XMLHttpRequest /*<=IE6*/
 && document.execCommand ;
 
 try{
  if(!!m){
   m("BackgroundImageCache", false, true); /* = IE6 only */
  }
 }catch(oh){a=a;};
})(); 


var initChk =false;

/**
 *  초기화(검색창에 focus)
 */
function init(){
    initChk = true;     
    document.getElementById("zipschfrm").keyword.focus();
    var keyword = "이문로 143-1";
    if(keyword !="") document.getElementById("zipschfrm").keyword.style.backgroundImage='';



}
 

var Base = function() {
	
    this.frm = document.getElementById("zipschfrm");
	
	/* 공백 및 특수문자 제거 */
	this.doValidJuso1 = function(str) {
        str = str.replace(/(^\s*)|(\s*$)/g, ""); //앞뒤 공백 제거
        return str.split(/[%]/).join(""); //특수문자 % 제거
	};

};



var search = function() {
	
	var moBase = new Base();   
	
    var srchVal = moBase.frm.keyword.value;
    srchVal = moBase.doValidJuso1(srchVal); //특수문자공백제거
    
	/* 판별 logic start */
	if(srchVal == "") {
		moBase.frm.keyword.focus();
		return false;
	} 
	if(srchVal.length < 2) {
		alert("검색어를 2글자이상으로 입력해 주십시오");
		return false;
	} 
	// 사서함 관련 2015-01-13
	if(srchVal == '사서함') {
		alert("사서함 검색시 시군구명+사서함 또는 사서함+사서함번호로 입력해 주십시오.");
		return false;
	}

        	/* 주소 판별  start */
			document.getElementById("btnImgSrch").style.display = "none";
			document.getElementById("btnImgPrgSrch").style.display = "inline";
			

            return true;

        /* 주소 판별  end */        
};


function chkRadio(radio) {
    var isNotChecked = true;
    if (radio.length > 1) {
        for (var inx = 0; isNotChecked && inx < radio.length; inx++) {
            if (radio[inx].checked) isNotChecked = false;
        }
    } else {
        if (radio.checked) isNotChecked = false;
    }
    return isNotChecked;
}

function checkNull( toCheck ) {
     var chkstr = toCheck + "";
     var is_Space = true ;
    
     if ( ( chkstr == "") || ( chkstr == null ) ) 
       return( true );
 
     for ( j = 0 ; is_Space && ( j < chkstr.length ) ; j++)
     {
         if( chkstr.substring( j , j+1 ) != " " ) 
         {
           is_Space = false ;
         }
     }
     return ( is_Space );
}

/* 오른쪽 주소창 set */
function doMoveData(form,e) {

        var zipschfrm = document.getElementById(form);
        var zipregfrm = document.getElementById("zipregfrm");
		var addr_type = zipschfrm.addr_type.value;
 
        // 선택한 주소정보 주소2입력 탭으로 복사
		zipregfrm.reg_zipcode.value = zipschfrm.sch_zipcode.value;
        zipregfrm.reg_areacd.value = zipschfrm.sch_areacd.value;
        zipregfrm.reg_address1.value = zipschfrm.sch_address1.value;
		if(addr_type == "도로명")
	        zipregfrm.reg_dongnm.value = zipschfrm.admin_dong.value;
        zipregfrm.reg_apartnm.value = zipschfrm.sch_aptNm.value;

		// 주소타입(J1, S1) 판단
		zipregfrm.addr_type.value = zipschfrm.addr_type.value;
		// 범위주소에 대한 건물번호 지정시 주소1 다시 세팅
		zipregfrm.siNm.value = zipschfrm.siNm.value;
		zipregfrm.rdNm.value = zipschfrm.rdNm.value;
		zipregfrm.bdSn.value = zipschfrm.bdSn.value;
		zipregfrm.emdNm.value = zipschfrm.emdNm.value;
        
		if(zipschfrm.admin_dong.value == ""){
            document.getElementById("reg_dongnm").readOnly = true;
        }else{
            document.getElementById("reg_dongnm").readOnly = false;
        }


		// 건물번호가 범위일 경우 건물번호 지정을 위한 입력란 노출

		if(zipregfrm.bdSn.value.indexOf('~') != -1 && (addr_type == "도로명" || addr_type == "사서함")){
			setDispBdRangeNumber(true);
		}else if(zipregfrm.bdSn.value.indexOf('~') != -1 && (addr_type == "지번")){
			setDispBdRangeNumber(false);
			
			// 지번 범위일 경우는 범위값을 빼고 나머지를 세팅
			var reg_address1 = "";
			if(zipregfrm.siNm.value != "")
				reg_address1 = reg_address1 + zipregfrm.siNm.value ;
			if(zipregfrm.rdNm.value != "")
				reg_address1 = reg_address1 + " "+zipregfrm.rdNm.value ;
			if(zipregfrm.emdNm.value != "")
				reg_address1 = reg_address1 + " "+zipregfrm.emdNm.value ;

			zipregfrm.reg_address1.value =  reg_address1;

		}else{
			setDispBdRangeNumber(false);
		}
        
        if(zipregfrm.reg_apartnm.value==""){
            zipregfrm.apart_yn[1].checked=true;
            zipregfrm.reg_address2.focus();
        }else{          
            zipregfrm.apart_yn[0].checked=true;
            zipregfrm.reg_apartdong.focus();
        }
        
        return false;

}


/* 오른쪽 주소창 set */
function doMoveDataEng(form,e) {

        var zipschfrm = document.getElementById(form);
        var zipregfrm = document.getElementById("zipregfrm");
        var addr_type = zipschfrm.addr_type.value;
 
        // 선택한 주소정보 주소2입력 탭으로 복사
		zipregfrm.reg_zipcode.value = zipschfrm.sch_zipcode.value;
        zipregfrm.reg_areacd.value = zipschfrm.sch_areacd.value;
        zipregfrm.reg_address1.value = zipschfrm.sch_address1.value;

		// 주소타입(J1, S1) 판단
		zipregfrm.addr_type.value = zipschfrm.addr_type.value;
		// 범위주소에 대한 건물번호 지정시 주소1 다시 세팅
		zipregfrm.siNm.value = zipschfrm.siNm.value;
		zipregfrm.rdNm.value = zipschfrm.rdNm.value;
		zipregfrm.bdSn.value = zipschfrm.bdSn.value;
		zipregfrm.emdNm.value = zipschfrm.emdNm.value;
		
		zipregfrm.sendpssbyn.value = zipschfrm.sendpssbyn.value;
		zipregfrm.closehhmi.value = zipschfrm.closehhmi.value;
		
		// 건물번호가 범위일 경우 건물번호 지정을 위한 입력란 노출
		if(zipregfrm.bdSn.value.indexOf('~') != -1 && (addr_type == "도로명" || addr_type == "사서함")){
			setDispBdRangeNumber(true);
		}else if(zipregfrm.bdSn.value.indexOf('~') != -1 && (addr_type == "지번")){
			setDispBdRangeNumber(false);
			
			// 지번 범위일 경우는 범위값을 빼고 나머지를 세팅
			var reg_address1 = "";
			if(zipregfrm.siNm.value != "") 
				reg_address1 = zipregfrm.siNm.value + reg_address1 ;
			if(zipregfrm.rdNm.value != "")
				reg_address1 = zipregfrm.rdNm.value + " " + reg_address1 ;
			if(zipregfrm.emdNm.value != "")
				reg_address1 = zipregfrm.emdNm.value + " " + reg_address1;

			zipregfrm.reg_address1.value =  reg_address1;

		}else{
			setDispBdRangeNumber(false);
		}
        
       
        return false;

}


function aptchk(num){
    var rfrm = document.getElementById("zipregfrm");
    if(num == 1){
        rfrm.apart_yn[0].checked=true;
        rfrm.reg_address2.value = "";
        rfrm.reg_apartnm.focus();
    }else if(num == 2){
        rfrm.apart_yn[1].checked=true;
        rfrm.reg_apartnm.value = "";
        rfrm.reg_apartdong.value = "";
        rfrm.reg_apartho.value = "";
        rfrm.reg_address2.focus();
    }
}

function inputchk(num){
    var rfrm = document.getElementById("zipregfrm");
    if(num == 1){
        rfrm.apart_yn[0].checked=true;
        rfrm.reg_address2.value = "";
    }else if(num == 2){
    	
        rfrm.reg_address2.focus();        
	    
    }
}

function isAccess_new(evt) {

	var keynum;
	var ismouseClick = 1;

	var e = evt ? evt : window.event;

	//mouse click
	if(e.type == "click"){
		eType ="click";
	}
	
	//keypress
	if(e.which){//IE9 이상,Firefox,Opera,Safari
		kNum = e.which;
	}else if(window.event){//IE8 and earlier
		kNum = event.KeyCode;
	}
	
	//mouse click or keypress(enter)
	if ( eType == "click" || kNum == 13 ) {
		return true;
	}
	else{
		return false;
	}
}


function goPage(row, e)
{

        document.getElementById('zipschfrm').targetRow.value = row;
        if(search()){
            document.getElementById('zipschfrm').submit();
        }
    return false;

}


/* 부모창 set */
function doSubmit(e) {

    var sfrm = document.getElementById("zipschfrm");
    var rfrm = document.getElementById("zipregfrm");
    var pfrm = opener.document.getElementById("ems_1100c");
    
    if(checkNull(rfrm.reg_zipcode.value) || checkNull(rfrm.reg_address1.value)){
        alert("우편번호검색 후 입력하고자 하는 도로명주소를 선택해 주세요.");
        sfrm.keyword.focus();
        return false;
    }
    if(chkRadio(rfrm.apart_yn)){
        alert("'아파트(동ㆍ호)' 또는 '아파트 이외'를 선택해 주세요.");
        return false;
    }

    if(rfrm.confirmRangeInput.value != "true"){
		var bdRangeText = (document.getElementById("spanBdRange").innerText).replace(" 지정 : ", "");
        alert(bdRangeText+"를 입력 후 확인버튼을 선택해 주시기 바랍니다.");
		rfrm.bdRangeNumber.focus();
        return false;
    }
    
    var apart_yn_chk = 0;
    if(rfrm.apart_yn[0].checked){
        apart_yn_chk = 1;
    }else if(rfrm.apart_yn[1].checked){
        apart_yn_chk = 2;
    }
 
    var reg_address2 = "";
	var reg_address3 = "";


  
	
	pfrm.senderzipcode.value = rfrm.reg_zipcode.value;

	
	if(pfrm.senderzipcode0){
		pfrm.senderzipcode0.value = rfrm.reg_zipcode.value;
	}  
	
	
	pfrm.senderaddr2.value = rfrm.reg_address1.value;

	if(apart_yn_chk == 1){
		// 아파트일때
		if(rfrm.reg_apartdong.value != ""){
			reg_address2 += rfrm.reg_apartdong.value + "동";
		}
		if(rfrm.reg_apartdong.value != "" && rfrm.reg_apartho.value != ""){
			reg_address2 += " ";
		}
		if(rfrm.reg_apartho.value != ""){
			reg_address2 += rfrm.reg_apartho.value + "호";
		}
		if(rfrm.reg_dongnm.value != "" || rfrm.reg_apartnm.value != ""){
			reg_address3 += "(";
		}
		if(rfrm.reg_dongnm.value != "" ){
			reg_address3 += rfrm.reg_dongnm.value; // 행정동명
		}
		if(rfrm.reg_dongnm.value != "" && rfrm.reg_apartnm.value != ""){
			reg_address3 += ",";
		}
		if(rfrm.reg_apartnm.value != ""){
			reg_address3 += rfrm.reg_apartnm.value; // 아파트명
		}
		if(rfrm.reg_dongnm.value != "" || rfrm.reg_apartnm.value != ""){
			reg_address3 += ")";
		}
	} else if(apart_yn_chk == 2){
		// 아파트 아닐때
		reg_address2 = rfrm.reg_address2.value;
		if(rfrm.reg_dongnm.value != "")
			reg_address3 = "(" + rfrm.reg_dongnm.value + ")";
	}


		pfrm.senderaddr1.value = reg_address2 + reg_address3;


	if(rfrm.addr_type.value == "지번"){
		pfrm.S1.value = "J1";
	}else if(apart_yn_chk == 1 && (rfrm.reg_apartnm.value != "" || rfrm.reg_apartdong.value != "" || rfrm.reg_apartho.value != "")){
		pfrm.S1.value = "S1";
	}else{
		pfrm.S1.value = "S2";
	}
	
    
	
        opener.changeOfficeNm();
	
	
	// 송달곤란지역 체크
	if( $(opener.document.body).has('input[name=delivWeakAreaYn]:hidden').length > 0 ){
		
		opener.checkDelivWeakArea();
		
	}
	
	
	 
	

    window.close();
    return false;
}


/* 부모창 set */
function doSubmitEng(e) {

    var sfrm = document.getElementById("zipschfrm");
    var rfrm = document.getElementById("zipregfrm");
    var pfrm = opener.document.getElementById("ems_1100c");
    
    
	    var zip_name = pfrm.senderzipcode;
	    var zip_name0 = pfrm.senderzipcode0;
	    var addr1_name = pfrm.senderaddr2;
	    var addr2_name = pfrm.senderaddr1;
	    
    
    
    
    if(checkNull(rfrm.reg_zipcode.value) || checkNull(rfrm.reg_address1.value)){
        alert("우편번호검색 후 입력하고자 하는 도로명주소를 선택해 주세요.");
        sfrm.keyword.focus();
        return false;
    }

    if(rfrm.confirmRangeInput.value != "true"){
		var bdRangeText = (document.getElementById("spanBdRange").innerText).replace(" 지정 : ", "");
        alert(bdRangeText+"를 입력 후 확인버튼을 선택해 주시기 바랍니다.");
		rfrm.bdRangeNumber.focus();
        return false;
    }
 
    apart_yn_chk = 2;
  
    var reg_address2 = "";
	var reg_address3 = "";


  
	zip_name.value = rfrm.reg_zipcode.value;

	
	if(zip_name0){
		zip_name0.value = rfrm.reg_zipcode.value;
	}  
	
	
	addr1_name.value = rfrm.reg_address1.value;

	if(apart_yn_chk == 1){
		// 아파트일때
		if(rfrm.reg_apartdong.value != ""){
			reg_address2 += rfrm.reg_apartdong.value + "동";
		}
		if(rfrm.reg_apartdong.value != "" && rfrm.reg_apartho.value != ""){
			reg_address2 += " ";
		}
		if(rfrm.reg_apartho.value != ""){
			reg_address2 += rfrm.reg_apartho.value + "호";
		}
		if(rfrm.reg_dongnm.value != "" || rfrm.reg_apartnm.value != ""){
			reg_address3 += "(";
		}
		if(rfrm.reg_dongnm.value != "" ){
			reg_address3 += rfrm.reg_dongnm.value; // 행정동명
		}
		if(rfrm.reg_dongnm.value != "" && rfrm.reg_apartnm.value != ""){
			reg_address3 += ",";
		}
		if(rfrm.reg_apartnm.value != ""){
			reg_address3 += rfrm.reg_apartnm.value; // 아파트명
		}
		if(rfrm.reg_dongnm.value != "" || rfrm.reg_apartnm.value != ""){
			reg_address3 += ")";
		}
	} else if(apart_yn_chk == 2){
		// 아파트 아닐때
		reg_address2 = rfrm.reg_address2.value;
	}


	addr2_name.value = reg_address2 + reg_address3;


	//발송인정보 불러오기 구분 코드
	
	opener.setZipInfo2(rfrm.sendpssbyn.value,rfrm.closehhmi.value);
	opener.ajaxPickUpPo(rfrm.reg_zipcode.value);
	
 
    window.close();
    return false;
}

// 범위주소에 대한 건물번호 지정 적용
function applyRange(){
	var zipregfrm = document.getElementById("zipregfrm");

	if(!zipregfrm.bdRangeNumber.value){
		var bdRangeText = (document.getElementById("spanBdRange").innerText).replace(" 지정 : ", "");
        alert(bdRangeText+"를 입력해 주시기 바랍니다.");
		zipregfrm.bdRangeNumber.focus();
        return;
	}
	
	
	 
		var reg_address1 = "";
		if(zipregfrm.emdNm.value != "")
			reg_address1 = reg_address1 + zipregfrm.emdNm.value ;
		if(zipregfrm.bdRangeNumber.value != "")
			reg_address1 = reg_address1 + " " +zipregfrm.bdRangeNumber.value ;
		if(zipregfrm.rdNm.value != "")
			reg_address1 = reg_address1 + " " +zipregfrm.rdNm.value ;
		if(zipregfrm.siNm.value != "")
			reg_address1 = reg_address1 + " " + zipregfrm.siNm.value ; 
		
		
	 

	zipregfrm.reg_address1.value =  reg_address1;
	zipregfrm.confirmRangeInput.value = "true";
}

// 범위주소에 대한 건물번호 지정 입력란 노출 조정
function setDispBdRangeNumber(isShow){
	var zipregfrm = document.getElementById("zipregfrm");
	var spanBdRange = document.getElementById("spanBdRange");
	var liBdRange = document.getElementById("liBdRange");
	if(isShow){
		zipregfrm.confirmRangeInput.value = "false";
		var bdRangeType = "건물번호";
		if(zipregfrm.addr_type.value == "사서함")
			bdRangeType = "사서함번호";
		spanBdRange.innerText = "범위 \""+zipregfrm.bdSn.value+"\" 에 대한 "+bdRangeType+" 지정 : ";
		liBdRange.style.display = "block";
	}else{
		zipregfrm.confirmRangeInput.value = "true";
		liBdRange.style.display = "none";
	}
}

function rangeResultReSearch(srchAddr){
	var zipschfrm = document.getElementById("zipschfrm");
	var orgKeyword = zipschfrm.keyword.value;
	zipschfrm.keyword.value = srchAddr;
	if(!search()){
		zipschfrm.keyword.value = orgKeyword;
		return;
	}
	zipschfrm.action = "/comm/zipcode/comm_newzipcd_list.jsp?innerSearch=true";
	zipschfrm.submit();
}

function ck_lan(a){
	if( chk_txt(a) ) {
		alert("영문이나 허용된 기호(,./-_()#~:;&<>@)으로 입력해 주세요");
	}
}


function chk_txt(a){
	var var_chTxt;

	for(i=0 ; i<a.length ; i++){
		if( (a.charAt(i)>='a' && a.charAt(i)<='z') || (a.charAt(i)>='A' && a.charAt(i)<='Z')
		 || (a.charAt(i)>='0' && a.charAt(i)<='9') || a.charAt(i)==' ' || a.charAt(i)==',' || a.charAt(i)=='.' || a.charAt(i)=='/'
		 || a.charAt(i)=='-' || a.charAt(i)=='_' || a.charAt(i)=='(' || a.charAt(i)==')' || a.charAt(i)=='#' 
		 || a.charAt(i)=='~' || a.charAt(i)==':'||  a.charAt(i)==';' || a.charAt(i)=='&' || a.charAt(i)=='<'
		 || a.charAt(i)=='>'  || a.charAt(i)==';'|| a.charAt(i)=='@'   || a.charAt(i)=='ⓚ' || a.charAt(i)=='·' || a.charAt(i)=='\''
		 ){
		 var_chTxt = false;
		}else{
			var_chTxt = true;
			break;
		}
	}
	return var_chTxt;
}

function enterSubmit(id, functionName) {
	$("#"+id).keypress(function(e){
		if(e.keyCode == 13){
			functionName();
		}
	});
}

//]]>
</script>
</head>
 
<body onload="init();">
<div id="title_layout">
	<h3>주소찾기</h3>
	<p><a class="btn_close" href="#" title="창닫기" onclick="window.close(); return false;">닫기</a></p>
</div>
<div id="body_layout" class="w_590 h_680">
	<div class="w_550 ma_b_10">
		<div class="search_box ma_t_0 ma_b_10">
			<div class="search_wrap w_auto h_auto dis_block h_30">
            <form name="zipschfrm" id="zipschfrm" action="/parcel/comm/zipcode/comm_newzipcd_list.jsp" method="post" onsubmit="return search();">
	            <input type="hidden" name="form_name" value="ems_1100c" />
	            <input type="hidden" name="zip_name" value="senderzipcode" />
	            <input type="hidden" name="areacd_name" value="" />
	            <input type="hidden" name="addr1_name" value="senderaddr2" />
	            <input type="hidden" name="addr2_name" value="senderaddr1" />
	            <input type="hidden" name="addr3_name" value="" />
	            <input type="hidden" name="addr_type_name" value="S1" />
	            <input type="hidden" name="srchZipCd" value="" />
	            <input type="hidden" name="srchSido" value="" />
	            <input type="hidden" name="srchSgg" value="" />
	            <input type="hidden" name="srchEmdNm" value="" />
	            <input type="hidden" name="srchRdNm" value="" />
	            <input type="hidden" name="srchRiNm" value="" />
	            <input type="hidden" name="srchEtcNm" value="" />
	            <input type="hidden" name="srchMaSn" value="" />
	            <input type="hidden" name="srchSbSn" value="" />
	            <input type="hidden" name="srchPoBoxNm" value="" />
	            <input type="hidden" name="srchType" value="INT" />
	            <input type="hidden" name="srchTpChangeble" value="" />
	            <input type="hidden" id="targetRow" name="targetRow" value="" />
	            <input type="hidden" id="action" name="action" value="applicant" />
            <fieldset>
            <legend>상세검색</legend> 
				<dl class="search_txt w_440 f_l">
					<dt class="w_60 ma_b_0 m_l_15"><label for="keyword">검색어</label></dt>
						<dd class="ma_b_0 m_l_80">
						<label for="keyword" style="position:absolute;padding:3px;color:#aaa;display:none;">검색어를 입력하세요</label>
	                    <input class="w_270 l_h_30" name="keyword" id="keyword" type="text" size="30" value="이문로 143-1" title="검색어입력" style="IME-MODE:active;" />
						<input class="btn_m bg_red3 f_w_bold b_0 l_h_28" type="submit" title="검색" id="btnImgSrch" value="검색"/>
						<input class="btn_m bg_red3 f_w_bold b_0 l_h_28" type="submit" title="검색" id="btnImgPrgSrch" value="검색" style="display:none;" />
	                </dd>
	            </dl>
            <div id="cont" class="f_r w_80">
					<a href="#layer_pop" class="btn_m gre">입력방법</a>
					
				    <div id="layer_pop">
					    <a class="btn_m red5 f_r w_47" href="#">닫기</a>
					    <h5 class="ma_t_5 w_200">입력방법 안내</h5>
					    <hr class="dott1 ma_t_10"/>
					    <!-- 
					    <div class="w_52pct f_l">
					    	<h6 class="blue">검색방법</h6>
					    	<ul class="ul_list">
								<li class="l_h_16">도로명 + 건물번호 <strong>예)도움5로 19</strong></li>
								<li class="l_h_16">건물명 <strong>예)나주시 ○○아파트</strong></li>
								<li class="l_h_16">읍/면/동/리 + 지번 <strong>예)어진동 307-19</strong></li>
								<li class="l_h_16">사서함 + 사서함번호 <strong>예)광화문우체국사서함 45</strong></li>
							</ul>
						
							
						
							<h6>해당주소를 선택 후 상세주소를 입력해 주세요</h6>
							<h6>우편번호 상세주소가 검색되지 않는 경우 범위 주소로 검색됩니다</h6>
						
					    </div>
					    
					    <div class="w_47pct f_r">
					      
					      	<h6 class="f_s_12 l_s_1">해당주소를 선택 후 상세주소를 입력해 주세요</h6>
							<h6 class="f_s_12">우편번호 상세주소가 검색되지 않는 경우 범위 주소로 검색됩니다</h6>
				          	<h6 class="f_s_12">상세주소는 영문으로 입력해 주세요.</h6>
				          	
					    	<h6 class="blue">아파트(동ㆍ호)</h6>
					    	<ul class="ul_list">
								<li class="l_h_16">아파트 명칭이 없는 경우 동호수만 입력</li>
								<li class="l_h_16">호수는 있으나 동과 건물 명칭이 없는 경우 호수만 입력</li>
							</ul>
							<h6 class="blue">아파트 이외</h6>
							<ul class="ul_list">
								<li class="l_h_16">동ㆍ호수로 표기할 수 없는 형태</li>
								<li class="l_h_16">회사 또는 부서명, 건물명칭, 사서함번호 등</li>
							</ul>
							
					    </div>
					     -->
					    <div class="w_52pct f_l">
					    	<h6 class="blue">정확한 주소를 모르시는 경우</h6>
					    	<ul class="ul_list">
								<li class="l_h_16">시/군/구 + 도로명, 동명 또는 건물명<br/><strong>예) 동해시 중앙로, 여수 중앙동, 대전 현대아파트</strong></li>
							</ul>
							
						
							<h6 class="f_s_12">상세주소는 영문으로 입력해 주세요.</h6>
						
					    </div>
					    
					    <div class="w_47pct f_r">
					    	<h6 class="blue">정확한 주소를 아시는 경우</h6>
					    	<ul class="ul_list">
								<li class="l_h_16">도로명 + 건물번호 <strong>예) 도움5로 19</strong></li>
								<li class="l_h_16">읍/면/동/리 + 지번 <strong>예) 어진동 307-19</strong></li>
							</ul>
					    </div>
				    </div>
				</div>
            </fieldset>
            </form>
            </div>
        </div>
        
		<p class="t_a_l"><Strong>검색결과</Strong> <font class="red">1</font>건 </p>
		
		<div class="h_330 over_ya ma_b_10">
			<table width="100%" class="table_list ma_b_0" border="0" cellspacing="0" cellpadding="0" summary="검색결과 표의 우편번호, 주소, 범위 등의 정보">
				<caption>검색결과</caption>
				<colgroup>
					<col style="width:90px" />
					<col style="width:auto" />
					<col style="width:10%" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">우편번호</th>
						<th scope="col">주소</th>
						<th scope="col" class="bg_image_no">범위</th>
					</tr>
				</thead>
                <tbody>
 
 
          
               <form name="selectForm0" id="selectForm0">
               <input type="hidden" name="sch_zipcode"   value="02403" />
               <input type="hidden" name="sch_areacd"   value="02403" />
               <input type="hidden" name="sch_address1"   value="143-1 Imun-ro Dongdaemun-gu Seoul" />
               <input type="hidden" name="admin_dong"   value="이문동" />
               <input type="hidden" name="sch_aptNm"   value="" />		
					 
               <input type="hidden" name="addr_type"   value="도로명" />
               <input type="hidden" name="siNm"   value="Dongdaemun-gu Seoul" />
               <input type="hidden" name="rdNm"   value="Imun-ro" />
               <input type="hidden" name="bdSn"   value="143-1" />
               <input type="hidden" name="emdNm"   value="(이문동, 이문동근생시설)" />
               
               
               <input type="hidden" name="sendpssbyn"   value="N" />
               <input type="hidden" name="closehhmi"   value="08시 00분" />
               
                
               <tr>
					 <td><a href="#" onclick="return doMoveDataEng('selectForm0',event);">02403</a></td>
                     <td class="t_a_l"><a href="#" onclick="return doMoveDataEng('selectForm0',event);">
                     	<span class="blue2">[서비스가능] </span>서울특별시 동대문구 이문로 143-1 (이문동, 이문동근생시설)</br>143-1 Imun-ro Dongdaemun-gu Seoul
                     </a></td>
					 <td><a href="#" onclick="return doMoveDataEng('selectForm0',event);">&nbsp;</a></td>
               </tr>
               
               </form>
    
    
    
                </tbody>
            </table>
        </div>
        
            
    
    </div>
	<div class="w_550">
        <form name="zipregfrm" id="zipregfrm" action="/" method="post">
        <input type="hidden" name="form_name" value="ems_1100c" />
        <input type="hidden" name="zip_name" value="senderzipcode" /> <!-- hhseo -->
        <input type="hidden" name="areacd_name" value="" /> <!-- hhseo -->
        <input type="hidden" name="addr1_name" value="senderaddr2" />
        <input type="hidden" name="addr2_name" value="senderaddr1" />
        <input type="hidden" name="addr3_name" value="" />
        <input type="hidden" name="addr_type_name" value="S1" />

		<input type="hidden" name="addr_type" value="" />
		<input type="hidden" name="siNm"   value="" />
		<input type="hidden" name="rdNm"   value="" />
		<input type="hidden" name="bdSn"   value="" />
		<input type="hidden" name="emdNm"   value="" />
		<input type="hidden" name="confirmRangeInput"   value="true" />
		
		 
		<input type="hidden" name="sendpssbyn" value="" />
        <input type="hidden" name="closehhmi"  value="" />
        
		
			<div class="search_box ma_t_0">
				<div class="search_wrap w_auto h_auto dis_block">
					<dl class="search_txt">
						<dt class="w_120 skip"><label for="reg_zipcode">우편번호-주소</label></dt>
						<dd class="m_l_0">
							<input class="w_50" name="reg_zipcode" id="reg_zipcode" type="text" size="7" style="IME-MODE:active;" value="" title="우편번호" readonly="readonly"/>
							<input name="reg_areacd" id="reg_areacd" type="hidden" />
							<input class="w_430" name="reg_address1" id="reg_address1" type="text" size="55" style="IME-MODE:active;" value="" title="기본주소" readonly="readonly" />
						</dd>
						<dd id="liBdRange" style="display:none" class="m_l_5"><span id="spanBdRange" style="width:100px l_h_24">범위 1~38 에 대한 건물번호 지정 : </span><input class="w_100" name="bdRangeNumber" id="bdRangeNumber" type="text" size="5" maxlength="10" style="IME-MODE:active;" value="" title="건물번호"/> <a class="btn_m" href="#" title="입력확인" onclick="applyRange();">확인</a></dd>
						
                        
						<dt class="w_60 m_l_15"><label for="apart_yn2">상세주소</label></dt>
						<dd class="m_l_0">
							<input class="w_430" name="reg_address2" id="reg_address2" type="text" size="28" style="IME-MODE:active;" value="" title="상세주소" onkeyup="javascript:ck_lan(this.value);" onclick="inputchk(2);" />
						</dd>
                         
					</dl>
				</div>
			</div>
			<p class="t_a_c m_b_0">
				<a class="btn_m check" href="#streetZipcodeConfirm" title="완료" onclick="return doSubmitEng(event);">완료</a><a name="streetZipcodeConfirm"></a> 
				<a class="btn_m icon" href="#streetZipcodeCancel" title="취소" onclick="window.close();return false;">취소</a><a name="streetZipcodeCancel"></a>
			</p>
        </form>
        </div>
    </div>
</body>
</html>


