<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head lang="en">
    <meta charset="utf-8"/>
    <!-- 중략 -->
</head>
<body class=" page-404-3">
<div class="page-inner">
    <img src="/assets/layout/img/earth.jpg" class="img-responsive" alt=""></div>
<div class="container error-404">
    <h1 th:text="${status}">Status</h1>
    <h2>Houston, we have a problem([[${error}]])</h2>
    <p th:text="${message}"> Error Message</p>
    <p>
        <a href="index.html" th:href="@{/}" class="btn red btn-outline"> Return home </a>
        <br>
    </p>
    <div th:text="${timeStamp}"></div>
    <div th:text="${exception}"></div>
    <div th:utext="${trace}">Trace!</div>
</div>
</body>
</html>
