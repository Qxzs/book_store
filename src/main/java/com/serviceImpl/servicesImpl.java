package com.serviceImpl;

import com.mapper.userMapper;
import com.po.books;
import com.po.users;
import com.service.service;
import com.units.pageBean;
import org.apache.tools.ant.types.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import com.mapper.userMapper;

import java.util.HashMap;
import java.util.List;

public class servicesImpl implements service {
    @Autowired
    private userMapper userMapper;
    @Override
    public users loginusers(users users) {
        return this.userMapper.loginusers(users);
    }

    @Override
    public users adminlogin(users users) {
        return this.userMapper.adminlogin(users);
    }

    @Override
    public int saveUser(users users) {
        return this.userMapper.saveUser(users);
    }

    @Override
    public List<books> findbooksByName(String name) {
        return this.userMapper.findbooksByName(name);
    }

    @Override
    public List<books> findAllBook() {
        return this.userMapper.findAllBook();
    }

    @Override
    public int insertBook(books books) {
        return this.userMapper.insertBook(books);
    }

    @Override
    public books findBooksById(int i) {
        return this.userMapper.findBooksById(i);
    }

    @Override
    public int updateBook(books book) {
        return this.userMapper.updateBook(book);
    }

    @Override
    public int delBook(int id) {
        return this.userMapper.delBook(id);
    }

    @Override
    public users findUserById(int i) {
        return this.userMapper.findUserById(i);
    }

    @Override
    public int updateUsers(users users) {
        return this.userMapper.updateUsers(users);
    }

    @Override
    public List<books> start() {
        return this.userMapper.start();
    }

    @Override
    public users selectL(int userid) {
        return this.userMapper.selectL(userid);
    }

    @Override
    public int insertShop(int bookid, int userid) {
        return this.userMapper.insertShop(bookid,userid);
    }

    @Override
    public int selectCount() {
        return this.userMapper.selectCount();
    }

    @Override
    public pageBean<books> findByPage(int currentPage, int x) {

        HashMap<String, Object> map = new HashMap<String, Object>();
        pageBean<books> pageBean = new pageBean<books>();

        //封装当前页数
        pageBean.setCurrPage(currentPage);

        //每页显示的数据
        int pageSize = x;
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount = userMapper.selectCount();
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num = Math.ceil(tc / pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start", (currentPage - 1) * pageSize);
        map.put("size", pageBean.getPageSize());
        //封装每页显示的数据
        List<books> lists = userMapper.findByPage(map);
        pageBean.setLists(lists);
        return pageBean;

    }

}
