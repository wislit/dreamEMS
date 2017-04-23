package com.dreamEMS.model.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;

/**
 * Created by MINK on 2017-04-23.
 */
@Accessors(chain = true)
@NoArgsConstructor
@Getter
@Setter
@ToString
public class LinkMapTable {

    private Long mapId;
    private String sendDate;
    private String orderNo;
    private String officeSeq;
    private String sendprsnzipcd;
    private String sendprsnaddr1;
    private String sendprsnaddr2;
    private String sendprsnnm;

}
