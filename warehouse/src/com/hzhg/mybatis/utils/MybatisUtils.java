package com.hzhg.mybatis.utils;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;

public class MybatisUtils {
    private static SqlSessionFactory sqlSessionFactory;

    static {
        try {
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream("mybatis-3-cfg.xml"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public static SqlSession openSession() {

        return sqlSessionFactory.openSession();
    }

    public static void close(SqlSession sqlSession) {
        if (sqlSession != null){
            sqlSession.close();
        }
    }

}
