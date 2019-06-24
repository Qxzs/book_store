<%--
  Created by IntelliJ IDEA.
  User: lbqljl
  Date: 2019/6/4
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/logStyle.css" />
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.js" type="text/javascript"></script>
</head>
<body>
<div id="wrap">
    <div id="nav">
        <h3>管理员登录</h3>
    </div>
    <div id="contain">
        <h3>请登录</h3>
        <hr>
        <input type="text" placeholder="用户名" name="username" id="username"><br>
        <input type="password" placeholder="密码" name="pwd" id="pwd"><br>

        <br>

        <button onclick="login()">登录</button>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/admin.js" type="text/javascript"></script>
</body>
</html>
