package com.glc.demo.user.dao;

import com.glc.demo.user.entity.UserEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.Date;
import java.util.List;

@Mapper
public interface UserDao {

    //注册
    public int register(UserEntity user);
    
	//删除user
    public int deleteUser(Integer userId);
    
    //查询所有user
    public List<UserEntity> listUser();
	
    //查询user(根据userId,name)
    public List<UserEntity> queryUser(String userId,String name);
 
    //修改user
    public int updateUser(UserEntity user);
 
//    //登录
//    public int login(Integer userId);

}
