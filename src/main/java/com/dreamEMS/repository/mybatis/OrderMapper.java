package com.dreamEMS.repository.mybatis;

import com.dreamEMS.model.entity.Order;
import com.dreamEMS.model.entity.TestTb;
import com.dreamEMS.repository.OrderRepository;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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
    List<Order> selectAllOrder(@Param("userNo") Long userNo);
    List<Order> selectAllPrintOrder(@Param("userNo") Long userNo);

}
