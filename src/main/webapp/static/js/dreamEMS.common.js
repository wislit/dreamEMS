//date format
Date.prototype.format = function(f) {
    if (!this.valueOf()) return " ";
 
    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var d = this;
     
    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear();
            case "yy": return (d.getFullYear() % 1000).zf(2);
            case "MM": return (d.getMonth() + 1).zf(2);
            case "dd": return d.getDate().zf(2);
            case "E": return weekName[d.getDay()];
            case "HH": return d.getHours().zf(2);
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
            case "mm": return d.getMinutes().zf(2);
            case "ss": return d.getSeconds().zf(2);
            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
            default: return $1;
        }
    });
};
 
String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
Number.prototype.zf = function(len){return this.toString().zf(len);};


function ready() {
	$.alert({
	    content:  "준비중",
	    type: 'blue',
	    buttons: {
	        ok: {
	            btnClass: 'btn-info'
	        }
	    }
	});
}

function ajaxSuccess(reponse){
		$.alert({
	    content:  i18n("msg."+reponse.code),
	    type: 'green',
	    buttons: {
	        ok: {
	            btnClass: 'btn-success',
	            action: function(){
	            	location.reload();
	            }
	        }
	    }
	});
}
function ajaxError(xhr){
	
	console.log(xhr.responseText);
	var errorMsg = xhr.status +' : ' +  xhr.responseJSON.message;
	if (xhr.responseJSON.isDetail){ 
		errorMsg = errorMsg + "<br>" + i18n("err."+xhr.responseJSON.detail.code);
	}
	
	$.alert({
		    content: errorMsg,
		    //i18n("err."+xhr.responseJSON.code),
		    type: 'red',
		    buttons: {
		        ok: {
		            btnClass: 'btn-danger',
		        }
		    }
		});
}  

$(document).ready(function(){


});

$.ajaxSetup({
	contentType: "application/json;charset=utf-8"
});

$( document ).ajaxError(function( event, xhr, settings ) {
	
	
	console.log(xhr.responseText);
	var errorMsg = xhr.status +' : ' +  xhr.responseJSON.message;
	if (xhr.responseJSON.isDetail){ 
		errorMsg = errorMsg + "<br>" + i18n("err."+xhr.responseJSON.detail.code);
	}
	
	$.alert({
		    content: errorMsg,
		    //i18n("err."+xhr.responseJSON.code),
		    type: 'red',
		    buttons: {
		        ok: {
		            btnClass: 'btn-danger',
		        }
		    }
		});
	});