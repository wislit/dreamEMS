package com.dreamEMS.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;

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

    Integer selectTotalRecords();
    
    List<Order> selectAllOrder(@Param("input") Map input, @Param("paging") DataTablesInput paging);
    List<Order> selectAllPrintOrder(@Param("input") Map input, @Param("paging") DataTablesInput paging);
    
    Order selectOrder(Order order);
    List<Order> selectOrders(@Param("userNo") Long userNo, @Param("orders") List<String> orders);

}
