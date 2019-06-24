package com.mapper;



import com.po.books;
import com.po.users;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface userMapper {
    public users loginusers(users users);//用户登录
    public users adminlogin(users users);//管理员登录

    public int saveUser(users users);//用户注册
//    public books findBookById(Integer id);//id找书
    public List<books> findbooksByName(String name);//书名找书

    public List<books> findAllBook();//查找所有书

    public int insertBook(books books);//添加书

    public int delBook(int id);//删除书


    public books findBooksById(@Param("bookId") int i);//ID找书

    public int updateBook(books book);//修改书信息

    public users findUserById(int i);//id找人

    public int updateUsers(users users);

    public users selectL(@Param("userId")int userid);//查看购物车

    public int insertShop(@Param("bookId")int bookid,@Param("userId")int userid);//添加到购物车

    public List<books> start();//加载完成执行

    public int selectCount();//查数据总数
    List<books> findByPage(HashMap<String,Object> map);

}
