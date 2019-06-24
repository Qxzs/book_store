package com.test;

import com.mapper.userMapper;
import com.po.books;
import com.po.users;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class test {
    @Test
    public void tests(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("spring-dao.xml");
        userMapper users1=(userMapper) ac.getBean("userMapper");
        users u =new users();
        u.setUserName("li");
        u.setUserPwd("123456");
        System.out.println(users1.adminlogin(u));
    }
    @Test
    public void tests1(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("spring-dao.xml");
        userMapper users1=(userMapper) ac.getBean("userMapper");
        users u =new users();
        u.setUserName("lis1");
        u.setUserPwd("123456");
        u.setUserTel("138888123");
        u.setUserAddress("惠州");
        int i = users1.saveUser(u);
        if(i>0){
            System.out.println("yes");
        }
        else{
            System.out.println("no");
        }
    }
    @Test
    public void  test3(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("spring-dao.xml");
        userMapper users1=(userMapper) ac.getBean("userMapper");
        books b = users1.findBooksById(12);
        System.out.println(b);
    }
    @Test
    public void  test4(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("spring-dao.xml");
        userMapper users1=(userMapper) ac.getBean("userMapper");
        List<books> b = users1.findbooksByName("语文");
        System.out.println(b);
    }
    @Test
    public void  test5(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("spring-dao.xml");
        userMapper users1=(userMapper) ac.getBean("userMapper");
        List<books> b = users1.findAllBook();
        System.out.println(b);
    }
    @Test
    public void  test6(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("spring-dao.xml");
        userMapper users1=(userMapper) ac.getBean("userMapper");
        List<books> b = users1.start();
        System.out.println(b.size());
    }
    @Test
    public void  test7(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("spring-dao.xml");
        userMapper users1=(userMapper) ac.getBean("userMapper");

        users u = users1.selectL(1);
        System.out.println(u);
    }


}
