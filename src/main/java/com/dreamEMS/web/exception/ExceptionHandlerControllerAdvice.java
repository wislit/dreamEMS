package com.dreamEMS.web.exception;

import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.dreamEMS.constant.ErrorCode;
import com.dreamEMS.model.dto.Error;
import com.dreamEMS.model.dto.Errors;

import lombok.extern.apachecommons.CommonsLog;

/**
 * @author Xiaoyue Xiao
 */
@CommonsLog
@ControllerAdvice
class ExceptionHandlerControllerAdvice {

	@ResponseStatus(value = HttpStatus.CONFLICT, reason = "Data integrity violation")
	// 409
	@ExceptionHandler(DataIntegrityViolationException.class)
	public void conflict() {
		log.error("Request raised a DataIntegrityViolationException");
		// Nothing to do
	}
	
	@ExceptionHandler(DreamEMSException.class)
	public ModelAndView DreamEMSException(HttpServletRequest req, DreamEMSException ex, HttpServletResponse response) {
		log.error("Request raised a DreamEMSException");
		response.setStatus(ex.getErrCode().getStatus().value());
        ModelMap model = new ModelMap();
        model.addAttribute("error", ex.getErrCode());
        model.addAttribute("code", ex.getErrCode().getCode());
        model.addAttribute("message", ex.getLocalizedMessage());
        model.addAttribute("url", req.getRequestURL());
        model.addAttribute("ex", ex);
        return new ModelAndView("error", model);
	}
	
	 @ExceptionHandler(Exception.class)
    public ModelAndView exceptionHandler(HttpServletRequest req, Exception ex, HttpServletResponse response) {
		 logError(req, ex);
        
        response.setStatus(HttpStatus.INTERNAL_SERVER_ERROR.value());
        ModelMap model = new ModelMap();
        model.addAttribute("error", Errors.SERVER_INTERNAL_ERROR );
        model.addAttribute("code", Errors.SERVER_INTERNAL_ERROR.getCode());
        model.addAttribute("message", "서버에러");
        model.addAttribute("url", req.getRequestURL());
        model.addAttribute("ex", ex);
        return new ModelAndView("error", model);
    }
	
   /* @ExceptionHandler(ResourceNotFoundException.class)
    public ResponseEntity<?> resourceNotFoundExceptionHandler(HttpServletRequest request, ResourceNotFoundException e) {
        logError(request, e);

        return ResponseEntity
                .status(HttpStatus.NOT_FOUND)
                .body(new Error()
                        .setCode(ErrorCode.RESOURCE_NOT_FOUND_ERROR)
                        .setMessage(e.getMessage()));
    }

    @ExceptionHandler(ParameterIllegalException.class)
    public ResponseEntity<?> parameterIllegalExceptionHandler(HttpServletRequest request, ParameterIllegalException e) {
        logError(request, e);

        return ResponseEntity
                .status(HttpStatus.BAD_REQUEST)
                .body(new Error()
                        .setCode(ErrorCode.PARAMETER_ILLEGAL_ERROR)
                        .setMessage("An invalid value was specified for one of the query parameters in the request URL."));
    }*/

    /*@ExceptionHandler(ServerInternalErrorException.class)
    public ResponseEntity<?> serverInternalErrorExceptionHandler(HttpServletRequest request, ServerInternalErrorException e) {
        logError(request, e);

        return ResponseEntity
                .status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(new Error()
                        .setCode(ErrorCode.RESOURCE_NOT_FOUND_ERROR)
                        .setMessage("The server encountered an internal error. Please retry the request."));
    }*/

    /********************************** HELPER METHOD **********************************/
    private void logError(HttpServletRequest request, Exception e) {
        log.error("[URI: " + request.getRequestURI() + "]"
                + "[error: " + e.getMessage() + "]");
    }

}
