package com.dreamEMS.web.exception;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import com.dreamEMS.model.dto.Errors;
import com.dreamEMS.model.entity.ApiError;

import lombok.extern.apachecommons.CommonsLog;

/**
 * @author Xiaoyue Xiao
 */
@CommonsLog
@ControllerAdvice
class ExceptionHandlerControllerAdvice extends ResponseEntityExceptionHandler {

	 @ExceptionHandler({DreamEMSException.class, Exception.class})
	 @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public Object exceptionHandler(HttpServletRequest req, Exception ex, HttpServletResponse response) {
		 log.error(  req.getRequestURI() + " : " + ex.getMessage() );
		 
		 Object rvl = null;
		 
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

		 rvl = new ModelAndView("error", model);

		 if ( req.getHeader("Content-Type") != null ){
			 String contentType = req.getHeader("Content-Type").split(";")[0];
			 // Content-Type 확인, json 만 View를 따로 처리함.
			 if(contentType!=null && MediaType.APPLICATION_JSON_VALUE.equals(contentType))
				 rvl = new ResponseEntity<ModelMap>(model, rvlStatus);
		 }
	        
        return rvl;
    }
	 
	 @Override
	 protected ResponseEntity<Object> handleMethodArgumentNotValid(
	   MethodArgumentNotValidException ex, 
	   HttpHeaders headers, 
	   HttpStatus status, 
	   WebRequest request) {
	     List<String> errors = new ArrayList<String>();
	     for (FieldError error : ex.getBindingResult().getFieldErrors()) {
	         errors.add(error.getField() + ": " + error.getDefaultMessage());
	     }
	     for (ObjectError error : ex.getBindingResult().getGlobalErrors()) {
	         errors.add(error.getObjectName() + ": " + error.getDefaultMessage());
	     }
	      
	     ApiError apiError = 
	       new ApiError(HttpStatus.BAD_REQUEST, ex.getLocalizedMessage(), errors);
	     return handleExceptionInternal(ex, apiError, headers, apiError.getStatus(), request);
	 }

}
