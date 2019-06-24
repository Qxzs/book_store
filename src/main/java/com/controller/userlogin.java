package com.controller;


import com.po.books;
import com.service.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.po.users;
import com.service.service;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.font.FontRenderContext;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import java.util.Random;


@Controller
public class userlogin {
    /**
     * 实现用户登录验证
     */
    @Autowired
    private service services;
//普通用户登录
    @RequestMapping("/logins")
    @ResponseBody
    public String login(users users,String verifiCode, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        System.out.println(users);
        String url = request.getHeader("referer");
        System.out.println(url);
        users u = services.loginusers(users);
        session.setAttribute("u", u);
        String sessionVerifyCode = (String) session.getAttribute("verifyCodeValue");
        String str = sessionVerifyCode.toLowerCase();//验证码大小写转换，无论大小写
        verifiCode = verifiCode.toLowerCase();//验证码大小写转换，无论大小写
        if (!verifiCode.equals(str)) {
            return "2";
        } else if (u == null) {
            return "0";
        }else {
            return "1";
        }

    }
//    管理员登录
    @RequestMapping("/adminlogins")
    @ResponseBody
    public int adminlogin(users users, HttpSession session, HttpServletRequest request) {
        users u = services.adminlogin(users);
        session.setAttribute("user",u);
         if(u==null){
            return 0;
        }
        else{
            return 1;
        }
    }

    @RequestMapping("/outs")
    @ResponseBody
    public String toOut(HttpSession session, HttpServletResponse response) {
        session.invalidate();
        try {
            response.sendRedirect("../jsp/index.jsp");
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    /* 获取校验码 */
    @RequestMapping("/getVerifyCode")
    @ResponseBody
    public void generate(HttpServletResponse response, HttpSession session) {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        String verifyCodeValue = drawImg(output);
        session.setAttribute("verifyCodeValue", verifyCodeValue);
        try {
            ServletOutputStream out = response.getOutputStream();
            output.writeTo(out);

        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    /**
     * 绘画验证码
     *
     * @param output
     * @return
     */
    private String drawImg(ByteArrayOutputStream output) {
        String code = "";
        // 随机产生4个字符
        for (int i = 0; i < 4; i++) {
            code += randomChar();
        }
        int width = 70;
        int height = 25;
        BufferedImage bi = new BufferedImage(width, height,
                BufferedImage.TYPE_3BYTE_BGR);
        Font font = new Font("Times New Roman", Font.PLAIN, 20);
        // 调用Graphics2D绘画验证码
        Graphics2D g = bi.createGraphics();
        g.setFont(font);
        Color color = new Color(66, 2, 82);
        g.setColor(color);
        g.setBackground(new Color(226, 226, 240));
        g.clearRect(0, 0, width, height);
        FontRenderContext context = g.getFontRenderContext();
        Random r = new Random();
        for(int i=0;i<20;i++){

            g.setColor(new Color(r.nextInt(255), r.nextInt(255), r.nextInt(255)));;
            //画圆
            g.fillOval(r.nextInt(75),r.nextInt(30),5,5);
        }
        Rectangle2D bounds = font.getStringBounds(code, context);
        double x = (width - bounds.getWidth()) / 2;
        double y = (height - bounds.getHeight()) / 2;
        double ascent = bounds.getY();
        double baseY = y - ascent;
        g.drawString(code, (int) x, (int) baseY);
        g.dispose();
        try {
            ImageIO.write(bi, "jpg", output);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return code;
    }

    /**
     * 随机参数一个字符
     *
     * @return
     */
    private char randomChar() {
        Random r = new Random();
        String s = "ABCDEFGHJKLMNPRSTUVWXYZ0123456789";
        return s.charAt(r.nextInt(s.length()));
    }

    // 注册
    @RequestMapping(value = "/saveuser")
    @ResponseBody
    public String insert(users u, HttpServletResponse response, HttpServletRequest request, HttpSession session){

        int i = services.saveUser(u);
        if (i>0) {
            session.setAttribute("reflag","1");
            try {
                response.sendRedirect("../jsp/login.jsp");
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        return null ;
    }

//    个人中心、购物车,购物车的拦截器处理
    @RequestMapping(value = "/person")
    @ResponseBody
    public String intoperson(users u, HttpServletResponse response, HttpServletRequest request, HttpSession session) {
        try {
            response.sendRedirect("../jsp/person_info.jsp");
        }catch (Exception e){
            System.out.println(e);
        }
        return "0";
    }
    @RequestMapping(value = "/shop")
    @ResponseBody
    public String intoshop(int id, HttpServletResponse response, HttpServletRequest request, HttpSession session) {
        books b = services.findBooksById(id);
        users user = (users) session.getAttribute("u");
        int userid = user.getUserId();
        int bookid = b.getBookId();
        System.out.println(userid+" "+bookid);
        int i = services.insertShop(bookid,userid);
        if(i>0){
            try {
                session.setAttribute("success","添加成功");
                response.sendRedirect("../jsp/book_info.jsp?id="+b.getBookId());
            }catch (Exception e){
                System.out.println(e);
            }
        }
        return null;
    }
    //管理员搜索书
    @RequestMapping("/searchs")
    @ResponseBody
    public String searchss(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,String name, HttpSession session) {
        String str = "";
        List<books> books = null;
        try {
            str = URLDecoder.decode(name, "utf-8");
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        books = services.findbooksByName(str);
        System.out.println(books);
        if (books!=null) {
            session.setAttribute("book", books);
            return "../jsp/admin.jsp";
        }
        return null;
    }
   //用户搜素
    @RequestMapping("/searchs1")
    @ResponseBody
    public List<books> searchss1(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,String name, HttpSession session) {
        String str = "";
        List<books> books = null;
        try {
            str = URLDecoder.decode(name, "utf-8");
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        books = services.findbooksByName(str);
        System.out.println(books);
        if (books!=null) {
            session.setAttribute("books", books);
            session.removeAttribute("listbook");
            return books;
        }
        return null;
    }
    @RequestMapping("/findbook")
    @ResponseBody
    public String findbook(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage, HttpSession session, HttpServletResponse response,@RequestParam(value = "x", defaultValue = "2", required = false)int x) {
        session.setAttribute("listbook", services.findByPage(currentPage,x));//回显分页数据
        session.setAttribute("num",x);
        session.removeAttribute("book");
        session.removeAttribute("listuser");

        return "../jsp/admin.jsp?x="+x;
    }

    @RequestMapping("/insert")
    @ResponseBody
    public String insertBook(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage, HttpSession session, HttpServletRequest request, HttpServletResponse response,@RequestParam(value = "x", defaultValue = "2", required = false)int x,books books) {
//
        int i = services.insertBook(books);
        if (i > 0) {
            List<books> books1 = services.findAllBook();
            session.setAttribute("listbook", services.findByPage(currentPage,x));
        }
        try {
            response.sendRedirect("../jsp/admin.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping("/findbooks")
    @ResponseBody
    public String findbooks(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,@RequestParam(value = "x", defaultValue = "2", required = false)int x, HttpSession session, HttpServletResponse response) {
        session.setAttribute("listbook", services.findByPage(currentPage,x));//回显分页数据
        try {
            session.setAttribute("num",x);
            response.sendRedirect("../jsp/admin.jsp");
        } catch (Exception e) {
            System.out.println(e);
        }
        return "document.referrer";
    }
//    查找修改的信息
    @RequestMapping("/updateBooks")
    @ResponseBody
    public String findID(int bookId,@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage, HttpSession session) {

        books b = services.findBooksById(bookId);
        if (b != null) {
            session.setAttribute("fBook", b);
        }
        return "../jsp/updatebook.jsp";
    }
    @RequestMapping("/update")
    @ResponseBody
    public String updatebook(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,
                             HttpSession session, HttpServletRequest request,
                             HttpServletResponse response,@RequestParam(value = "x", defaultValue = "2",
            required = false)int x,books books) {
          System.out.println(books);
        int x1 = services.updateBook(books);
        if (x1 > 0) {
            session.setAttribute("listbook", services.findByPage(currentPage,x));
        }
        try {
            response.sendRedirect("../jsp/admin.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping("/delBook")
    @ResponseBody
    public String del(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage, String id, HttpSession session,@RequestParam(value = "x", defaultValue = "2", required = false)int x) {
        int ids = Integer.valueOf(id);
        int i = services.delBook(ids);
        if (i > 0) {
            session.setAttribute("listbook", services.findByPage(currentPage,x));
            return "../jsp/admin.jsp";
        }
        return null;
    }
    @RequestMapping("/updateusers")
    @ResponseBody
    public String updateusers(int id ,HttpSession session,HttpServletResponse response){
        users u = services.findUserById(id);
        if (u!=null){
            session.setAttribute("fuser",u);
        }
        try {
            response.sendRedirect("../jsp/updateuser.jsp");
        }catch (Exception e){
            System.out.println(e);
        }
        return null;
    }

    @RequestMapping("/updateu")
    @ResponseBody
    public String updates(HttpSession session,HttpServletRequest request,HttpServletResponse response,users users){
     System.out.println(users);
    int x = services.updateUsers(users);
     if(x>0){
        session.setAttribute("user",services.findUserById(users.getUserId()));
    }
     try {
         session.setAttribute("flag","flag");
        response.sendRedirect("../jsp/person_info.jsp");
    } catch (IOException e) {
        e.printStackTrace();
    }
        return null;
}

    @RequestMapping("start")
    @ResponseBody
    public List<books> start(HttpSession session){
        List<books> book = services.start();
        return book;
}
     @RequestMapping("/findBookById")
     @ResponseBody
     public books findBookById(int id,HttpSession session){
         System.out.println(id);
         books b = services.findBooksById(id);
         System.out.println(b);
         session.setAttribute("book_info",b);
         return b;
     }
     @RequestMapping("/shopcar")
     @ResponseBody
     public users selectshop(HttpSession session,HttpServletResponse response) {
        users user =  (users) session.getAttribute("u");
         int userid = user.getUserId();
         users u = services.selectL(userid);
         System.out.println(u);
            return u;
     }
}
