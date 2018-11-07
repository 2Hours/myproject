package com.hzq.ssmboot.manage.controller;

import com.hzq.ssmboot.manage.mapper.OrderMapper;
import com.hzq.ssmboot.manage.model.Goods;
import com.hzq.ssmboot.manage.model.Order;
import com.hzq.ssmboot.manage.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/order")
public class OrderController {

    @Autowired
    OrderService orderService;
    @Autowired
    OrderMapper orderMapper;

    @GetMapping(value = "/items")
    public Map<String,Object> OrderList(String orderNo,String orderType,Integer pageNum,Integer pageSize){
        Map<String,Object> map = new HashMap<>();
        map.put("order",orderMapper.findOrder(orderNo,orderType,pageNum,pageSize));
        map.put("total",orderMapper.checkOrder(null));
        return map;
    }

    @GetMapping(value = "/order-details")
    public Map<String,Object> orderDetail(String orderId){
        Map<String,Object> map = new HashMap<>();
        map.put("orderDetail",orderMapper.orderDetails(orderId));
        return map;
    }

    @PostMapping(value = "/add")
    public void addOrder(Order order, Goods goods) throws Exception{
        orderService.addOrder(order,goods);
    }

    @PostMapping(value = "/delete")
    public void deleteOrder(String orderId){
        orderService.deleteOrder(orderId);
    }

    @PostMapping("/update")
    public void updateOrder(Order order) throws Exception{
        orderService.updateOrder(order);
    }

}
