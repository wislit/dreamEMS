/**
 * @author min gyeong
 * @since 2017. 4. 9.
 * @version 1.0
 */
package com.dreamEMS.model.dto;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * @author min gyeong
 */
@JsonFormat(shape= JsonFormat.Shape.OBJECT)
public enum Msg {
	
	SAVE_USER	(1000, "사용자가 등록되었습니다.");

	private int code;
	private String desc;
	
	Msg(int code, String desc) {// 생성자
		this.code = code;
		this.desc = desc;
	}

	public int getCode() {
		return code;
	}
	
	public String getDesc(){
		return desc;
	}
}
