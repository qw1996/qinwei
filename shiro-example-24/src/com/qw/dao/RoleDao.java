package com.qw.dao;

import java.util.List;

import com.qw.entity.Role;



//角色Dao接口
public interface RoleDao {

    public Role createRole(Role role);
    public Role updateRole(Role role);
    public void deleteRole(Long roleId);

    public Role findOne(Long roleId);
    public List<Role> findAll();
}
