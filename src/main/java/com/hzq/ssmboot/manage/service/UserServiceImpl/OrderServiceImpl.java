package com.hzq.ssmboot.manage.service.UserServiceImpl;

import com.hzq.ssmboot.manage.mapper.GoodsMapper;
import com.hzq.ssmboot.manage.mapper.OrderMapper;
import com.hzq.ssmboot.manage.model.Goods;
import com.hzq.ssmboot.manage.model.Order;
import com.hzq.ssmboot.manage.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Map;
import java.util.UUID;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    OrderMapper orderMapper;
    @Autowired
    GoodsMapper goodsMapper;

    @Override
    public void addOrder(Order order, Goods goods) throws Exception{
        int count = goodsMapper.selectCount(goods.getGoods_no(),null,null,null,null);
        if (count<=0){
            throw new Exception("不存在该商品");
        }
        int inventory = goodsMapper.checkInventory(goods.getGoods_no());
        if (inventory<order.getNum()){
            throw new Exception("超出库存");
        }else {
            //入库单增加库存
            if (order.getOrder_type()==2) {
                goods.setInventory(inventory+order.getNum());
            }
            //出库单减少库存
            if (order.getOrder_type()==1){
                goods.setInventory(inventory-order.getNum());
            }
            order.setOrder_id(UUID.randomUUID().toString().replace("-",""));
            order.setCreate_time(new Date());
            goodsMapper.updateGoods(goods);
            System.out.println(goods.getInventory());
            orderMapper.addOrder(order);
        }
    }

    @Override
    public void deleteOrder(String orderId) {
        orderMapper.deleteOrder(orderId);
    }

    @Override
    public void updateOrder(Order order) throws Exception{
        int count = orderMapper.checkOrder(order.getOrder_id());
        if (count<=0){
            throw new Exception("订单不存在");
        }else {
            orderMapper.updateOrder(order);
        }
    }

    @Override
    public Map<String, Object> orderDetails(String orderId) {
        return null;
    }
}
