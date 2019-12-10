package main.pojo;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestDemo {

    @Test
    public void test() {
        //1. 获取到一个上下问对象
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:acc.xml");
        //2. ioc创建对象
        Emp emp = (Emp) applicationContext.getBean("emp");
        //3. 测试
        System.out.println(emp);
    }

}
