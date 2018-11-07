package com.hzq.ssmboot.manage.model;


import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class User {

    private String user_id;
    private String user_name;
    private String password;
    private Integer user_type;
    private String nickname;
    private String mobile;
    private Integer sex;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date create_time;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date modify_time;

    public User() {
    }

    public User(String user_id, String user_name, String password, Integer user_type, String nickname,
                String mobile, Integer sex, Date create_time, Date modify_time) {
        this.user_id = user_id;
        this.user_name = user_name;
        this.password = password;
        this.user_type = user_type;
        this.nickname = nickname;
        this.mobile = mobile;
        this.sex = sex;
        this.create_time = create_time;
        this.modify_time = modify_time;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getUser_type() {
        return user_type;
    }

    public void setUser_type(Integer user_type) {
        this.user_type = user_type;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
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
