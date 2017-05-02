package com.dreamEMS.repository.mybatis;

import com.dreamEMS.model.entity.TestTb;
import com.dreamEMS.repository.OrderRepository;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * Created by MINK on 2017-05-02.
 */
@Mapper
public interface OrderMapper extends OrderRepository {
    @Override
    List<TestTb> getTestTbList();
}
