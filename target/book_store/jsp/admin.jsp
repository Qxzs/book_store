<%--
  Created by IntelliJ IDEA.
  User: lbqljl
  Date: 2019/6/5
  Time: 8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.po.users" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <link href="../css/rootmain.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.0.js"></script>
</head>
<body>
<%
    users user = (users) session.getAttribute("user");


%>
<div id="rootmain">
    <div class="nav">
        <h3>管理员</h3>
        <p class="name"><%=user.getUserName()%></p>
        <a href="${pageContext.request.contextPath }/outs">退出</a>
    </div>
</div>
<div id="con">
    <div class="sidebar">
        <button id="find" onclick="findBooks()" value="book">图书管理</button>
        <button onclick="toIndex()">图书添加</button>

    </div>
    <div class="action">
        <form>
            <input type="text" name="name" id="name" />
            <input type="button" value="搜索" onclick="searchs()"/>
        </form>
    </div>
    <div class="show">
        <c:if test="${!empty sessionScope.book}">
            <table border="1" cellpadding="10" cellspacing="0" class="tabbs" id="tab1">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>书名</th>
                    <th>简介</th>
                    <th>日期</th>
                    <th>价格</th>
                    <th>作者</th>
                    <th>出版社</th>
                    <th>操作</th>
                    <th>操作</th>
                </tr>
                </thead>
                <c:forEach items="${sessionScope.book}" var="u">
                    <tr>
                        <td>${u.bookId}</td>
                        <td>${u.bookName}</td>
                        <td>${u.bookFace }</td>
                        <td>${u.bookCreate}</td>
                        <td>${u.bookPrice}</td>
                        <td>${u.bookAuthor}</td>
                        <td>${u.bookPress}</td>
                        <td><button onclick=updateBooks(${u.bookId})>更新</button></td>
                        <td><button onclick=delBooks(${u.bookId})>删除</button></td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>

        <c:if test="${!empty sessionScope.listbook}">
            <table border="1" cellpadding="10" cellspacing="0" class="tabbs" id="tabBook">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>书名</th>
                    <th>简介</th>
                    <th>日期</th>
                    <th>价格</th>
                    <th>作者</th>
                    <th>出版社</th>

                    <th>操作</th>
                    <th>操作</th>
                </tr>
                </thead>
                <c:forEach items="${sessionScope.listbook.lists}" var="u">
                    <tr>
                        <td>${u.bookId}</td>
                        <td>${u.bookName}</td>
                        <td>${u.bookFace }</td>
                        <td>${u.bookCreate}</td>
                        <td>${u.bookPrice}</td>
                        <td>${u.bookAuthor}</td>
                        <td>${u.bookPress}</td>

                        <td><button onclick=updateBooks(${u.bookId})>更新</button></td>
                        <td><button onclick=delBooks(${u.bookId})>删除</button></td>
                    </tr>
                </c:forEach>
            </table>
            <table  border="0" cellspacing="0" cellpadding="0"  width="900px">
                <tr>
                    <td class="td2">
                        <span>第${sessionScope.listbook.currPage }/ ${sessionScope.listbook.totalPage}页</span>
                            <%--<span>总记录数：${sessionScope.listbook.totalCount }  每页显示:${sessionScope.listbook.pageSize}</span>--%>
                        <select id="ttts">
                            <option value="2">2</option>
                            <option value="4">4</option>
                            <option value="6">6</option>
                        </select>
                        <span>

       <c:if test="${sessionScope.listbook.currPage != 1}">
           <a href="${pageContext.request.contextPath }/findbooks?currentPage=1">[首页]</a>
           <a href="${pageContext.request.contextPath }/findbooks?currentPage=${sessionScope.listbook.currPage-1}">[上一页]</a>
       </c:if>

       <c:if test="${sessionScope.listbook.currPage != sessionScope.listbook.totalPage}">
           <a href="${pageContext.request.contextPath }/findbooks?currentPage=${sessionScope.listbook.currPage+1}">[下一页]</a>
           <a href="${pageContext.request.contextPath }/findbooks?currentPage=${sessionScope.listbook.totalPage}">[尾页]</a>
       </c:if>
   </span>
                    </td>
                </tr>
            </table>
        </c:if>

    </div>
</div>

<script src="../js/rootmains.js"></script>

<script>
    var num = window.location.href.split('=')[1];
    if(num!=null){
        var num1 = parse(num);
        $("#ttts").val(num1);
    }
    else{

    }


</script>
</body>
</html>
