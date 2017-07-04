package com.dreamEMS.model.dto;

import java.util.Date;

import org.springframework.data.jpa.datatables.mapping.DataTablesInput;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;

/**
 * @author Xiaoyue Xiao
 */
@Accessors(chain = true)
@NoArgsConstructor
@Getter
@Setter
@ToString
public class PaginatedParam extends DataTablesInput{

	private Long userNo;
	@JsonFormat(pattern="yyyy-MM-dd" , timezone ="GMT+9")
	private	Date  startDate;
	@JsonFormat(pattern="yyyy-MM-dd" , timezone ="GMT+9")
	private Date endDate;
	private String sender;			//발송인명(35)
	private String regiNo;                  // 송장번호
	
}
