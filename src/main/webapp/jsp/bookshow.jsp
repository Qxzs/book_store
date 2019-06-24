<%@ page import="com.po.books" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: lbqljl
  Date: 2019/6/8
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="/css/index.css" type="text/css" rel="stylesheet">
    <link href="/css/bookshow.css" type="text/css" rel="stylesheet">
    <script src="/js/jquery-2.1.0.js"></script>

</head>
<body>
<div id="topnav">
    <ul>
        <li><a href="${pageContext.request.contextPath}/outs">退出</a></li>
        <li><a href="register.jsp">请注册</a></li>
        <li><a href="login.jsp">登录</a></li>
        <li><a href="adminlogin.jsp">管理员登录</a></li>
        <li><a href="${pageContext.request.contextPath}/person">个人中心</a></li>
        <li><a href="${pageContext.request.contextPath}/person">购物车</a></li>
        <li> <a href="index.jsp" >首页</a></li>
        <li><a id="ret">返回</a></li>
    </ul>
</div>
<div id="search">
    <input type="text" id="findbook"/>
    <button>搜索</button>
</div>
<div id="bookshow"></div>
<script src="/js/index.js"></script>
<script>
    var urls = window.location.href.split('=')[1];
    var urls1 = "/searchs1?name="+urls;
    $.ajax({
        url: urls1,
        type: "get",
        contentType: "application/json;charset=utf-8",
        success: function (data) {
            for(var  i = 0;i<data.length;i++){
                $("#bookshow").append("<a id='a"+i+"'><div><img id='img"+i+"'><p id='p1"+i+"' class='p1'></p><p id='p2"+i+"'class='p2'></p></div></a>");
                $("#bookshow #a"+i).attr("href", "/jsp/book_info.jsp?id=" +data[i].bookId);
                $("#bookshow #img"+i).attr("src", data[i].bookImg);
                $("#bookshow #p1"+i).html(data[i].bookName);
                $("#bookshow #p2"+i).html(data[i].bookPrice);
            }
        }

    })
    $("#ret").click(function () {
        window.location.href = document.referrer;
    })
</script>


</body>
</html>
