<%@ page import="com.po.users" %><%--
  Created by IntelliJ IDEA.
  User: lbqljl
  Date: 2019/6/5
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../css/person_info.css" />
    <script src="/js/jquery-2.1.0.js"></script>
</head>
<body>

<div id="topnav">

    <%
    users u = (users) session.getAttribute("u");
    String flag = (String) session.getAttribute("flag");
    if(flag == null){

    }else{
        %>
    <script>
        alert("修改成功哟");
    </script>
    <%
        session.removeAttribute("flag");
    }
    %>
    <a href="${pageContext.request.contextPath}/outs" style="margin-left: 40px">退出</a>
    <a href="${pageContext.request.contextPath }/updateusers?id=<%=u.getUserId()%>">修改个人资料</a>
    <a href="index.jsp" style="margin-right: 30px">首页</a>
</div>
<div id="Lslider">
    <button onclick="check()">购物车</button>
    <button><a href="${pageContext.request.contextPath }/updateusers?id=<%=u.getUserId()%>">个人信息</a></button>
</div>
<div id="contents">


</div>

<script>
    function check(){
        $.ajax({
            url: "/shopcar",
            type: "get",
            contentType: "application/json;charset=utf-8",
            success: function (data) {
                for(var  i = 0;i<data.lendbooks.length;i++){
                    $("#contents").append("<a id='a"+i+"'><div class='goods'><img id='img"+i+"'><p id='p1"+i+"' class='p1'></p><p id='p2"+i+"'class='p2'></p></div></a>");
                    $("#contents #a"+i).attr("href", "/jsp/book_info.jsp?id=" +data.lendbooks[i].bookId);
                    $("#contents #img"+i).attr("src", data.lendbooks[i].bookImg);
                    $("#contents #p1"+i).html(data.lendbooks[i].bookName);
                    $("#contents #p2"+i).html(data.lendbooks[i].bookPrice);
                }
            }
        })
    }
    check()


</script>
</body>
</html>
