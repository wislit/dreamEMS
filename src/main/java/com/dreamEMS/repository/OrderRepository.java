package com.dreamEMS.repository;

import com.dreamEMS.model.entity.TestTb;

import java.util.List;

/**
 * Created by MINK on 2017-05-02.
 */
public interface OrderRepository {

    List<TestTb> getTestTbList();

}
