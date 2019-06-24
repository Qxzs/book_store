<%@ page import="java.util.List" %>
<%@ page import="com.po.books" %><%--
  Created by IntelliJ IDEA.
  User: lbqljl
  Date: 2019/6/4
  Time: 22:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>品如书城</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css" />
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.js" type="text/javascript"></script>
</head>
<body>
<%

%>
<div id="topnav">
    <ul>
        <li><a href="${pageContext.request.contextPath}/outs">退出</a></li>
        <li><a href="register.jsp">请注册</a></li>
        <li><a href="login.jsp">登录</a></li>
        <li><a href="adminlogin.jsp">管理员登录</a></li>
        <li><a href="${pageContext.request.contextPath}/person">个人中心</a></li>
        <li><a href="${pageContext.request.contextPath}/person">购物车</a></li>


    </ul>
</div>
<div id="search">
    <input type="text" id="findbook"/>
    <button>搜索</button>
</div>
<div id="content">
    <div class="show">
        <img src="${pageContext.request.contextPath}/img/lb1.jpg" style="display: block;">
        <img src="${pageContext.request.contextPath}/img/lb2.jpg">
        <img src="${pageContext.request.contextPath}/img/lb3.jpg">
        <img src="${pageContext.request.contextPath}/img/lb4.jpg">
        <img src="${pageContext.request.contextPath}/img/lb5.jpg">
        <ul class="smallpic">
            <li style="background-color: red;"></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>
    <div class="goodsshow">

    </div>
</div>
<div id="foot">
    <h3 align="center">welcome</h3>
</div>
<script src="${pageContext.request.contextPath}/js/index.js" type="text/javascript"></script>
</body>
</html>
