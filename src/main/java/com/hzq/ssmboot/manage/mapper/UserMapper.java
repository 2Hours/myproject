package com.hzq.ssmboot.manage.mapper;

import com.hzq.ssmboot.manage.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface UserMapper {

    User checkUser(@Param(value="username")String username, @Param(value="password")String password);

    List<User> selectUserByName(String name);

    List<User> findAllUser(@Param(value="pageNum")Integer pageNum,@Param(value="pageSize")Integer pageSize);

    void addUser(User user);

    void deleteUser(String userId);

    void updateUser(User user);

    int selectCount();
}
