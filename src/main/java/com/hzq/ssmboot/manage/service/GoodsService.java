package com.hzq.ssmboot.manage.service;

import com.hzq.ssmboot.manage.model.Goods;

import java.util.List;
import java.util.Map;

public interface GoodsService {

    void addGoods(Goods goods);

    void deleteGoods(String goodsId);

    void updateGoods(Goods goods);

    Map<String,Object> findGoods(String goods_id,String goods_no, Double goods_size, String goods_color, Integer pageNum, Integer pageSize);

}
