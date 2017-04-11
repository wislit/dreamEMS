package com.dreamEMS.model.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * Created by wislit on 2017. 4. 11..
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
