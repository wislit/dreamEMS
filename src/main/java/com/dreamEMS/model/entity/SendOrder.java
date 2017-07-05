package com.dreamEMS.model.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * Created by wislit on 2017. 7. 5..
 */
@Accessors(chain = true)
@NoArgsConstructor
@Getter
@Setter
@ToString
public class SendOrder implements Serializable {

    private static final long serialVersionUID = -239307176230970042L;

    // core
    private Long sendNo;

    private Long orderNo;

    private String regiNo;

    private Integer seq;

    private Timestamp regDate;


    // expand
    private String countryCd;
    private String preRecevPrc;
    private Integer emsPrice;

}
