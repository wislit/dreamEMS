package com.dreamEMS.model.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;

/**
 * Created by MINK on 2017-04-17.
 */
@Accessors(chain = true)
@NoArgsConstructor
@Getter
@Setter
@ToString
public class EmsSearchNewEngZipCodeInfo {

    private Integer totalCount;

    private Integer totalPage;

    private Integer countPerPage;

    private Integer currentPage;

    private String zipCode;

    private String addr;

    private String engAddr;

}
