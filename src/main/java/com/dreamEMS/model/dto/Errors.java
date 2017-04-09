/**
 * @author min gyeong
 * @since 2017. 4. 7.
 * @version 1.0
 */
package com.dreamEMS.model.dto;

import org.springframework.http.HttpStatus;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * @author min gyeong
 */
@JsonFormat(shape= JsonFormat.Shape.OBJECT)
public enum Errors {

	SERVER_INTERNAL_ERROR	(1000,HttpStatus.CONFLICT), 
	PARAMETER_MISSING_ERROR	(1001,HttpStatus.NOT_FOUND), 
	PARAMETER_ILLEGAL_ERROR	(1002,HttpStatus.BAD_REQUEST), 
	RESOURCE_NOT_FOUND_ERROR(1003,HttpStatus.INTERNAL_SERVER_ERROR);

	private int code;
	private HttpStatus status;

	Errors(int code, HttpStatus status) {// 생성자
		this.code = code;
		this.status = status;
	}

	public int getCode() {
		return code;
	}
	
	public HttpStatus getStatus(){
		return status;
	}

}
