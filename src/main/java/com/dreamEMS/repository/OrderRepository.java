package com.dreamEMS.repository;

import java.util.List;

import com.dreamEMS.model.entity.Order;
import com.dreamEMS.model.entity.TestTb;

/**
 * Created by MINK on 2017-05-02.
 */
public interface OrderRepository {

    List<TestTb> getTestTbList();
    Integer insertOrder(Order order);
    Integer updateOrder(Order order);
    Integer deleteOrder(Order order);
    Integer selectOrder(String orderNo);

}