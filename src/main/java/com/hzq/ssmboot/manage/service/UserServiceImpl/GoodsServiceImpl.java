package com.hzq.ssmboot.manage.service.UserServiceImpl;

import com.hzq.ssmboot.manage.mapper.GoodsMapper;
import com.hzq.ssmboot.manage.model.Goods;
import com.hzq.ssmboot.manage.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.xml.soap.SAAJResult;
import java.util.*;

@Service
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    GoodsMapper goodsMapper;

    @Override
    public void addGoods(Goods goods) {
        goods.setGoods_id(UUID.randomUUID().toString().replace("-",""));
        goods.setCreate_time(new Date());
        goodsMapper.addGoods(goods);
    }

    @Override
    public void deleteGoods(String goodsId) {
        goodsMapper.deleteGoods(goodsId);
    }

    @Override
    public void updateGoods(Goods goods) {
        goodsMapper.updateGoods(goods);
    }

    @Override
    public Map<String,Object> findGoods(String goods_id,String goods_no, Double goods_size, String goods_color, Integer pageNum, Integer pageSize) {
        Map<String,Object> map = new HashMap<>();
        map.put("goods",goodsMapper.findGoods(goods_id,goods_no,goods_size,goods_color,pageNum,pageSize));
        map.put("total",goodsMapper.selectCount(goods_no,goods_size,goods_color,null,null));
        return map;
    }
}
