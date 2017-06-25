package com.dreamEMS.schedule;

import lombok.extern.apachecommons.CommonsLog;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Calendar;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by MINK on 2017-06-20.
 */
@Component
@CommonsLog
public class OrderScheduler {

    private AtomicInteger loopCounter = new AtomicInteger();

    //@Scheduled(fixedDelay = 1000, initialDelay = 1000)
    public void testScheduler() throws Exception{

        String taskName = "task-";
        taskName = taskName + String.valueOf(loopCounter.getAndIncrement());

        log.debug(taskName);
    }

    //@Scheduled(cron = "*/10 * * * * ?")
    //@Scheduled(cron = "10 00 00 * * ?")
    public void sendProcessingScheduler() throws Exception{

        log.debug("Current time is :: " + Calendar.getInstance().getTime());

    }

}
