package com.dreamEMS.service.impl;

import com.dreamEMS.model.entity.Send;
import com.dreamEMS.repository.SendRepository;
import com.dreamEMS.service.SendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by wislit on 2017. 7. 5..
 */
@Service
public class SendServiceImpl implements SendService {

    @Autowired
    private SendRepository sendRepository;

    @Override
    public boolean saveSend(Send send) {
        return sendRepository.saveSend(send);
    }
}
