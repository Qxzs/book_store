<%@page import="com.po.books"%>
<%@page import="com.po.users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<html>
<head>
<title>document</title>
</head>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/update1.css">
<body>

<%
 users u = (users) session.getAttribute("fuser");
%>
<div id="update">
 <h4 align="center">修改资料</h4>
 <form class="form-horizontal" method="get" action="${pageContext.request.contextPath}/updateu">
     <div class="form-group">
         <label class="col-xs-3 control-label">id</label>
         <div class="col-sm-6">
             <input type="text" class="form-control" name="userId" id="userId" value="<%=u.getUserId()%>" placeholder="id" readonly>
         </div>
     </div>
  <div class="form-group">
   <label class="col-xs-3 control-label">用户名</label>
   <div class="col-sm-6">
    <input type="text" class="form-control" name="userName" id="userName" value="<%=u.getUserName()%>" placeholder="用户名">
   </div>
  </div>

  <div class="form-group">
   <label class="col-xs-3 control-label">密码</label>
   <div class="col-sm-6">
    <input type="text" class="form-control" value="<%=u.getUserPwd()%>" name="userPwd" id="userPwd" placeholder="密码">
   </div>
  </div>
  <div class="form-group">
   <label class="col-xs-3 control-label">地址</label>
   <div class="col-sm-6">
    <input type="text" class="form-control"value="<%=u.getUserAddress()%>" name="userAddress" id="userAddress" placeholder="性别">
   </div>
  </div>
  <div class="form-group">
   <label class="col-xs-3 control-label">联系方式</label>
   <div class="col-sm-6">
    <input type="text" class="form-control"value="<%=u.getUserTel()%>" name="userTel" id="userTel" placeholder="班级">
   </div>
  </div>
  <div class="form-group">
   <div class="col-sm-offset-2 col-sm-10">
    <input type="submit" value="提交" class="btn btn-primary col-sm-1 left1" />
    <input type="reset" value="撤销" class="col-xs-1 left btn btn-primary" />
    <a class="btn btn-primary col-xs-1 left" href="person_info.jsp">返回</a>
   </div>
  </div>
 </form>
</div>
</body>
</html>