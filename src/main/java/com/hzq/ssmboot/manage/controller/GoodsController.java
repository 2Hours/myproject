package com.hzq.ssmboot.manage.controller;

import com.hzq.ssmboot.manage.model.Goods;
import com.hzq.ssmboot.manage.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "/api/goods")
public class GoodsController {

    @Autowired
    GoodsService goodsService;

    @GetMapping(value = "/get")
    public Map<String,Object> findGoods(String goods_id,String goods_no, Double goods_size, String goods_color, Integer pageNum, Integer pageSize){
        return goodsService.findGoods(goods_id,goods_no,goods_size,goods_color,pageNum,pageSize);
    }

    @PostMapping(value = "/add")
    public void addGoods(Goods goods) {
        goodsService.addGoods(goods);
    }

    @PostMapping(value = "/delete")
    public void deleteGoods(String goodsId) {
        goodsService.deleteGoods(goodsId);
    }

    @PostMapping(value = "/update")
    public void updateGoods(Goods goods) {
        goodsService.updateGoods(goods);
    }

}
