<%@ page import="com.po.books" %><%--
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/info.css" />
    <script src="/js/jquery-2.1.0.js"></script>

</head>
<body>
<%
 books b =(books) session.getAttribute("book_info");
 String st = (String) session.getAttribute("success");
 if(st==null){

 }
 else{
     %>
<script>
    alert("添加成功")
</script>
<%
     session.removeAttribute("success");
 }
%>
<div id="topnav">
    <ul>
        <li><a href="${pageContext.request.contextPath}/outs">退出</a></li>
        <li><a href="register.jsp">请注册</a></li>
        <li><a href="login.jsp">登录</a></li>
        <li><a href="adminlogin.jsp">管理员登录</a></li>
        <li><a href="${pageContext.request.contextPath}/person">个人中心</a></li>
        <li><a href="${pageContext.request.contextPath}/person">购物车</a></li>
        <li><a href="index.jsp">首页</a></li>
        <li><a id="ret">返回</a></li>
    </ul>
</div>
<div id="search">
    <input type="text" id="findbook"/>
    <button>搜索</button>
</div>
<div id="img">
    <div id="shows">
        <img/>
    </div>

    <div id="info">

    </div>
</div>
<script src="/js/index.js"></script>
<script>

    var urls = window.location.href.split('=')[1];
    var urlId = parseInt(urls);
    var urls = "/findBookById?id="+urlId;
    $.ajax({
        url: urls,
        type: "get",
        contentType: "application/json;charset=utf-8",
        success: function (data) {
            if (data != null) {
                $("#shows img").attr("src", data.bookImg);
                $("#info").append("<p id='p1'></p>").append("<hr>").append("<div class='price'><h3></h3></div>").append("<p id ='p2' class='p2'></p>")
                    .append("<a id='a1'></a>").append("<a id='a2'></a>");
                $("#info #p1").html(data.bookName);
                $("#info .price h3").html("$"+data.bookPrice);
                $("#info #p2").html(data.bookFace);
                $("#info #a1").html("加入购物车");
                $("#info #a2").html("购买");
                $("#info #a1").attr("href","/shop?id="+data.bookId);
                $("#info #a2").click(function () {
                    alert("没钱别点我");
                })
            }
        }

        })
$("#ret").click(function () {
    window.location.href = document.referrer;
})

</script>
</body>
</html>
