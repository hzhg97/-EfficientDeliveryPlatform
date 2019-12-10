package com.hzhg.mybatis.mapper;

import com.hzhg.mybatis.pojo.Emp;

import java.util.List;

public interface EmpMapper {
    public List<Emp> list();
    public Emp get(int uid);
}
