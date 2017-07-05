package com.dreamEMS.repository.mybatis;

import com.dreamEMS.model.entity.Send;
import com.dreamEMS.repository.SendRepository;
import org.apache.ibatis.annotations.Mapper;

/**
 * Created by wislit on 2017. 7. 5..
 */
@Mapper
public interface SendMapper extends SendRepository{

    @Override
    boolean saveSend(Send send);
}
