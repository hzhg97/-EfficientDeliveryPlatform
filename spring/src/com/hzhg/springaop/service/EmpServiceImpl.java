package com.hzhg.springaop.service;

import com.hzhg.pojo.Emp;
import com.hzhg.springaop.dao.EmpDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmpServiceImpl implements EmpService {

    @Autowired
    private EmpDao empDao;

    @Override
    public Emp get(int uid) {
        return empDao.get(uid);
    }
}
