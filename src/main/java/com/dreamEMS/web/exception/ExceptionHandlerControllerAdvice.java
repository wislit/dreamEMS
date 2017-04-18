package com.dreamEMS.web.exception;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.dreamEMS.model.dto.Errors;

import lombok.extern.apachecommons.CommonsLog;

/**
 * @author Xiaoyue Xiao
 */
@CommonsLog
@ControllerAdvice
class ExceptionHandlerControllerAdvice {

	 @ExceptionHandler({DreamEMSException.class, Exception.class})
	 @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public Object exceptionHandler(HttpServletRequest req, Exception ex, HttpServletResponse response) {
		 log.error(  req.getRequestURI() + " : " + ex.getMessage() );
		 
		 Object rvl = null;
		 String contentType = req.getHeader("Content-Type").split(";")[0];
		 HttpStatus rvlStatus = HttpStatus.INTERNAL_SERVER_ERROR;
		 Errors rvlError = Errors.SERVER_INTERNAL_ERROR;
		 
		 if(ex instanceof DreamEMSException){
			 rvlStatus = ((DreamEMSException) ex).getErrCode().getStatus();
			 rvlError =  ((DreamEMSException) ex).getErrCode();
		 }
		 
		 ModelMap model = new ModelMap();
		 	model.addAttribute("timestamp",  new Timestamp(System.currentTimeMillis()).getTime() );
		 	model.addAttribute("status", rvlStatus.value());
		 	model.addAttribute("error", ex.getMessage());
		 	model.addAttribute("exception", ex.getClass());
		 	model.addAttribute("message",  ex.getMessage());
		 	model.addAttribute("path", req.getRequestURL());
		 	model.addAttribute("isDetail", true);
	        model.addAttribute("detail", rvlError);
	        
	 	// Content-Type 확인, json 만 View를 따로 처리함.
        if(contentType!=null && MediaType.APPLICATION_JSON_VALUE.equals(contentType)){
        	rvl = new ResponseEntity<ModelMap>(model, rvlStatus);
        } else {
            //json 이 아닐경우 error page 로 이동
        	rvl = new ModelAndView("error", model);
        }
        return rvl;
    }

}
