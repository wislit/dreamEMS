package com.dreamEMS.model.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;

/**
 * Created by MINK on 2017-04-22.
 */
@Accessors(chain = true)
@NoArgsConstructor
@Getter
@Setter
@ToString
public class EmsApplyReturnData {

    private String reqNo;

    private String receiveSeq;

    private String regiNo;

    private String preRecevPrc;

    private String precPayMethod;

    private String treatPoRegiPoCd;

    private String treatPoRegiPoEngNm;

    private String orderNo;

}
