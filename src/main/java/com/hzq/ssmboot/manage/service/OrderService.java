package com.hzq.ssmboot.manage.service;

import com.hzq.ssmboot.manage.model.Goods;
import com.hzq.ssmboot.manage.model.Order;

import java.util.Map;

public interface OrderService {

    void addOrder(Order order, Goods goods) throws Exception;

    void deleteOrder(String orderId);

    void updateOrder(Order order) throws Exception;

    Map<String,Object> orderDetails(String orderId);

}
