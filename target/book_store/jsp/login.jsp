<%--
  Created by IntelliJ IDEA.
  User: lbqljl
  Date: 2019/6/4
  Time: 22:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.js" type="text/javascript"></script>
</head>
<body>
<%
    String str =(String) session.getAttribute("reflag");
    String s = (String) session.getAttribute("msg");
    System.out.println(s);
    if(s==null){

    }else{
        %>
<script>
    alert("请登录");
</script>
<%
        session.removeAttribute("msg");
    }
    if (str==null){

    }
    else{
%>
<script>
    alert("注册成功，请登录");
</script>
<%
        session.removeAttribute("reflag");
    }
%>
<div id="particles-js">
    <div class="login">
        <div class="login-top">
            登录
        </div>
        <div class="login-center clearfix">
            <div class="login-center-img"><img src="${pageContext.request.contextPath}/img/name.png"/></div>
            <div class="login-center-input">
                <input type="text" name="username" id="username" placeholder="请输入您的用户名" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的用户名'"/>

            </div>
        </div>
        <div class="login-center clearfix">
            <div class="login-center-img"><img src="${pageContext.request.contextPath}/img/password.png"/></div>
            <div class="login-center-input">
                <input type="password" value="" name="pwd" id="pwd"  placeholder="请输入您的密码" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的密码'" />

            </div>
        </div>
        <div class="login-center clearfix">
            <div class="login-center-img"><img src="${pageContext.request.contextPath}/img/password.png"/></div>
            <div class="login-center-input">
                <input type="text" name="" value="" name="verifyCodes" id="verifyCode" placeholder="请输入验证码" onfocus="this.placeholder=''" onblur="this.placeholder='请输入验证码'" style="width: 130px;" />
                <div class="login-center-vimg"><img src="${pageContext.request.contextPath}/getVerifyCode" onclick="changeImage()" id="verifyCodeImage"/></div>
            </div>
        </div>
        <div class="login-button" onclick="testJson()">
            登录
        </div><br />
        <h4 align="center">have not account <a href="../jsp/register.jsp" style="color: red;"> sign up</a></h4>
    </div>

</div>
<script src="${pageContext.request.contextPath}/js/handle.js" type="text/javascript"></script>
</body>
</html>
