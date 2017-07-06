package com.dreamEMS.model.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by wislit on 2017. 7. 5..
 */
@Accessors(chain = true)
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Send implements Serializable {

    private static final long serialVersionUID = -5991627561969207815L;

    private Long sendNo;

    private Long userNo;

    private Date sendDate;

    private Integer orderCount;

    private Integer postPrice;

    private Integer emsPrice;




}
