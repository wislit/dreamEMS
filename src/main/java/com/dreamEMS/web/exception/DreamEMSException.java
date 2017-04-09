/**
 * @author min gyeong
 * @since 2017. 4. 7.
 * @version 1.0
 */
package com.dreamEMS.web.exception;

import com.dreamEMS.model.dto.Errors;

/**
 * @author min gyeong
 */
public class DreamEMSException extends RuntimeException {
	
	private static final long serialVersionUID = 6953816791359636808L;

	private Errors errCode;

	public Errors getErrCode() {
		return errCode;
	}

	public DreamEMSException() {
		super("The server met an unexpected error. Please contact administrators.");
		this.errCode = Errors.SERVER_INTERNAL_ERROR;
	}
	
	public DreamEMSException(Errors errCode) {
		super("The server met an unexpected error. Please contact administrators.");
		this.errCode = errCode;
	}
	
	public DreamEMSException(String errMsg) {
		super(errMsg);
		this.errCode = Errors.SERVER_INTERNAL_ERROR;
	}
	
	public DreamEMSException(Errors errCode, String errMsg) {
		super(errMsg);
		this.errCode = errCode;
	}

}
