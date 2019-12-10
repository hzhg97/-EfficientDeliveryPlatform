package com.hzhg.mybatis.service;

import com.hzhg.mybatis.mapper.EmpMapper;
import com.hzhg.mybatis.pojo.Emp;
import com.hzhg.mybatis.utils.MybatisUtils;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.util.List;

public class EmpService {

    private EmpMapper empMapper;

    public List<Emp> list() throws IOException {
        //2. 获取session
        SqlSession sqlSession = MybatisUtils.openSession();
        //3. 获取代理对象
        empMapper = sqlSession.getMapper(EmpMapper.class);
        Emp emp = empMapper.get(1);
        System.out.println(emp);
        return empMapper.list();
    }
}
