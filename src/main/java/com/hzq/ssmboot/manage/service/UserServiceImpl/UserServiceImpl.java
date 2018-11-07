package com.hzq.ssmboot.manage.service.UserServiceImpl;

import com.hzq.ssmboot.manage.mapper.UserMapper;
import com.hzq.ssmboot.manage.model.User;
import com.hzq.ssmboot.manage.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.UUID;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    @Override
    public void addUser(User user) {
        user.setUser_id(UUID.randomUUID().toString().replace("-",""));
        user.setCreate_time(new Date());
        userMapper.addUser(user);
    }

    @Override
    public void deleteUser(String userId) {
        userMapper.deleteUser(userId);
    }

    @Override
    public void updateUser(User user,String oldPassword) throws Exception{
        User user1 = userMapper.checkUser(user.getUser_name(),oldPassword);
        if(user1==null){
            throw new Exception("密码错误");
        }else {
            userMapper.updateUser(user);
        }

    }
}
