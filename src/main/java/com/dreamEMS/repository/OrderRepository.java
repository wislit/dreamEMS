package com.dreamEMS.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dreamEMS.model.dto.PaginatedParam;
import com.dreamEMS.model.entity.Order;
import com.dreamEMS.model.entity.TestTb;

/**
 * Created by MINK on 2017-05-02.
 */
public interface OrderRepository{

    List<TestTb> getTestTbList();
    Integer insertOrder(Order order);
    Integer updateOrder(Order order);
    Integer deleteOrder(Order order);
    Integer selectOrder(String orderNo);
    Integer updateOrderStatus(Order order);
    Integer updateOrderPrint(@Param("orders") List<String> orders);

    Integer selectTotalRecords();
    
    List<Order> selectAllOrder(@Param("input") PaginatedParam input);
    List<Order> selectAllPrintOrder(@Param("input") PaginatedParam input);
    
    Order selectOrder(Order order);
    List<Order> selectOrders(@Param("userNo") Long userNo, @Param("orders") List<String> orders);

}
