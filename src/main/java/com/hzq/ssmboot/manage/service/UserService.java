package com.hzq.ssmboot.manage.service;

import com.hzq.ssmboot.manage.model.User;

public interface UserService {

    void addUser(User user);

    void deleteUser(String userId);

    void updateUser(User user,String oldPassword) throws Exception;

}
