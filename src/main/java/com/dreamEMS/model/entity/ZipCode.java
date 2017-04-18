package com.dreamEMS.model.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;

/**
 * Created by MINK on 2017-04-18.
 */
@Accessors(chain = true)
@NoArgsConstructor
@Getter
@Setter
@ToString
public class ZipCode {

    private String countryCode;

    private String stateOrProvinceName;

    private String cityName;

    private String postalCode;
}
