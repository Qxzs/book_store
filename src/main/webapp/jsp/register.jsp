<%--
  Created by IntelliJ IDEA.
  User: lbqljl
  Date: 2019/6/4
  Time: 22:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
    <script src="/js/jquery-2.1.0.js"></script>
</head>
<body>
<div class="register-container container">
    <div class="row">

        <div class="register span6">
            <form action="${pageContext.request.contextPath}/saveuser" method="post">
                <h2>注册</h2>

                <label for="userName">username</label>
                <input type="text" id="userName" name="userName" placeholder="enter your username...">
                <label for="userPwd">Password</label>
                <input type="password" id="userPwd" name="userPwd" placeholder="choose a password...">
                <label for="userTel">tel</label>
                <input type="text" id="userTel" name="userTel" placeholder="enter you tel...">
                <label for="userAddress">address</label>
                <input type="text" id="userAddress" name="userAddress" placeholder="enter you address...">

                <button type="submit" id="btn">REGISTER</button>
            </form>
        </div>
    </div>
</div>
<script>
    $("#btn").click(function () {
        var username = $("#userName").val();
        var userpwd = $("#userPwd").val();
        var usertel = $("#userTel").val();
        var useraddress = $("#userAddress").val();
        console.log(usertel,userpwd,useraddress,username);
        if(username ==""||useraddress ==null||userpwd ==null||usertel==null){
            alert("请把数据填完整");
            return false;
        }else{
            return true;
        }
    })
</script>
</body>
</html>
