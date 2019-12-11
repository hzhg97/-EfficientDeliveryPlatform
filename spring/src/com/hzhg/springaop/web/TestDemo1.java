package com.hzhg.springaop.web;


import com.hzhg.pojo.Book;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class TestDemo1 {
    @Test
    public void test() {
        //1. 获取到一个上下问对象
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("acc.xml");
        Book book = (Book) applicationContext.getBean("book");
        book.read();
    }
}
