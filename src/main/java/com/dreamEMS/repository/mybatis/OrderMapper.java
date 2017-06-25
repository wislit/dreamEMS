package com.dreamEMS.repository.mybatis;

import com.dreamEMS.model.entity.Order;
import com.dreamEMS.model.entity.TestTb;
import com.dreamEMS.repository.OrderRepository;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;

import java.util.List;

/**
 * Created by MINK on 2017-05-02.
 */
@Mapper
public interface OrderMapper extends OrderRepository {
    @Override
    List<TestTb> getTestTbList();
    Integer insertOrder(Order order);
    Integer updateOrder(Order order);
    Integer deleteOrder(Order order);
    Integer selectOrder(String orderNo);
    
    Integer selectTotalRecords();
    
    List<Order> selectAllOrder(@Param("input") DataTablesInput input, @Param("userNo") Long userNo);
    List<Order> selectAllPrintOrder(@Param("userNo") Long userNo);

    Order selectOrder(Order order);
    List<Order> selectOrders(@Param("userNo") Long userNo, @Param("orders") List<String> orders);
}
