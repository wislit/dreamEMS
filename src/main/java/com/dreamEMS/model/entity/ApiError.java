/**
 * @author min gyeong
 * @since 2017. 6. 29.
 * @version 1.0
 */
package com.dreamEMS.model.entity;

import java.util.Arrays;
import java.util.List;

import org.springframework.http.HttpStatus;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * @author min gyeong
 */

@NoArgsConstructor
@Getter
@Setter
@ToString
public class ApiError {
	 private HttpStatus status;
	    private String message;
	    private List<String> errors;
	 
	    public ApiError(HttpStatus status, String message, List<String> errors) {
	        super();
	        this.status = status;
	        this.message = message;
	        this.errors = errors;
	    }
	 
	    public ApiError(HttpStatus status, String message, String error) {
	        super();
	        this.status = status;
	        this.message = message;
	        errors = Arrays.asList(error);
	    }
}
