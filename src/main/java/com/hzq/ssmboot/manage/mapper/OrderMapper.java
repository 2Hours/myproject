package com.hzq.ssmboot.manage.mapper;

import com.hzq.ssmboot.manage.model.Order;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface OrderMapper {

    List<Order> findOrder(@Param(value = "order_no") String order_no ,@Param(value = "order_type") String order_type,@Param(value = "pageNum") Integer pageNum ,@Param(value = "pageSize") Integer pageSize);

    int checkOrder(String order_id);

    void addOrder(Order order);

    void deleteOrder(String orderId);

    void updateOrder(Order order);

    Map<String,Object> orderDetails(String orderId);

}
