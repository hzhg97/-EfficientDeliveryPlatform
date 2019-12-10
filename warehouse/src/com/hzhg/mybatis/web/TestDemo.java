package com.hzhg.mybatis.web;


import com.hzhg.mybatis.pojo.Emp;
import com.hzhg.mybatis.service.EmpService;
import org.junit.Test;

import java.io.IOException;
import java.util.List;

public class TestDemo {

    private EmpService empService = new EmpService();

    @Test
    public void testSelect() throws IOException {
        List<Emp> list = empService.list();
        System.out.println(list);
    }
}
