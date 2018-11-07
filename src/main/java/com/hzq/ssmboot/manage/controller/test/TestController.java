package com.hzq.ssmboot.manage.controller.test;


import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;

//@Component
public class TestController {

    SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");

    /*每100秒执行一次*/
    @Scheduled(fixedRate = 10000)
    public void timerRate() {
        System.out.println("我是:timerRate"+dateFormat.format(new Date()));
    }

    /*第一次10秒后执行，当执行完后2秒再执行*/
    @Scheduled(initialDelay = 10000, fixedDelay = 2000)
    public void timerInit() {
        System.out.println("init : "+dateFormat.format(new Date()));
    }

    /*每天15:39:00时执行*/
    @Scheduled(cron = "0 30 18 * * ? ")
    public void timerCron() {
        System.out.println("current time : "+ dateFormat.format(new Date()));
    }

}
