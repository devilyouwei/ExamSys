<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="考试系统登录界面">
<meta name="keywords" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Hello Exam</title>
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

<style>
.am-alert {
	display: none;
}
</style>
<script>
	$(function() {
		var error = $("#error");
		var success = $("#success");
		if ($.trim(error.text()) != "") {
			error.fadeIn(1000);
		}
		if ($.trim(success.text()) != "") {
			success.fadeIn(1000)
			$("form").remove();
			setTimeout(function() {
				location.href = "${pageContext.request.contextPath}/User/"
			}, 2000);
		}
	});
</script>

</head>
<body>
	<div class="am-g am-margin-vertical-xl">
		<div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
			<h1 class="am-text-center">登录</h1>
			<hr>
			<div class="am-btn-group">
				<a href="#" class="am-btn am-btn-secondary am-btn-sm">
					<i class="am-icon-github am-icon-sm"></i>
					Github
				</a>
				<a href="#" class="am-btn am-btn-success am-btn-sm">
					<i class="am-icon-google-plus-square am-icon-sm"></i>
					Google+
				</a>
				<a href="#" class="am-btn am-btn-primary am-btn-sm">
					<i class="am-icon-stack-overflow am-icon-sm"></i>
					stackOverflow
				</a>
			</div>
			<br>
			<br>

			<div class="am-alert am-alert-danger" id="error" data-am-alert>${ERROR}</div>
			<div class="am-alert am-alert-success" id="success" data-am-alert>${SUCCESS}</div>
			<form method="post" class="am-form" action="<c:url value='/doLogin'/>">
				<label for="username">用户名:</label>
				<input type="text" name="username" id="username" value="">
				<br>
				<label for="password">密码:</label>
				<input type="password" name="password" id="password" value="">
				<br>
				<label for="remember-me">
					<input id="remember-me" type="checkbox">
					记住密码
				</label>
				<br />
				<div class="am-cf">
					<input type="submit" name="" value="登 录" class="am-btn am-btn-primary am-btn-sm am-fl">
					<a href="<c:url value='/register'/>" class="am-btn am-btn-primary am-btn-sm am-fr">注册</a>
				</div>
			</form>
			<hr>
			<p>© 2017 cslg, Inc. Licensed under MIT license.</p>
		</div>
	</div>
</body>
</html>
