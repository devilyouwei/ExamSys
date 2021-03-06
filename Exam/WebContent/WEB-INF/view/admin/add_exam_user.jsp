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
<!-- Set render engine for 360 browser -->
<meta name="renderer" content="webkit">
<!-- No Baidu Siteapp-->
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!-- Add to homescreen for Chrome on Android -->
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
	<h1 class="am-text-center am-padding-vertical">考试后台管理系统</h1>
	<div class="am-g am-container">
		<div class="am-u-sm-2">
			<ul class="am-nav">
				<li class="am-text-center">
					<b>管理员：${sessionScope.admin.username }</b>
				</li>
				<li class="am-active">
					<a href="<c:url value='/Admin/'/>">试卷管理</a>
				</li>
				<li>
					<a href="<c:url value='/Admin/showUser'/>">用户管理</a>
				</li>
				<li>
					<a href="<c:url value='/logout'/>">退出</a>
				</li>
				<li>
					<a href="<c:url value='/about'/>">关于</a>
				</li>
			</ul>
		</div>
		<div class="am-u-sm-10">
			<h2>${EXAM.title}</h2>
			<h3>已选考生</h3>
			<table class="am-table">
				<tr>
					<th>学生编号</th>
					<th>姓名</th>
					<th>做否</th>
					<th>分数</th>
					<th>操作</th>
				</tr>
				<c:forEach var="eu" items="${EU}">
					<tr>
						<td>${eu.uid}</td>
						<td>${eu.username}</td>
						<td>${eu.done}</td>
						<td>${eu.score}</td>
						<td>
							<a href="<c:url value='/Admin/delExamUser?id=${eu.id}&cpage=${CPAGE}&eid=${EXAM.id}'/>">踢出</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<br />
			<h3>选择考生</h3>
			<table class="am-table am-table-bordered">
				<thead>
					<tr>
						<th>用户编号</th>
						<th>用户名</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="u" items="${USERS}">
						<tr>
							<td>${u.id}</td>
							<td>${u.username}</td>
							<td>
								<a href="<c:url value='/Admin/addOneUser?eid=${EXAM.id}&cpage=${CPAGE}&uid=${u.id}'/>">插入</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<ul class="am-pagination am-pagination-centered">
				<c:if test="${(CPAGE-1)>=0}">
					<li>
						<a href="<c:url value='/Admin/addExamUser?cpage=${CPAGE-1}&eid=${EXAM.id}'/>">&laquo;</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="1" end="${PAGES}">
					<li <c:if test="${i == CPAGE+1}"> class="am-active" </c:if>>
						<a href="<c:url value='/Admin/addExamUser?cpage=${i-1}&eid=${EXAM.id}'/>">${i}</a>
					</li>
				</c:forEach>
				<c:if test="${(CPAGE+1)<=(PAGES-1)}">
					<li>
						<a href="<c:url value='/Admin/addExamUser?cpage=${CPAGE+1}&eid=${EXAM.id}'/>">&raquo;</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>