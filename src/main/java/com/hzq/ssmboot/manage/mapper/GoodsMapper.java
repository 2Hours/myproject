package com.hzq.ssmboot.manage.mapper;

import com.hzq.ssmboot.manage.model.Goods;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface GoodsMapper{

    int checkInventory(String goods_no);

    void addGoods(Goods goods);

    void deleteGoods(String goodsId);

    void updateGoods(Goods goods);

    List<Goods> findGoods(@Param("goods_id") String goods_id,@Param("goods_no") String goods_no, @Param("goods_size")Double goods_size, @Param("goods_color")String goods_color,@Param("pageNum")Integer pageNum,@Param("pageSize")Integer pageSize);

    int selectCount(@Param("goods_no") String goods_no, @Param("goods_size")Double goods_size, @Param("goods_color")String goods_color,@Param("pageNum")Integer pageNum,@Param("pageSize")Integer pageSize);
}
