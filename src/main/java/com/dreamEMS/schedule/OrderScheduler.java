package com.dreamEMS.schedule;

import com.dreamEMS.model.entity.Order;
import com.dreamEMS.service.OrderService;
import lombok.extern.apachecommons.CommonsLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Calendar;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by MINK on 2017-06-20.
 */
@Component
@CommonsLog
public class OrderScheduler {

    @Autowired
    private OrderService orderService;

    private AtomicInteger loopCounter = new AtomicInteger();

    //@Scheduled(fixedDelay = 1000, initialDelay = 1000)
    public void testScheduler() throws Exception{

        String taskName = "task-";
        taskName = taskName + String.valueOf(loopCounter.getAndIncrement());

        log.info(taskName);
    }

    //@Scheduled(cron = "*/60 * * * * ?")
    //@Scheduled(cron = "10 00 00 * * ?")
    public void sendProcessingScheduler() throws Exception{

        log.info("Current time is :: " + Calendar.getInstance().getTime());

        List<Order> orderList = orderService.getAllPrintOrder(null);

        for (Order order : orderList){




        }



    }

}
