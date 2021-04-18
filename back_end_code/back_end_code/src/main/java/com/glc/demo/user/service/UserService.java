package com.glc.demo.user.service;

import com.glc.demo.user.entity.UserEntity;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface UserService {

    //注册
    public void register(UserEntity user);
    
    //删除user
    public void deleteUser(Integer userId);
    
    //查询所有user
    List<UserEntity> listUser(Map map);

    //查询user(根据userId,name)
    List<UserEntity> queryUser(String userId,String name);

    //修改user
    public void updateUser(@RequestBody UserEntity user);
       
//    //登录
//    public void login(Integer userId);
    
}
