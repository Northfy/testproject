<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>公告列表</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="mb-0">公告列表</h2>
        <a href="${pageContext.request.contextPath}/announcements/new" class="btn btn-success">新增公告</a>
    </div>

    <table class="table table-bordered table-hover bg-white shadow-sm">
        <thead class="table-primary">
        <tr>
            <th style="width:70%;">標題</th>
            <th style="width:10%;">發布日期</th>
            <th style="width:10%;">截止日期</th>
            <th style="width:10%;"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="a" items="${list}">
            <tr>
                <td>${a.title}</td>
                <td>${a.publishDate}</td>
                <td>${a.expireDate}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/announcements/edit/${a.id}"
                       class="btn btn-sm btn-outline-primary me-1">修改</a>
                    <a href="${pageContext.request.contextPath}/announcements/delete/${a.id}"
                       class="btn btn-sm btn-outline-danger"
                       onclick="return confirm('確定要刪除這筆公告嗎？')">刪除</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <nav>
        <ul class="pagination justify-content-center mt-4">
            <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                <a class="page-link"
                   href="${pageContext.request.contextPath}/announcements?page=${currentPage > 1 ? currentPage - 1 : 1}">
                    上一頁
                </a>
            </li>

            <c:forEach begin="1" end="${totalPages}" var="p">
                <li class="page-item ${p == currentPage ? 'active' : ''}">
                    <a class="page-link"
                       href="${pageContext.request.contextPath}/announcements?page=${p}">
                            ${p}
                    </a>
                </li>
            </c:forEach>

            <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                <a class="page-link"
                   href="${pageContext.request.contextPath}/announcements?page=${currentPage < totalPages ? currentPage + 1 : totalPages}">
                    下一頁
                </a>
            </li>
        </ul>
    </nav>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
