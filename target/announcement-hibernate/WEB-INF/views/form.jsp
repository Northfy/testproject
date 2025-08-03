<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>新增/修改公告</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- flatpickr 日期選擇器 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="mb-4">公告表單</h2>

    <form:form modelAttribute="announcement" action="${pageContext.request.contextPath}/announcements/save"
               method="post"
               class="border rounded p-4 bg-white shadow-sm">

        <form:hidden path="id"/>

        <div class="mb-3">
            <label class="form-label">標題</label>
            <form:input path="title" cssClass="form-control" required="required"/>
        </div>

        <div class="mb-3">
            <label class="form-label">發布日期</label>
            <form:input path="publishDate" cssClass="form-control" id="publishDate"/>
        </div>

        <div class="mb-3">
            <label class="form-label">截止日期</label>
            <form:input path="expireDate" cssClass="form-control" id="expireDate"/>
        </div>

        <div class="mb-3">
            <label class="form-label">作者</label>
            <form:input path="author" cssClass="form-control"/>
        </div>

        <div class="mb-3">
            <label class="form-label">內容</label>
            <form:textarea path="content" cssClass="form-control" rows="5"/>
        </div>

        <div class="d-flex justify-content-between">
            <button type="button" onclick="location.href='${pageContext.request.contextPath}/announcements'"
                    class="btn btn-secondary">
                回公告列表
            </button>
            <input type="submit" value="儲存" class="btn btn-primary"/>
        </div>
    </form:form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- flatpickr JS & 中文語系 -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/zh_tw.js"></script>
<script>
    flatpickr("#publishDate", {
        dateFormat: "Y-m-d",
        "locale": "zh_tw"
    });
    flatpickr("#expireDate", {
        dateFormat: "Y-m-d",
        "locale": "zh_tw"
    });
</script>
</body>
</html>
