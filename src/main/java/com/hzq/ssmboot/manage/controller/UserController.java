package com.hzq.ssmboot.manage.controller;

import com.hzq.ssmboot.manage.mapper.UserMapper;
import com.hzq.ssmboot.manage.model.User;
import com.hzq.ssmboot.manage.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "/api/user")
public class UserController {

    @Autowired
    UserMapper userMapper;
    @Autowired
    UserService userService;

    @GetMapping("/login")
    public String login(String username,String password,HttpServletRequest request) throws Exception {
        User user = userMapper.checkUser(username,password);
        if(user==null){
            throw new Exception("用户信息不正确");
        }else {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
        }
        return "success";
    }

    @PostMapping("/logout")
    public Boolean logout(HttpServletRequest request,HttpSession session){
        session.removeAttribute("user");
        return true;
    }

    @GetMapping(value = "/{username}/get")
    public List<User> searchUser(@PathVariable(name = "username") String username) {
        return userMapper.selectUserByName(username);
    }

    @GetMapping(value = "/items")
    public Map<String,Object> userList(Integer pageNum,Integer pageSize){
        Map<String,Object> map = new HashMap<>();
        map.put("user",userMapper.findAllUser(pageNum,pageSize));
        map.put("total",userMapper.selectCount());
        return map;
    }

    @PostMapping(value = "/add")
    public void addUser(User user){
        userService.addUser(user);
    }

    @PostMapping(value = "/update")
    public void updateUser(User user,String oldPassword) throws Exception {
        userService.updateUser(user,oldPassword);
    }

    @PostMapping(value = "/delete")
    public void deleteUser(String id){
        userService.deleteUser(id);
    }

}
