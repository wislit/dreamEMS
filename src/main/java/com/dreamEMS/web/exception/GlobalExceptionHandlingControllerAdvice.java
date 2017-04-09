/**
 * @author min gyeong
 * @since 2017. 4. 7.
 * @version 1.0
 */
package com.dreamEMS.web.exception;

import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * Performs the same exception handling as {@link ExceptionHandlingController}
 * but offers them globally. The exceptions below could be raised by any
 * controller and they would be handled here, if not handled in the controller
 * already.
 * 
 * @author Paul Chapman
 */
//@ControllerAdvice
public class GlobalExceptionHandlingControllerAdvice {

	protected Logger logger;

	public GlobalExceptionHandlingControllerAdvice() {
		logger = LoggerFactory.getLogger(getClass());
	}

	/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
	/* . . . . . . . . . . . . . EXCEPTION HANDLERS . . . . . . . . . . . . . . */
	/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

	/**
	 * Convert a predefined exception to an HTTP Status code
	 */
	@ResponseStatus(value = HttpStatus.CONFLICT, reason = "Data integrity violation")
	// 409
	@ExceptionHandler(DataIntegrityViolationException.class)
	public void conflict() {
		logger.error("Request raised a DataIntegrityViolationException");
		// Nothing to do
	}

	/**
	 * Convert a predefined exception to an HTTP Status code and specify the
	 * name of a specific view that will be used to display the error.
	 * 
	 * @return Exception view.
	 */
	@ExceptionHandler({ SQLException.class, DataAccessException.class })
	public String databaseError(Exception exception) {
		// Nothing to do. Return value 'databaseError' used as logical view name
		// of an error page, passed to view-resolver(s) in usual way.
		logger.error("Request raised " + exception.getClass().getSimpleName());
		return "databaseError";
	}

}