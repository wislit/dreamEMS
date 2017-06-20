package com.dreamEMS.model.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * Created by MINK on 2017-06-06.
 */
@Accessors(chain = true)
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Tracking implements Serializable {

    // TODO: 2017-06-06 직렬화 ID 생성

    private String senderNm;

    private String receiverNm;

    private String regiNo;

    private String mailTypeNm;

    private String mailKindNm;

    private String deliveryDate;

    private String deliveryYn;

    private String signerNm;

    private String relationNm;

    private String connectedRegino;

    private String postmanNm;

    private String inboundOutboundNm;

    private String recvPostZipCd;

    private String recvPostTelNo;

    private String destCountryCd;

    private String destCountryNm;

    private String gcDate;

    private String postImpcCd;

    private String receiverZipCd;

    private String customsFailedNm;

    private String sendCnt;

    private String sendFlightNo;

    private String airDate;

    private String deliPostTelNo;

    private String sortingDate;

    private String eventHms;

    private String eventRegiPoNm;

    private String delivRsltNm;

    private String noDelivReasnNm;

    private String eventNm;

    private String eventYmd;

    private String upuCd;

    private String compMgmtNo;

}
