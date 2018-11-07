package com.hzq.ssmboot.manage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/view")
public class ViewController {

    @GetMapping(value = "/admin-login.html")
    public String login(){
        return "adminLogin";
    }

    @GetMapping(value = "/user-list.html")
    public String userList(){
        return "userList";
    }

    @GetMapping(value = "/head.html")
    public String head(){
        return "head";
    }

    @RequestMapping(value = "/goods-list.html")
    public String goodsList(){
        return "GoodsList";
    }

    @RequestMapping(value = "/order-list.html")
    public String orderList(){
        return "OrderList";
    }

    @RequestMapping(value = "/test.html")
    public String test(){
        return "test";
    }

    @RequestMapping(value = "/login.html")
    public String userlog(){
        return "user/login";
    }

    @RequestMapping(value = "/index.html")
    public String index(){
        return "user/index";
    }

    @RequestMapping(value = "/introduce.html")
    public String introduce(){
        return "user/introduce";
    }

    @RequestMapping(value = "/house_list.html")
    public String house_list(){
        return "user/house_list";
    }

    @RequestMapping(value = "/house_edit.html")
    public String house_edit(){
        return "user/house_edit";
    }

    @RequestMapping(value = "/loupanchart.html")
    public String loupanchart(){
        return "user/loupanchart";
    }

}
