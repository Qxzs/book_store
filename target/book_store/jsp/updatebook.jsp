<%@ page import="com.po.books" %><%--
  Created by IntelliJ IDEA.
  User: lbqljl
  Date: 2019/6/6
  Time: 0:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/update1.css">
</head>
<body>
<%
    books book =(books) session.getAttribute("fBook");
%>
<div id="update">
    <h4 align="center">修改图书</h4>
    <form class="form-horizontal" method="get" action="${pageContext.request.contextPath}/update">
        <div class="form-group">
            <label class="col-xs-3 control-label">id</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="bookId" id="bookId" value="<%=book.getBookId()%>" placeholder="id">
            </div>
        </div>
        <div class="form-group">
            <label class="col-xs-3 control-label">书名</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="bookName" id="bookName" value="<%=book.getBookName()%>" placeholder="书名">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-xs-3 control-label">简介</label>
            <textarea rows="6" cols="68" name="bookFace" id="bookFace" style="margin-left: 17px;"><%=book.getBookFace()%></textarea>
        </div>
        <div class="form-group">
            <label class="col-xs-3 control-label">出版时间</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="bookCreate" id="bookCreate" value="<%=book.getBookCreate()%>" placeholder="出版时间">
            </div>
        </div>
        <div class="form-group">
            <label class="col-xs-3 control-label">价格</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="bookPrice" id="bookPrice" value="<%=book.getBookPrice()%>" placeholder="出版时间">
            </div>
        </div>

        <div class="form-group">
            <label class="col-xs-3 control-label">作者</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="bookAuthor" id="bookAuthor" value="<%=book.getBookAuthor()%>" placeholder="作者">
            </div>
        </div>
        <div class="form-group">
            <label class="col-xs-3 control-label">出版社</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="bookPress" id="bookPress" value="<%=book.getBookPress()%>" placeholder="作者">
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <input type="submit" value="提交" class="btn btn-primary col-sm-1 left1" />
                <input type="reset" value="撤销" class="col-xs-1 left btn btn-primary" />
                <a class="btn btn-primary col-xs-1 left" href="admin.jsp">返回</a>
            </div>
        </div>
    </form>
</div>

</body>
</html>
