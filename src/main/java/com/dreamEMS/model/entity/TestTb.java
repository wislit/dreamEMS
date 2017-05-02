package com.dreamEMS.model.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;

/**
 * Created by MINK on 2017-05-02.
 */
@Accessors(chain = true)
@NoArgsConstructor
@Getter
@Setter
@ToString
public class TestTb {
    Integer testId;
    String testName;
//    Integer test_id;
//    String test_name;
}
