package com.dreamEMS.model.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;

/**
 * Created by MINK on 2017-05-04.
 */
@Accessors(chain = true)
@NoArgsConstructor
@Getter
@Setter
@ToString
public class OrderResponse {

    private String reqNo;                   // 접수번호
    private String receiveSeq;              // 주문번호
    private String regiNo;                  // 송장번호
    private String preRecevPrc;             // 우편요금
    private String prcPayMethCd;            // 요금납부방법 - 현금(10)/후납(12)
    private String treatPoRegiPoCd;         // 우편용국기호
    private String treatPoRegiPoEngNm;      // 우체국영문명
    private String orderNo;                 // 업체측 주문번호

}
