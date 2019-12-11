package com.hzhg.springaop.dao;

import com.hzhg.pojo.Emp;
import org.springframework.stereotype.Repository;

@Repository
public class EmpDaoImpl implements EmpDao {
    @Override
    public Emp get(int uid) {
        Emp emp = new Emp();
        emp.setUid(1);
        emp.setUname("xxx");
        emp.setSal(1000);
        return emp;
    }
}