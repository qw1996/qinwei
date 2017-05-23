package com.qw.dao;

import java.util.List;

import com.qw.entity.Resource;



//资源Dao接口
public interface ResourceDao {

    public Resource createResource(Resource resource);
    public Resource updateResource(Resource resource);
    public void deleteResource(Long resourceId);

    Resource findOne(Long resourceId);
    List<Resource> findAll();

}
