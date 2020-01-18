<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="考试系统管理员">
<meta name="keywords" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>考试系统后台管理系统-${sessionScope.admin.username}</title>
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="mobile-web-app-capable" content="yes">

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css">
<!--[if (gte IE 9)|!(IE)]><!-->
<script src="${pageContext.request.contextPath}/assets/js/jquery.js"></script>
<!--<![endif]-->
<!--[if lte IE 8 ]>
        <script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/amazeui.ie8polyfill.min.js"></script>
        <![endif]-->
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>

</head>

<body>
	<header class="am-topbar">
		<h1 class="am-topbar-brand">
			<a href="#">欢迎：${sessionScope.user.username}</a>
		</h1>
		<div class="am-topbar-right">
			<a class="am-btn am-btn-primary am-topbar-btn am-btn-sm" href="<c:url value='/logout'/>">退出</a>
		</div>
	</header>
	<div class="am-container">
		<h2 class="am-text-center">我的考试</h2>
		<table class="am-table">
			<thead>
				<tr>
					<th>标题：</th>
					<th>时长：</th>
					<th>得分：</th>
					<th>创建时间：</th>
					<th>操作：</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${EUS}" var="eu">
					<tr>
						<td>${eu.title}</td>
						<td>${eu.time}</td>
						<td>${eu.score}</td>
						<td>${eu.createTime}</td>
						<td>
							<c:if test="${eu.done}">
								<a href="" class="am-btn am-btn-default am-disabled">已做</a>
							</c:if>
							<c:if test="${!eu.done}">
								<a href="<c:url value='/User/exam?id=${eu.id}'/>" class="am-btn am-btn-primary">马上去做</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
