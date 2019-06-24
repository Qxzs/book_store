<%--
  Created by IntelliJ IDEA.
  User: lbqljl
  Date: 2019/6/5
  Time: 23:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/update1.css">
</head>
<body>
<div id="update">
    <h4 align="center">添加图书</h4>
    <form class="form-horizontal" method="get" action="${pageContext.request.contextPath}/insert">
        <div class="form-group">
            <label class="col-xs-3 control-label">书名</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="bookName" id="bookName" placeholder="书名">
            </div>
        </div>
        <div class="form-group g" style="margin-left: 160px;width: 500px">
            <label  class="col-xs-3 control-label">简介</label>
            <textarea rows="6" cols="68" name="bookFace" id="bookFace" style="width: 285px"></textarea>
        </div>
        <div class="form-group g" style="position: relative;left: 0px; top: 20px;margin-bottom: 10px">
            <label class="col-xs-3 control-label">出版时间</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="bookCreate" id="bookCreate" placeholder="出版时间">
            </div>
        </div>
        <div class="form-group g" style="position: relative;left: 0px;">
            <label class="col-xs-3 control-label">价格</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="bookPrice" id="bookPrice" placeholder="价格">
            </div>
        </div>
        <div class="form-group g" style="position: relative;left: 0px;top: 25px;">
            <label class="col-xs-3 control-label">作者</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="bookAuthor" id="bookAuthor" placeholder="作者">
            </div>
        </div><br>
        <div class="form-group g" style="position: relative;left: 0px;">
            <label class="col-xs-3 control-label">出版社</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="bookPress" id="bookPress" placeholder="出版社">
            </div>
        </div><br><br>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <input type="submit" value="提交" class="btn btn-primary col-sm-1 left1" />
                <input type="reset" value="撤销" class="col-xs-1 left btn btn-primary" />
                <a class="btn btn-primary col-xs-1 left" href="admin.jsp">返回</a>
            </div>
        </div>
    </form>
</div>
<script>
    function toRoot() {
        window.location.href ="../jsp/admin.jsp";
    }
</script>
</body>
</html>
