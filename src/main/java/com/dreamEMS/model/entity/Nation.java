package com.dreamEMS.model.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * Created by wislit on 2017. 4. 11..
 * 
 * <br>국가 기본 정보<br>
 * <br>nationCd 국가코드
 * <br>nationNm 국가명(국문)
 * <br>nationFn 국가명(영문)
 * <br>prcApplyAreaCd EMS 요금적용지역코드
 * 
 */
@Accessors(chain = true)
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Nation implements Serializable {

	
    private String nationCd;
    private String nationNm;
    private String nationFn;
    private String prcApplyAreaCd;


}
