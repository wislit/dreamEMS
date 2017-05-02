package com.dreamEMS.service.impl;

import com.dreamEMS.model.entity.TestTb;
import com.dreamEMS.repository.OrderRepository;
import com.dreamEMS.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by MINK on 2017-05-03.
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderRepository orderRepository;


    @Override
    public List<TestTb> getTestTbList() {
        return orderRepository.getTestTbList();
    }
}
