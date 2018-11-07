package com.hzq.ssmboot.manage.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class Goods {

    private String goods_id;
    private String goods_no;
    private String goods_name;
    private String goods_color;
    private Double goods_size;
    private String face_material;
    private String inner_material;
    private Double produce_price;
    private Double retail_price;
    private Integer inventory;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date create_time;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date modify_time;

    public Goods() {
    }

    public String getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(String goods_id) {
        this.goods_id = goods_id;
    }

    public String getGoods_no() {
        return goods_no;
    }

    public void setGoods_no(String goods_no) {
        this.goods_no = goods_no;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public String getGoods_color() {
        return goods_color;
    }

    public void setGoods_color(String goods_color) {
        this.goods_color = goods_color;
    }

    public Double getGoods_size() {
        return goods_size;
    }

    public void setGoods_size(Double goods_size) {
        this.goods_size = goods_size;
    }

    public String getFace_material() {
        return face_material;
    }

    public void setFace_material(String face_material) {
        this.face_material = face_material;
    }

    public String getInner_material() {
        return inner_material;
    }

    public void setInner_material(String inner_material) {
        this.inner_material = inner_material;
    }

    public Double getProduce_price() {
        return produce_price;
    }

    public void setProduce_price(Double produce_price) {
        this.produce_price = produce_price;
    }

    public Double getRetail_price() {
        return retail_price;
    }

    public void setRetail_price(Double retail_price) {
        this.retail_price = retail_price;
    }

    public Integer getInventory() {
        return inventory;
    }

    public void setInventory(Integer inventory) {
        this.inventory = inventory;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public Date getModify_time() {
        return modify_time;
    }

    public void setModify_time(Date modify_time) {
        this.modify_time = modify_time;
    }
}
