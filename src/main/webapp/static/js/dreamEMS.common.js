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