<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>公告列表</title>
</head>
<body>
<h2>公告列表</h2>
<a href="announcements/new">新增公告</a>
<table border="1">
    <tr><th>標題</th><th>發布日</th><th>截止日</th><th>操作</th></tr>
    <c:forEach var="a" items="${list}">
        <tr>
            <td>${a.title}</td>
            <td>${a.publishDate}</td>
            <td>${a.expireDate}</td>
            <td>
                <a href="edit/${a.id}">修改</a>
                <a href="delete/${a.id}">刪除</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>