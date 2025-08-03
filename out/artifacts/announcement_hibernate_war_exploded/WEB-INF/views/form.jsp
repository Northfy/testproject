<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>新增/修改公告</title>
</head>
<body>
<h2>公告表單</h2>
<form:form modelAttribute="announcement" action="/announcements/save" method="post">
    <form:hidden path="id"/>
    <p>標題: <form:input path="title"/></p>
    <p>發布日期: <form:input path="publishDate"/></p>
    <p>截止日期: <form:input path="expireDate"/></p>
    <p>作者: <form:input path="author"/></p>
    <p>內容: <form:textarea path="content"/></p>
    <p><input type="submit" value="儲存"/></p>
</form:form>
</body>
</html>