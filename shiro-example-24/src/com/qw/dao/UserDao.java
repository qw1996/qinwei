package com.qw.dao;

import java.util.List;

import com.qw.entity.User;



//用户Dao
public interface UserDao {

    public User createUser(User user);
    public User updateUser(User user);
    public void deleteUser(Long userId);

    User findOne(Long userId);

    List<User> findAll();

    User findByUsername(String username);

}
